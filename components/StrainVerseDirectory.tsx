import React, { useState, useEffect, useMemo } from 'react';
import { Strain } from '../types';
import { api } from '../services/supabaseClient';
import { Search, Sprout, Star, Users, Image as ImageIcon, Loader2, Zap, Flame, Diamond } from 'lucide-react';

interface StrainVerseDirectoryProps {
  onStrainSelect: (strain: Strain) => void;
}

const StrainCard: React.FC<{ strain: Strain; onSelect: () => void; }> = ({ strain, onSelect }) => {
  return (
    <div 
      onClick={onSelect}
      className="relative group bg-[var(--bg-card)] border border-[var(--border)] rounded-xl aspect-[3/4] overflow-hidden cursor-pointer transition-all duration-300 hover:border-[var(--accent)] hover:shadow-2xl hover:shadow-[var(--shadow-color)] hover:-translate-y-1"
    >
      <img 
        src={strain.cover_image_url || `https://source.unsplash.com/random/400x600/?cannabis,plant,smoke&sig=${strain.id}`} 
        alt={strain.name} 
        className="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" 
      />
      <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/60 to-transparent"></div>
      
      {(strain.user_has_smoked || strain.user_has_dabbed) && (
        <div className="absolute top-2 right-2 flex items-center gap-1.5 bg-black/50 p-1.5 rounded-full backdrop-blur-sm border border-white/10">
            {strain.user_has_smoked && <Flame size={14} className="text-orange-400" />}
            {strain.user_has_dabbed && <Diamond size={14} className="text-cyan-400" />}
        </div>
      )}

      <div className="absolute bottom-0 left-0 right-0 p-4 text-white">
        <span className="text-xs font-bold uppercase tracking-widest px-2 py-1 rounded-full bg-white/10 backdrop-blur-sm">{strain.type}</span>
        <h3 className="font-black text-2xl mt-2 truncate">{strain.name}</h3>
        <div className="flex items-center gap-4 text-sm text-white/70 mt-1">
          <div className="flex items-center gap-1"><Star size={14} className="text-yellow-400"/><span>{strain.avg_rating || 'N/A'}</span></div>
          <div className="flex items-center gap-1"><ImageIcon size={14} /><span>{strain.photo_count || 0}</span></div>
        </div>
      </div>
    </div>
  );
};

const StrainVerseDirectory: React.FC<StrainVerseDirectoryProps> = ({ onStrainSelect }) => {
  const [strains, setStrains] = useState<Strain[]>([]);
  const [filteredStrains, setFilteredStrains] = useState<Strain[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<'All' | 'Sativa' | 'Indica' | 'Hybrid'>('All');
  const [searchTerm, setSearchTerm] = useState('');

  const trendingStrains = useMemo(() => {
    return [...strains].sort((a, b) => (b.review_count || 0) - (a.review_count || 0)).slice(0, 5);
  }, [strains]);

  useEffect(() => {
    const fetchStrains = async () => {
      setIsLoading(true);
      const data = await api.getStrains();
      setStrains(data);
      setFilteredStrains(data);
      setIsLoading(false);
    };
    fetchStrains();
  }, []);
  
  useEffect(() => {
    let result = strains;

    if (activeTab !== 'All') {
      result = result.filter(s => s.type === activeTab);
    }
    
    if (searchTerm) {
      const lowercasedTerm = searchTerm.toLowerCase();
      result = result.filter(s => 
        s.name.toLowerCase().includes(lowercasedTerm) ||
        (s.effects && s.effects.some(e => e.toLowerCase().includes(lowercasedTerm))) ||
        (s.flavors && s.flavors.some(f => f.toLowerCase().includes(lowercasedTerm)))
      );
    }

    setFilteredStrains(result);
  }, [activeTab, searchTerm, strains]);

  const TabButton: React.FC<{ label: typeof activeTab }> = ({ label }) => (
    <button
      onClick={() => setActiveTab(label)}
      className={`px-4 py-2 text-sm font-bold rounded-full transition-colors ${
        activeTab === label
          ? 'bg-[var(--accent)] text-white'
          : 'bg-[var(--bg-input)] text-[var(--text-muted)] hover:bg-[var(--bg-hover)]'
      }`}
    >
      {label}
    </button>
  );

  return (
    <div className="p-4 pb-20 lg:pb-4">
      {/* Header and Search */}
      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 bg-[var(--accent)]/20 rounded-lg flex items-center justify-center border border-[var(--border-strong)] relative shadow-md">
             <Sprout className="text-[var(--accent)] z-10" size={20} />
          </div>
          <div>
            <h1 className="text-3xl font-black text-white">StrainVerse</h1>
            <p className="text-[var(--text-muted)] text-sm -mt-1">The Universe of Strains, Powered by You.</p>
          </div>
        </div>
      </div>
      <div className="sticky top-0 bg-[var(--bg-main)]/80 backdrop-blur-sm z-10 py-4 -my-4">
          <div className="relative mb-4">
            <Search size={18} className="absolute left-4 top-1/2 -translate-y-1/2 text-[var(--text-muted)]" />
            <input
              type="text"
              placeholder="Search strains, flavors, effects..."
              value={searchTerm}
              onChange={e => setSearchTerm(e.target.value)}
              className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-full pl-10 pr-4 py-3 focus:outline-none focus:border-[var(--accent)] transition-colors"
            />
          </div>
      </div>
      
      {isLoading ? (
        <div className="flex justify-center items-center py-20">
            <Loader2 size={32} className="animate-spin text-[var(--accent)]" />
        </div>
      ) : (
        <>
            {/* Trending Section */}
            {!searchTerm && (
                <div className="my-6">
                    <h2 className="text-xl font-bold flex items-center gap-2 mb-4"><Zap size={20} className="text-yellow-400" /> Trending Strains</h2>
                    <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
                        {trendingStrains.map(strain => (
                            <StrainCard key={strain.id} strain={strain} onSelect={() => onStrainSelect(strain)} />
                        ))}
                    </div>
                </div>
            )}
            
            {/* Filter and All Strains */}
            <div className="my-6">
                 <div className="flex items-center justify-between mb-4">
                    <h2 className="text-xl font-bold flex items-center gap-2"><Sprout size={20} className="text-green-400" /> Explore Strains</h2>
                    <div className="hidden sm:flex gap-2">
                        <TabButton label="All" />
                        <TabButton label="Sativa" />
                        <TabButton label="Indica" />
                        <TabButton label="Hybrid" />
                    </div>
                 </div>
                 <div className="flex sm:hidden gap-2 overflow-x-auto pb-2 -mx-4 px-4">
                    <TabButton label="All" />
                    <TabButton label="Sativa" />
                    <TabButton label="Indica" />
                    <TabButton label="Hybrid" />
                 </div>
            </div>

            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
                {filteredStrains.map(strain => (
                <StrainCard key={strain.id} strain={strain} onSelect={() => onStrainSelect(strain)} />
                ))}
            </div>

            {!isLoading && filteredStrains.length === 0 && (
                <div className="text-center py-20 text-[var(--text-muted)] col-span-full">
                    <p className="font-bold text-lg">No Strains Found</p>
                    <p className="text-sm">Try adjusting your search or filters.</p>
                </div>
            )}
        </>
      )}
    </div>
  );
};

export default StrainVerseDirectory;