import { createClient, type User as AuthUser } from '@supabase/supabase-js';
import { User, Post, Group, ChatMessage, PostVisibility, ReactionType, SafetyReport, GrowPlant, Story, GameScore, Strain, StrainPhoto, StrainReview, StrainChatMessage, PostComment, ReportCategory, MatchItInteraction, Widget } from '../types';

const sanitizeHandle = (raw: string): string => {
  const cleaned = raw.toLowerCase().replace(/^@/, '').replace(/[^a-z0-9_]/g, '');
  return cleaned.slice(0, 24) || 'user';
};

const deriveProfileFromAuthUser = (authUser: AuthUser): { name: string; handle: string; dob?: string } => {
  const meta = authUser.user_metadata || {};
  const name =
    meta.name ||
    meta.full_name ||
    meta.display_name ||
    authUser.email?.split('@')[0] ||
    'User';
  const rawHandle = meta.handle || meta.username || name;
  const dob = meta.date_of_birth || meta.dob || undefined;
  return { name: String(name).slice(0, 80), handle: sanitizeHandle(String(rawHandle)), dob };
};

const mapProfileRow = (data: Record<string, unknown>): User => {
  const mockBadges = [
    { id: '1', name: 'First Toke', description: 'You created your account!', icon: '💨' },
    { id: '2', name: 'Strain Explorer', description: 'You viewed your first strain.', icon: '🗺️' },
    { id: '3', name: 'Puff Puff Post', description: 'You made your first post.', icon: '✍️' },
  ];
  return {
    ...data,
    distanceRadius: (data.distance_radius as number) || 25,
    city: data.city,
    state: data.state,
    badges: data.badges && Array.isArray(data.badges) && data.badges.length > 0 ? data.badges : mockBadges,
    dateOfBirth: data.date_of_birth,
    status: data.status,
    role: data.role,
  } as User;
};

const generateUniqueHandle = async (baseHandle: string, userId: string): Promise<string> => {
  let candidate = sanitizeHandle(baseHandle);
  const suffix = userId.replace(/-/g, '').slice(0, 8);

  for (let attempt = 0; attempt < 5; attempt++) {
    const { data: existing } = await supabase
      .from('profiles')
      .select('id')
      .eq('handle', candidate)
      .maybeSingle();

    if (!existing || existing.id === userId) return candidate;

    candidate =
      attempt === 0
        ? sanitizeHandle(`${baseHandle}_${suffix}`)
        : sanitizeHandle(`user_${suffix}${attempt > 1 ? String(attempt) : ''}`);
  }

  return `user_${suffix}`;
};

/** Ensures a StrainVerse profile exists for any shared Verse auth user (e.g. Cookbook signups). */
const ensureStrainVerseProfile = async (authUser: AuthUser): Promise<{ ok: boolean; error?: string }> => {
  const { data: existing } = await supabase
    .from('profiles')
    .select('id')
    .eq('id', authUser.id)
    .maybeSingle();

  if (existing) return { ok: true };

  const { name, handle: baseHandle, dob } = deriveProfileFromAuthUser(authUser);
  const handle = await generateUniqueHandle(baseHandle, authUser.id);

  const payload: Record<string, unknown> = {
    id: authUser.id,
    name,
    handle,
    avatar: `https://api.dicebear.com/7.x/avataaars/svg?seed=${authUser.id}`,
    bio: 'Just vibing.',
  };
  if (dob) payload.date_of_birth = dob;

  const { error } = await supabase.from('profiles').insert([payload]);
  if (error) {
    console.error('Error ensuring StrainVerse profile:', error);
    return { ok: false, error: error.message };
  }
  return { ok: true };
};

const SUPABASE_URL =
  import.meta.env.NEXT_PUBLIC_SUPABASE_URL || import.meta.env.VITE_SUPABASE_URL;
const SUPABASE_PUBLISHABLE_KEY =
  import.meta.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY;

export const isSupabaseConfigured = Boolean(SUPABASE_URL && SUPABASE_PUBLISHABLE_KEY);

if (!isSupabaseConfigured) {
  console.warn(
    'Missing Supabase environment variables. Set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY in .env.local'
  );
}

export const supabase = createClient(
  SUPABASE_URL || 'https://placeholder.supabase.co',
  SUPABASE_PUBLISHABLE_KEY || 'placeholder',
  {
    db: {
      schema: 'StrainVerse',
    },
  }
);

