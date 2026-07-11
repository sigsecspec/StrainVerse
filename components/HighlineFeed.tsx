import React, { useState, useRef, useEffect } from 'react';
import { Post, PostVisibility, ReactionType, Story, User, PostComment } from '../types';
import { Send, Image as ImageIcon, XCircle, Music, Leaf, Rocket, ThumbsDown, HelpCircle, Heart, Plus, Wand2, Flame, MapPin, ThumbsUp, MessageSquare } from 'lucide-react';
import CreatePostModal from './CreatePostModal';
import { StrainStories, SkeletonPost } from './common';
import { api } from '../services/supabaseClient';


// 2. HIGHLINE FEED COMPONENT
const HighlineFeed: React.FC<{ user: User, posts: Post[], onReaction: (postId: string, type: ReactionType) => void, onPost: (content: string, visibility: PostVisibility, image?: File | null, meta?: any, isMatchIt?: boolean) => void, isLocal?: boolean, stories: Story[], isLoading: boolean, onAddStoryClick: () => void }> = ({ user, posts, onReaction, onPost, isLocal = false, stories, isLoading, onAddStoryClick }) => {
    const [isPostModalOpen, setPostModalOpen] = useState(false);
    const [localPosts, setLocalPosts] = useState<Post[]>(posts);
    const [openCommentsPostId, setOpenCommentsPostId] = useState<string | null>(null);
    const [comments, setComments] = useState<Record<string, PostComment[]>>({});
    const [isCommentsLoading, setIsCommentsLoading] = useState(false);
    const [newComment, setNewComment] = useState<Record<string, string>>({});
    
    useEffect(() => {
        setLocalPosts(posts);
    }, [posts]);

    const handleToggleComments = async (postId: string) => {
        if (openCommentsPostId === postId) {
            setOpenCommentsPostId(null);
        } else {
            setOpenCommentsPostId(postId);
            if (!comments[postId]) {
                setIsCommentsLoading(true);
                const fetchedComments = await api.getCommentsForPost(postId);
                setComments(prev => ({ ...prev, [postId]: fetchedComments }));
                setIsCommentsLoading(false);
            }
        }
    };

    const handleAddComment = async (postId: string) => {
        const commentContent = newComment[postId];
        if (!commentContent || !commentContent.trim() || !user) return;

        const addedComment = await api.addComment(postId, user.id, commentContent);
        if (addedComment) {
            setComments(prev => ({
                ...prev,
                [postId]: [...(prev[postId] || []), addedComment]
            }));
            setNewComment(prev => ({ ...prev, [postId]: '' }));
            setLocalPosts(currentPosts => currentPosts.map(p => 
                p.id === postId ? { ...p, comments: (p.comments || 0) + 1 } : p
            ));
        }
    };
    
    const reactionMap: Partial<Record<ReactionType, { icon: React.ReactNode, color: string, hoverColor: string }>> = {
        'THUMBS_UP': { icon: <ThumbsUp size={16} />, color: 'text-sky-500', hoverColor: 'group-hover:text-sky-500' },
        'LIKE': { icon: <Heart size={16} />, color: 'text-pink-500', hoverColor: 'group-hover:text-pink-500' },
        'FIRE': { icon: <Flame size={16} />, color: 'text-orange-500', hoverColor: 'group-hover:text-orange-500' },
        'DISLIKE': { icon: <ThumbsDown size={16} />, color: 'text-red-500', hoverColor: 'group-hover:text-red-500' },
    };

    const reactionsToDisplay: ReactionType[] = ['THUMBS_UP', 'LIKE', 'FIRE', 'DISLIKE'];

    return (
        <div className="pb-24 lg:pb-6 relative">
            {isPostModalOpen && <CreatePostModal onClose={() => setPostModalOpen(false)} onPost={onPost} isLocal={isLocal} />}
            <StrainStories stories={stories} onAddStoryClick={onAddStoryClick} />

            {!isLocal && (
                 <button onClick={() => setPostModalOpen(true)} className="fixed bottom-20 lg:bottom-8 right-8 z-30 bg-[var(--accent)] hover:bg-[var(--accent-hover)] w-16 h-16 rounded-full flex items-center justify-center shadow-lg shadow-[var(--accent)]/40 transition-transform hover:scale-105 active:scale-95">
                    <Plus size={32} className="text-white" />
                </button>
            )}

            {isLoading ? (
                <div>
                    <SkeletonPost />
                    <SkeletonPost />
                    <SkeletonPost />
                </div>
            ) : localPosts.map(post => (
                <div key={post.id} className="p-4 border-b border-[var(--border)] transition-colors">
                    <div className="hover:bg-[var(--bg-hover)] -m-4 p-4">
                        {isLocal && post.distance && (
                            <div className="text-xs text-[var(--accent)] font-bold mb-2 flex items-center gap-1">
                                <MapPin size={12}/> {post.distance.toFixed(1)}km away
                            </div>
                        )}
                        <div className="flex gap-3">
                            <img src={post.userAvatar} className="w-12 h-12 rounded-full" />
                            <div className="flex-1">
                                <div className="flex items-center flex-wrap gap-2">
                                    <h4 className="font-bold text-white flex items-center">{post.userName} {post.mood && <span className="text-2xl ml-2">{post.mood}</span>}</h4>
                                    <span className="text-sm text-[var(--text-muted)]">@{post.userName.toLowerCase()}</span>
                                    <span className="text-sm text-[var(--text-muted)]">· {new Date(post.timestamp).toLocaleDateString()}</span>
                                    {post.isMatchIt && (
                                        <span className="bg-orange-500/20 text-orange-400 text-[10px] font-bold px-2 py-0.5 rounded-full flex items-center gap-1">
                                            <Flame size={12} /> MATCH IT
                                        </span>
                                    )}
                                </div>
                                <p className="text-white whitespace-pre-wrap mt-1">{post.content}</p>
                                {post.image && <img src={post.image} className="mt-3 rounded-2xl border border-[var(--border)] max-h-96 w-full object-cover" />}
                                
                                {(post.strain || post.highLevel || post.soundtrack) && (
                                    <div className="mt-3 border border-[var(--border)] rounded-lg p-2 flex items-center gap-4 text-xs">
                                        {post.strain && <span className="flex items-center gap-1"><Leaf size={12} className="text-green-400"/> {post.strain}</span>}
                                        {post.highLevel && <span className="flex items-center gap-1"><Rocket size={12} className="text-purple-400"/> {post.highLevel}/10</span>}
                                        {post.soundtrack && <span className="flex items-center gap-1 truncate"><Music size={12} className="text-pink-400"/> {post.soundtrack}</span>}
                                    </div>
                                )}

                                <div className="flex items-center justify-around text-[var(--text-muted)] mt-4">
                                    {reactionsToDisplay.map(type => (
                                        <button key={type} onClick={() => onReaction(post.id, type)} className={`flex items-center gap-2 text-sm font-mono group transition-colors ${post.userReaction === type ? reactionMap[type]!.color : 'hover:text-white'}`}>
                                            <span className={`transition-colors text-lg ${reactionMap[type]!.hoverColor}`}>{reactionMap[type]!.icon}</span>
                                            {post.reactions[type] || 0}
                                        </button>
                                    ))}
                                    <button onClick={() => handleToggleComments(post.id)} className={`flex items-center gap-2 text-sm font-mono group transition-colors ${openCommentsPostId === post.id ? 'text-[var(--accent)]' : 'hover:text-white'}`}>
                                        <MessageSquare size={16} />
                                        {post.comments || 0}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    {openCommentsPostId === post.id && (
                        <div className="mt-4 pt-4 border-t border-[var(--border)] animate-in fade-in duration-300">
                            <div className="flex items-center gap-2 mb-4">
                                <img src={user.avatar} className="w-8 h-8 rounded-full" />
                                <div className="flex-1 bg-[var(--bg-input)] rounded-full flex items-center pr-2 border border-[var(--border)] focus-within:border-[var(--accent)] transition-colors">
                                    <input 
                                        type="text"
                                        placeholder="Add a comment..."
                                        value={newComment[post.id] || ''}
                                        onChange={e => setNewComment(prev => ({ ...prev, [post.id]: e.target.value }))}
                                        onKeyPress={e => e.key === 'Enter' && handleAddComment(post.id)}
                                        className="w-full bg-transparent p-2 focus:outline-none text-sm"
                                    />
                                    <button onClick={() => handleAddComment(post.id)} className="p-1.5 bg-[var(--accent)] text-white rounded-full hover:bg-[var(--accent-hover)] transition-all">
                                        <Send size={14} />
                                    </button>
                                </div>
                            </div>

                            {isCommentsLoading && !comments[post.id] && <p className="text-xs text-center text-[var(--text-muted)] py-4">Loading comments...</p>}
                            <div className="space-y-3 max-h-60 overflow-y-auto pr-2">
                                {(comments[post.id] || []).map(comment => (
                                    <div key={comment.id} className="flex items-start gap-2 text-sm">
                                        <img src={comment.user_avatar} className="w-6 h-6 rounded-full mt-0.5" />
                                        <div className="bg-[var(--bg-input)] px-3 py-2 rounded-xl">
                                            <span className="font-bold text-white/90">{comment.user_name}</span>
                                            <p className="text-white/70 break-words">{comment.content}</p>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    )}
                </div>
            ))}
        </div>
    );
}
export default HighlineFeed;