export const auth = {
    signIn: async (email: string, password: string) => {
        const result = await supabase.auth.signInWithPassword({ email, password });
        if (!result.error && result.data.user) {
            const provision = await ensureStrainVerseProfile(result.data.user);
            if (!provision.ok) {
                return {
                    data: result.data,
                    error: { message: provision.error || 'Could not set up your StrainVerse profile. Please try again.' } as typeof result.error,
                };
            }
        }
        return result;
    },
    signUp: async (email: string, password: string, name: string, handle: string, dob: string) => {
        const { data, error } = await supabase.auth.signUp({ 
            email, 
            password,
            options: {
                data: {
                    name,
                    handle,
                    date_of_birth: dob,
                    site: 'StrainVerse',
                }
            }
        });
        
        if (error) {
            const alreadyExists =
                error.message?.toLowerCase().includes('already registered') ||
                error.message?.toLowerCase().includes('already been registered') ||
                (error as { code?: string }).code === 'user_already_exists';

            if (alreadyExists) {
                const signInResult = await supabase.auth.signInWithPassword({ email, password });
                if (!signInResult.error && signInResult.data.user) {
                    const provision = await ensureStrainVerseProfile(signInResult.data.user);
                    if (!provision.ok) {
                        return {
                            data: signInResult.data,
                            error: { message: provision.error || 'Signed in but could not create your StrainVerse profile.' } as typeof error,
                        };
                    }
                    return signInResult;
                }
                return {
                    data: signInResult.data,
                    error: {
                        message: 'This email is already registered on Cookbook or another Verse app. Sign in with your existing password.',
                    } as typeof error,
                };
            }
            return { data, error };
        }

        if (data.user) {
            const provision = await api.createProfile(data.user.id, name, handle, dob);
            if (!provision.ok) {
                await ensureStrainVerseProfile(data.user);
            }
        }

        return { data, error };
    },
    signOut: async () => {
        return await supabase.auth.signOut();
    },
    getSession: async () => {
        return await supabase.auth.getSession();
    }
};

const calculateDistance = (lat1: number, lon1: number, lat2: number, lon2: number) => {
    const R = 6371; 
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
              Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
              Math.sin(dLon/2) * Math.sin(dLon/2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    return R * c;
}

export const api = {
  
  createProfile: async (userId: string, name: string, handle: string, dob?: string): Promise<{ ok: boolean; error?: string }> => {
    const uniqueHandle = await generateUniqueHandle(handle, userId);
    const payload: Record<string, unknown> = {
        id: userId,
        name,
        handle: uniqueHandle,
        avatar: `https://api.dicebear.com/7.x/avataaars/svg?seed=${userId}`,
        bio: 'Just vibing.'
    };
    if (dob) {
      payload.date_of_birth = dob;
    }
    
    const { error } = await supabase.from('profiles').insert([payload]);
    if (error) {
      console.error("Error creating profile:", error);
      return { ok: false, error: error.message };
    }
    return { ok: true };
  },

  getCurrentUser: async (): Promise<User | null> => {
    const { data: { session } } = await supabase.auth.getSession();
    if (!session) return null;

    let { data, error } = await supabase.from('profiles').select('*').eq('id', session.user.id).maybeSingle();
    
    if (error || !data) {
        console.warn("Profile missing for authenticated user. Provisioning StrainVerse profile...");
        const provision = await ensureStrainVerseProfile(session.user);
        if (!provision.ok) {
            console.error("Failed to provision profile:", provision.error);
            return null;
        }
        const retry = await supabase.from('profiles').select('*').eq('id', session.user.id).single();
        if (retry.error || !retry.data) {
            console.error("Failed to load profile after provisioning:", retry.error);
            return null;
        }
        data = retry.data;
    }

    return mapProfileRow(data);
  },

  updateProfile: async (userId: string, updates: Partial<User>) => {
    const { name, bio, city, state, favStrains, smokingStyle, dateOfBirth } = updates;
    
    // Map application's camelCase to database's snake_case
    const dbPayload: { [key: string]: any } = {};

    if (name !== undefined) dbPayload.name = name;
    if (bio !== undefined) dbPayload.bio = bio;
    if (city !== undefined) dbPayload.city = city;
    if (state !== undefined) dbPayload.state = state;
    if (favStrains !== undefined) dbPayload.fav_strains = favStrains;
    if (smokingStyle !== undefined) dbPayload.smoking_style = smokingStyle;
    if (dateOfBirth !== undefined) dbPayload.date_of_birth = dateOfBirth;
    
    if (Object.keys(dbPayload).length === 0) return;
    
    const { error } = await supabase
      .from('profiles')
      .update(dbPayload)
      .eq('id', userId);
    if (error) {
      console.error("Error updating profile:", error.message);
      throw error;
    }
  },

  updateProfileTheme: async (userId: string, css: string, js: string) => {
    const { error } = await supabase
      .from('profiles')
      .update({ custom_css: css, custom_js: js })
      .eq('id', userId);
    if (error) {
      console.error("Error updating profile theme:", error);
      throw error;
    }
  },

  updateWidgets: async (userId: string, widgets: Widget[]) => {
    const { error } = await supabase
      .from('profiles')
      .update({ widgets })
      .eq('id', userId);
    if (error) {
      console.error("Error updating widgets:", error);
      throw error;
    }
  },
  
  updateUserLocation: async (userId: string, lat: number, lng: number, radius: number) => {
      await supabase.from('profiles').update({ latitude: lat, longitude: lng, distance_radius: radius }).eq('id', userId);
  },

  uploadImage: async (file: File): Promise<string | null> => {
      // Prefix with 'posts/' to organize in the StrainVerse bucket
      const fileName = `posts/${Date.now()}-${file.name}`;
      const { data, error } = await supabase.storage.from('StrainVerse').upload(fileName, file);
      if(error) {
          console.error("Image upload error:", error);
          return null;
      }
      const { data: { publicUrl } } = supabase.storage.from('StrainVerse').getPublicUrl(data.path);
      return publicUrl;
  },

  getFriendIds: async(userId: string): Promise<string[]> => {
      const orFilter = `and(user_1_id.eq.${userId},status.eq.ACCEPTED,type.eq.FRIEND),and(user_2_id.eq.${userId},status.eq.ACCEPTED,type.eq.FRIEND)`;
      
      const { data, error } = await supabase.from('relationships')
        .select('user_1_id, user_2_id')
        .or(orFilter);
      
      if(error) {
        console.error("Error fetching friends:", error.message);
        return [];
      }
      
      if (!data) {
          return [];
      }
      const friendIds = (data as { user_1_id: string; user_2_id: string }[]).map((r) =>
        r.user_1_id === userId ? r.user_2_id : r.user_1_id
      );
      return friendIds;
  },

  getBlockedUserIds: async (userId: string): Promise<string[]> => {
      const { data, error } = await supabase
        .from('blocks')
        .select('blocker_id, blocked_id')
        .or(`blocker_id.eq.${userId},blocked_id.eq.${userId}`);
      
      if (error) {
          console.error("Error fetching blocked users:", error);
          return [];
      }

      if (!data) {
        return [];
      }
      
      const blockedIds = (data as { blocker_id: string, blocked_id: string }[]).map(
        b => b.blocker_id === userId ? b.blocked_id : b.blocker_id
      );
      return [...new Set(blockedIds)];
  },

  getPosts: async (viewType: 'HIGHLINE' | 'MATCHIT' | 'FRIENDS' | 'FAMILY' | 'GROUP', user?: User, groupId?: string): Promise<Post[]> => {
    const { data: { session } } = await supabase.auth.getSession();
    const currentUserId = session?.user?.id;
    if (!currentUserId) return [];

    let query = supabase.from('posts').select(`*, profiles!inner (name, avatar, city, state, status), post_reactions (type, user_id)`).order('created_at', { ascending: false });

    if (viewType === 'HIGHLINE') {
        query = query.eq('visibility', 'HIGHLINE').eq('is_matchit', false);
    } else if (viewType === 'MATCHIT') {
        const blockedUserIds = await api.getBlockedUserIds(currentUserId);
        query = query.eq('is_matchit', true)
                     .gt('match_expires_at', new Date().toISOString())
                     .not('user_id', 'in', `(${[...blockedUserIds, '00000000-0000-0000-0000-000000000000'].join(',')})`)
                     .order('created_at', { ascending: false })
                     .limit(100);
    } else if (viewType === 'FRIENDS' && user) {
        const friendIds = await api.getFriendIds(user.id);
        query = query.in('user_id', [...friendIds, user.id]).eq('visibility', 'FRIENDS');
    } else if (viewType === 'GROUP' && groupId) {
        query = query.eq('group_id', groupId);
    }

    let { data, error } = await query;
    if (error) {
        console.error("Error fetching posts:", error);
        return [];
    }

    // Filter out shadow-banned posts unless the current user is the author
    data = data.filter(p => p.profiles.status !== 'shadow_banned' || p.user_id === currentUserId);
    
    let posts: Post[] = data.map(p => {
        const reactionsMap: Record<string, number> = {};
        let userReaction: ReactionType | null = null;
        if (p.post_reactions && Array.isArray(p.post_reactions)) {
            p.post_reactions.forEach((r: any) => {
                reactionsMap[r.type] = (reactionsMap[r.type] || 0) + 1;
                if (r.user_id === currentUserId) userReaction = r.type as ReactionType;
            });
        }
        
        let dist = undefined;
        if (viewType !== 'MATCHIT' && user?.latitude && user?.longitude && p.latitude && p.longitude) {
            dist = calculateDistance(user.latitude, user.longitude, p.latitude, p.longitude);
        }

        return {
            id: p.id,
            userId: p.user_id,
            userName: p.profiles?.name || 'Unknown',
            userAvatar: p.profiles?.avatar || '',
            content: p.content,
            image: p.image,
            timestamp: new Date(p.created_at).getTime(),
            reactions: reactionsMap,
            userReaction,
            comments: p.comments || 0,
            visibility: p.visibility,
            latitude: p.latitude,
            longitude: p.longitude,
            distance: dist,
            groupId: p.group_id,
            strain: p.strain,
            highLevel: p.high_level,
            soundtrack: p.soundtrack,
            isMatchIt: p.is_matchit,
            mood: p.mood,
            authorCity: p.profiles?.city,
            authorState: p.profiles?.state,
            matchLookingFor: p.match_looking_for,
            matchExpiresAt: p.match_expires_at,
        };
    });

    if (viewType === 'MATCHIT' && user?.city && user?.state) {
        posts = posts.filter(p => p.authorCity === user.city && p.authorState === user.state);
    } else if (viewType === 'MATCHIT') {
        // If user has no location set, they can't see MatchIt posts.
        posts = [];
    }

    return posts;
  },
  
  getPostsForUser: async (userId: string): Promise<Post[]> => {
    const { data, error } = await supabase.from('posts').select(`*, profiles (name, avatar), post_reactions (type, user_id)`).eq('user_id', userId).order('created_at', { ascending: false });
    if(error) return [];
    return data.map(p => {
        const reactionsMap: Record<string, number> = {};
        let userReaction: ReactionType | null = null;
        if (p.post_reactions && Array.isArray(p.post_reactions)) {
            p.post_reactions.forEach((r: any) => {
                reactionsMap[r.type] = (reactionsMap[r.type] || 0) + 1;
                if (r.user_id === userId) userReaction = r.type as ReactionType;
            });
        }
        return {
            id: p.id, userId: p.user_id, userName: p.profiles?.name || 'Unknown', userAvatar: p.profiles?.avatar || '', content: p.content, image: p.image, timestamp: new Date(p.created_at).getTime(), reactions: reactionsMap, userReaction, comments: p.comments || 0, visibility: p.visibility, latitude: p.latitude, longitude: p.longitude, strain: p.strain, highLevel: p.high_level, soundtrack: p.soundtrack, isMatchIt: p.is_matchit, mood: p.mood,
        };
    });
  },

  createPost: async (userId: string, content: string, visibility: PostVisibility, image?: string | null, lat?: number, lng?: number, groupId?: string, strain?: string, highLevel?: number, soundtrack?: string, isMatchIt?: boolean, mood?: string, matchLookingFor?: string, matchExpiresAt?: string) => {
    // Removed AI content moderation

    const payload: any = { user_id: userId, content, image: image || null, visibility, latitude: lat, longitude: lng, strain: strain || null, high_level: highLevel || 0, soundtrack: soundtrack || null, is_matchit: isMatchIt || false, mood: mood || null, match_looking_for: matchLookingFor || null, match_expires_at: matchExpiresAt || null };
    if (groupId) payload.group_id = groupId;
    const { error } = await supabase.from('posts').insert([payload]);
    if (error) throw error;
  },

  getCommentsForPost: async (postId: string): Promise<PostComment[]> => {
      const { data, error } = await supabase
          .from('post_comments')
          .select('*, profiles(name, avatar)')
          .eq('post_id', postId)
          .order('created_at', { ascending: true });

      if (error) {
          console.error("Error fetching comments:", error);
          return [];
      }

      return data.map(c => ({
          id: c.id,
          post_id: c.post_id,
          user_id: c.user_id,
          user_name: c.profiles.name,
          user_avatar: c.profiles.avatar,
          content: c.content,
          created_at: c.created_at,
      })) as PostComment[];
  },

  addComment: async (postId: string, userId: string, content: string): Promise<PostComment | null> => {
      const { data, error } = await supabase
          .from('post_comments')
          .insert({ post_id: postId, user_id: userId, content: content })
          .select('*, profiles(name, avatar)')
          .single();

      if (error) {
          console.error("Error adding comment:", error);
          return null;
      }
      
      return {
          id: data.id,
          post_id: data.post_id,
          user_id: data.user_id,
          user_name: data.profiles.name,
          user_avatar: data.profiles.avatar,
          content: data.content,
          created_at: data.created_at,
      } as PostComment;
  },

  toggleReaction: async (postId: string, userId: string, type: ReactionType) => {
      const { data: existing } = await supabase.from('post_reactions').select('id, type').eq('post_id', postId).eq('user_id', userId).single();
      if (existing) {
          if (existing.type === type) await supabase.from('post_reactions').delete().eq('id', existing.id);
          else await supabase.from('post_reactions').update({ type }).eq('id', existing.id);
      } else {
          await supabase.from('post_reactions').insert({ post_id: postId, user_id: userId, type });
      }
  },

  reportPost: async (reporterId: string, reportedUserId: string, postId: string, category: ReportCategory, reason: string) => {
      const { error } = await supabase.from('reports').insert({
          reporter_id: reporterId,
          reported_user_id: reportedUserId,
          post_id: postId,
          category,
          reason,
      });
      if (error) {
          console.error("Error submitting report:", error);
          throw error;
      }
  },

  blockUser: async (blockerId: string, blockedId: string) => {
      const { error } = await supabase.from('blocks').insert({
          blocker_id: blockerId,
          blocked_id: blockedId,
      });
      if (error && error.code !== '23505') { // 23505 is unique violation, which is fine (already blocked)
          console.error("Error blocking user:", error);
          throw error;
      }
  },

  getAllGroups: async (): Promise<Group[]> => {
    const { data, error } = await supabase.from('groups').select('*');
    if (error) return [];
    return data.map(g => ({
        id: g.id,
        name: g.name,
        description: g.description,
        type: g.type,
        members: g.members || [],
        messages: [],
        cover_image_url: g.cover_image_url,
    }));
  },

  createGroup: async (name: string, description: string, type: 'PUBLIC' | 'FRIEND' | 'FAMILY', userId: string) => {
    const { data, error } = await supabase
      .from('groups')
      .insert({ name, description, type, members: [userId] })
      .select()
      .single();
      
    if (error) {
      console.error("Error creating group:", error);
      throw error;
    }
    return data;
  },

  getGroupDetails: async (groupId: string): Promise<Group | null> => {
    const { data: group } = await supabase.from('groups').select('*').eq('id', groupId).single();
    if (!group) return null;
    const { data: messages } = await supabase.from('messages').select('*, profiles(name)').eq('group_id', groupId).order('created_at', { ascending: true });
    const mappedMessages = (messages || []).map(m => ({ id: m.id, userId: m.user_id, userName: m.profiles?.name || 'User', text: m.text, timestamp: new Date(m.created_at).getTime() }));
    return { ...group, messages: mappedMessages };
  },
  
  sendMessage: async (groupId: string, userId: string, text: string) => {
    await supabase.from('messages').insert([{ group_id: groupId, user_id: userId, text }]);
  },

  reportAreaSafety: async (userId: string, lat: number, lng: number, status: 'HOT' | 'CHILL') => {
    const { error } = await supabase.from('safety_reports').insert([{ user_id: userId, latitude: lat, longitude: lng, status }]);
    if (error) console.error("Safety report error:", error);
  },

  getAreaSafety: async (lat: number, lng: number, radius: number): Promise<SafetyReport[]> => {
      const { data, error } = await supabase.from('safety_reports').select('*').order('created_at', { ascending: false }).limit(50);
      if (error) return [];
      return (data || []).map(r => ({ id: r.id, latitude: r.latitude, longitude: r.longitude, status: r.status, timestamp: new Date(r.created_at).getTime() }));
  },
  
  getGrowPlants: async (userId: string): Promise<GrowPlant[]> => {
    const { data, error } = await supabase.from('grow_plants').select('*').eq('user_id', userId);
    if(error) return [];
    return data as GrowPlant[];
  },

  addGrowPlant: async (userId: string, plant: Omit<GrowPlant, 'id' | 'user_id'>) => {
    const { error } = await supabase.from('grow_plants').insert([{...plant, user_id: userId}]);
    if(error) console.error('Error adding plant', error);
  },

  uploadStoryImage: async (file: File): Promise<string | null> => {
      // Use 'StrainVerse' bucket with 'stories/' prefix
      const fileName = `stories/${Date.now()}-${file.name}`;
      const { data, error } = await supabase.storage.from('StrainVerse').upload(fileName, file);
      if(error) {
          console.error("Story image upload error:", error);
          return null;
      }
      const { data: { publicUrl } } = supabase.storage.from('StrainVerse').getPublicUrl(data.path);
      return publicUrl;
  },

  createStory: async (userId: string, imageUrl: string, strainName?: string, highLevel?: number): Promise<Story | null> => {
      const { data, error } = await supabase.from('stories').insert([{
          user_id: userId,
          image_url: imageUrl,
          strain_name: strainName,
          high_level: highLevel
      }]).select('*, profiles(name, avatar)').single();

      if (error) {
          console.error("Error creating story:", error);
          return null;
      }
      return {
          id: data.id,
          user_id: data.user_id,
          image_url: data.image_url,
          strain_name: data.strain_name,
          high_level: data.high_level,
          user_name: data.profiles.name,
          user_avatar: data.profiles.avatar,
      } as Story;
  },

  getStories: async(): Promise<Story[]> => {
    const { data, error } = await supabase.from('stories').select('*, profiles(name, avatar)').order('created_at', {ascending: false}).limit(20);
    if(error) return [];
    return data.map(s => ({
        id: s.id,
        user_id: s.user_id,
        image_url: s.image_url,
        strain_name: s.strain_name,
        high_level: s.high_level,
        user_name: s.profiles.name,
        user_avatar: s.profiles.avatar,
    }));
  },
  
  getLeaderboard: async(): Promise<GameScore[]> => {
    const { data, error } = await supabase.from('game_scores').select('*, profiles(name, avatar)').order('score', {ascending: false}).limit(10);
    if(error) return [];
    return data.map(s => ({
        id: s.id,
        user_id: s.user_id,
        game_id: s.game_id,
        score: s.score,
        user_name: s.profiles.name,
        user_avatar: s.profiles.avatar,
    }));
  },

  // --- MatchIt Vibe System ---
  sendVibe: async (postId: string, senderId: string, receiverId: string, message: string | null, type: 'TAP' | 'SPARK'): Promise<{ interaction: MatchItInteraction | null, mutualMatch: Group | null }> => {
    // Check for existing interaction
    const { data: existing, error: selectError } = await supabase.from('matchit_interactions')
        .select('id').eq('post_id', postId).eq('sender_id', senderId)

    if (selectError) {
        console.error("Error checking existing vibe:", selectError);
        throw selectError;
    }
    if (existing.length > 0) {
        throw new Error("You've already sent a vibe to this post.");
    }
    
    const { data, error } = await supabase.from('matchit_interactions').insert({
        post_id: postId,
        sender_id: senderId,
        receiver_id: receiverId,
        message,
        type,
    }).select('*, sender:profiles!sender_id(name, avatar)').single();

    if (error) {
        console.error("Error sending vibe:", error);
        throw error;
    }
    
    const interactionResult = {
        ...data,
        sender_name: data.sender.name,
        sender_avatar: data.sender.avatar,
    } as MatchItInteraction;

    let mutualMatch: Group | null = null;
    if (type === 'SPARK') {
        const { data: mutual } = await supabase.from('matchit_interactions').select('id, post_id')
            .eq('sender_id', receiverId)
            .eq('receiver_id', senderId)
            .eq('type', 'SPARK')
            .eq('status', 'PENDING')
            .single();
        
        if (mutual) {
            // MUTUAL SPARK!
            const matchGroup = await api.createMatchChat(senderId, receiverId);
            if(matchGroup) {
                // Update both interactions
                await supabase.from('matchit_interactions').update({ status: 'MATCHED', group_id: matchGroup.id }).or(`id.eq.${data.id},id.eq.${mutual.id}`);
                mutualMatch = matchGroup;
            }
        }
    }
    return { interaction: interactionResult, mutualMatch };
  },

  createMatchChat: async (user1Id: string, user2Id: string): Promise<Group | null> => {
      const { data: users, error: usersError } = await supabase.from('profiles').select('name').in('id', [user1Id, user2Id]);
      if(usersError || users.length < 2) {
        console.error("Couldn't fetch users for match chat name", usersError);
        return null;
      }
      
      const groupName = `${users[0].name} & ${users[1].name}'s Sesh`;
      const { data: group, error } = await supabase.from('groups').insert({
          name: groupName,
          description: 'A match from MatchIt!',
          type: 'MATCH',
          members: [user1Id, user2Id],
      }).select().single();
      
      if (error) {
          console.error("Error creating match chat:", error);
          return null;
      }
      return group as Group;
  },

  respondToVibe: async (interactionId: string, senderId: string, receiverId: string, response: 'MATCHED' | 'DECLINED'): Promise<Group | null> => {
      if (response === 'MATCHED') {
          const matchGroup = await api.createMatchChat(senderId, receiverId);
          if (matchGroup) {
              const { error } = await supabase.from('matchit_interactions').update({ status: 'MATCHED', group_id: matchGroup.id }).eq('id', interactionId);
              if (error) {
                  console.error("Error updating interaction status:", error);
                  // Should probably delete the created group if this fails...
                  return null;
              }
              return matchGroup;
          }
      } else {
          const { error } = await supabase.from('matchit_interactions').update({ status: 'DECLINED' }).eq('id', interactionId);
          if (error) {
              console.error("Error declining vibe:", error);
          }
      }
      return null;
  },
  
  // Gets all interactions related to a set of posts for the current user
  getInteractionsForPosts: async (postIds: string[], userId: string): Promise<MatchItInteraction[]> => {
      if (postIds.length === 0) return [];
      const { data, error } = await supabase
        .from('matchit_interactions')
        .select('*, sender:profiles!sender_id(name, avatar)')
        .in('post_id', postIds)
        .or(`sender_id.eq.${userId},receiver_id.eq.${userId}`);
      
      if(error) {
        console.error("Error fetching interactions for posts:", error);
        return [];
      }
      return data.map(i => ({
        ...i,
        sender_name: i.sender.name,
        sender_avatar: i.sender.avatar,
      })) as MatchItInteraction[];
  },

  // --- StrainVerse Specific API calls ---
  
  getStrains: async (): Promise<Strain[]> => {
      const { data: { session } } = await supabase.auth.getSession();
      const userId = session?.user?.id;

      const { data: strainsData, error: strainsError } = await supabase.from('strains_with_stats').select('*');
      if (strainsError) {
          console.error("Error fetching strains:", strainsError);
          return [];
      }
      
      let userLogs: any[] = [];
      if (userId) {
          const { data: logData, error: logError } = await supabase.from('user_strain_log').select('strain_id, type').eq('user_id', userId);
          if (logError) {
              console.error("Error fetching user strain logs:", logError);
          } else {
              userLogs = logData || [];
          }
      }

      const logsMap = new Map<string, { smoked: boolean; dabbed: boolean }>();
      userLogs.forEach(log => {
          const entry = logsMap.get(log.strain_id) || { smoked: false, dabbed: false };
          if (log.type === 'SMOKED') entry.smoked = true;
          if (log.type === 'DABBED') entry.dabbed = true;
          logsMap.set(log.strain_id, entry);
      });

      const strainsWithUserData = strainsData.map(s => {
          const logs = logsMap.get(s.id);
          return {
              ...s,
              avg_rating: s.avg_rating ? parseFloat(s.avg_rating.toFixed(1)) : null,
              user_has_smoked: logs?.smoked || false,
              user_has_dabbed: logs?.dabbed || false,
          }
      });
      
      return strainsWithUserData as Strain[];
  },

  getTriedStrains: async (userId: string): Promise<Strain[]> => {
    const { data: logData, error: logError } = await supabase
        .from('user_strain_log')
        .select('strain_id')
        .eq('user_id', userId);

    if (logError) {
        console.error("Error fetching user strain logs:", logError);
        return [];
    }

    const strainIds = [...new Set(logData.map(log => log.strain_id))];

    if (strainIds.length === 0) {
        return [];
    }

    const { data: strainsData, error: strainsError } = await supabase
        .from('strains_with_stats')
        .select('*')
        .in('id', strainIds);

    if (strainsError) {
        console.error("Error fetching tried strains details:", strainsError);
        return [];
    }

    return strainsData as Strain[];
  },
  
  getStrainById: async (id: string): Promise<Strain | null> => {
      const { data: { session } } = await supabase.auth.getSession();
      const userId = session?.user?.id;
    
      const { data, error } = await supabase.from('strains').select('*').eq('id', id).single();
      if (error) {
          console.error("Error fetching strain by ID:", error);
          return null;
      }

      let strainData = data as Strain;

      if (userId) {
        const { data: logData, error: logError } = await supabase.from('user_strain_log')
            .select('type')
            .eq('user_id', userId)
            .eq('strain_id', id);
        
        if (!logError && logData) {
            strainData.user_has_smoked = logData.some(l => l.type === 'SMOKED');
            strainData.user_has_dabbed = logData.some(l => l.type === 'DABBED');
        }
      }

      return strainData;
  },
  
  getStrainPhotos: async (strainId: string, form: 'FLOWER' | 'CONCENTRATE'): Promise<StrainPhoto[]> => {
      const { data, error } = await supabase.from('strain_photos').select('*, profiles(name, avatar)').eq('strain_id', strainId).eq('form', form).order('created_at', { ascending: false });
      if (error) return [];
      return data.map(p => ({
          ...p,
          user_name: p.profiles.name,
          user_avatar: p.profiles.avatar,
      })) as StrainPhoto[];
  },

  getStrainReviews: async (strainId: string, form: 'FLOWER' | 'CONCENTRATE'): Promise<StrainReview[]> => {
      const { data, error } = await supabase.from('strain_reviews').select('*, profiles(name, avatar)').eq('strain_id', strainId).eq('form', form).order('created_at', { ascending: false });
      if (error) return [];
      return data.map(r => ({
          ...r,
          user_name: r.profiles.name,
          user_avatar: r.profiles.avatar,
      })) as StrainReview[];
  },

  getStrainChatMessages: async (strainId: string, form: 'FLOWER' | 'CONCENTRATE'): Promise<StrainChatMessage[]> => {
      const { data, error } = await supabase.from('strain_chat_messages').select('*, profiles(name)').eq('strain_id', strainId).eq('form', form).order('created_at', { ascending: true }).limit(100);
      if (error) return [];
      return data.map(m => ({
          ...m,
          user_name: m.profiles.name,
      })) as StrainChatMessage[];
  },

  addStrainReview: async (strainId: string, userId: string, rating: number, text: string, form: 'FLOWER' | 'CONCENTRATE'): Promise<StrainReview> => {
      const { data, error } = await supabase.from('strain_reviews').upsert({
          strain_id: strainId,
          user_id: userId,
          rating: rating,
          text: text,
          form: form
      }, {
          onConflict: 'user_id,strain_id,form'
      }).select('*, profiles(name, avatar)').single();

      if(error) {
          console.error("Error adding/updating review:", error);
          throw new Error(error.message);
      }

      return {
          ...data,
          user_name: data.profiles.name,
          user_avatar: data.profiles.avatar,
      } as StrainReview;
  },

  uploadStrainImage: async (file: File): Promise<string | null> => {
      // Use 'StrainVerse' bucket (root)
      const fileName = `${Date.now()}-${file.name}`;
      const { data, error } = await supabase.storage.from('StrainVerse').upload(fileName, file);
      if(error) {
          console.error("Strain image upload error:", error);
          return null;
      }
      const { data: { publicUrl } } = supabase.storage.from('StrainVerse').getPublicUrl(data.path);
      return publicUrl;
  },

  addStrainPhoto: async (strainId: string, userId: string, imageUrl: string, form: 'FLOWER' | 'CONCENTRATE', brand?: string): Promise<StrainPhoto | null> => {
      const { data, error } = await supabase.from('strain_photos').insert({
          strain_id: strainId,
          user_id: userId,
          image_url: imageUrl,
          form: form,
          brand: brand,
      }).select('*, profiles(name, avatar)').single();

      if (error) {
          console.error("Error adding strain photo:", error);
          return null;
      }
      return {
          ...data,
          user_name: data.profiles.name,
          user_avatar: data.profiles.avatar,
      } as StrainPhoto;
  },
  
  toggleStrainLog: async (userId: string, strainId: string, type: 'SMOKED' | 'DABBED') => {
      const { data: existing, error } = await supabase.from('user_strain_log').select('id').eq('user_id', userId).eq('strain_id', strainId).eq('type', type).single();
      if (error && error.code !== 'PGRST116') { // PGRST116 is "exact one row not found"
          console.error('Error checking strain log:', error);
          return;
      }
      
      if (existing) {
          await supabase.from('user_strain_log').delete().eq('id', existing.id);
      } else {
          await supabase.from('user_strain_log').insert({ user_id: userId, strain_id: strainId, type });
      }
  },
  
  sendStrainChatMessage: async(strainId: string, userId: string, message: string, form: 'FLOWER' | 'CONCENTRATE'): Promise<StrainChatMessage | null> => {
      const { data, error } = await supabase.from('strain_chat_messages').insert({
          strain_id: strainId,
          user_id: userId,
          message: message,
          form: form,
      }).select('*, profiles(name)').single();
      if(error) {
        console.error("Error sending strain chat message:", error);
        return null;
      }
      return {
          ...data,
          user_name: data.profiles.name,
      } as StrainChatMessage;
  }
};