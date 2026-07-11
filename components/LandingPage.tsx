import React from 'react';
import AuthScreen from './AuthScreen';
import { Sprout, Users, Search, Leaf, Star, MessageSquare } from 'lucide-react';

interface LandingPageProps {
  onSuccess: () => void;
}

const FeatureCard: React.FC<{ icon: React.ElementType; title: string; description: string; delay: string; }> = ({ icon: Icon, title, description, delay }) => (
    <div className="bg-black/40 p-4 rounded-xl border border-white/10 backdrop-blur-sm opacity-0 animate-[fadeInUp_0.5s_ease-out_forwards]" style={{ animationDelay: delay, animationFillMode: 'forwards' }}>
        <div className="flex items-center gap-3 mb-2">
            <div className="w-8 h-8 rounded-lg bg-white/10 flex items-center justify-center">
                <Icon size={16} className="text-[var(--accent)]" />
            </div>
            <h3 className="font-bold text-white">{title}</h3>
        </div>
        <p className="text-xs text-white/50">{description}</p>
    </div>
);


const MockStrainCard: React.FC<{ delay: string }> = ({ delay }) => (
    <div className="bg-black/40 p-3 rounded-xl border border-white/10 backdrop-blur-sm opacity-0 animate-[fadeInUp_0.5s_ease-out_forwards] sm:col-span-2" style={{ animationDelay: delay, animationFillMode: 'forwards' }}>
        <div className="flex gap-3">
            <div className="w-20 h-20 bg-white/5 rounded-lg flex-shrink-0 flex items-center justify-center">
                 <Leaf size={32} className="text-white/20" />
            </div>
            <div className="flex-1">
                <div className="h-5 w-3/4 bg-white/20 rounded mb-2"></div>
                <div className="flex items-center gap-2">
                    <div className="px-2 py-0.5 bg-purple-500/20 text-purple-300 text-[10px] font-bold rounded-full">Indica</div>
                    <div className="px-2 py-0.5 bg-green-500/20 text-green-300 text-[10px] font-bold rounded-full">Relaxed</div>
                </div>
                 <div className="flex items-center gap-4 text-white/40 mt-3">
                    <div className="flex items-center gap-1"><Star size={12} /><span className="text-xs font-mono">4.8</span></div>
                    <div className="flex items-center gap-1"><MessageSquare size={12} /><span className="text-xs font-mono">18</span></div>
                </div>
            </div>
        </div>
    </div>
);


const LandingPage: React.FC<LandingPageProps> = ({ onSuccess }) => {
  return (
    <div className="min-h-dvh w-full bg-[var(--bg-main)] text-white relative overflow-x-hidden">
        <div className="absolute inset-0 z-0 opacity-40">
            <div className="absolute top-[-20%] left-[-20%] w-[60%] h-[60%] rounded-full bg-[var(--forest-green)]/20 blur-[150px] animate-[spin_20s_linear_infinite]"></div>
            <div className="absolute bottom-[-20%] right-[-20%] w-[60%] h-[60%] rounded-full bg-[var(--indica-purple)]/20 blur-[150px] animate-[spin_25s_linear_infinite_reverse]"></div>
            <div className="absolute top-[40%] left-[30%] w-[40%] h-[40%] rounded-full bg-[var(--sunset-hybrid)]/20 blur-[120px] animate-[spin_15s_linear_infinite]"></div>
        </div>
        
        <div className="relative z-10 flex flex-col lg:flex-row min-h-dvh">
            <div className="p-8 pt-16 pb-12 lg:flex-1 lg:p-12 xl:p-20 flex flex-col lg:justify-center items-center lg:items-start">
                <div className="w-full max-w-lg text-center lg:text-left">
                    <div className="mb-12">
                         <div className="flex items-center justify-center lg:justify-start gap-3 mb-4">
                            <Sprout size={32} className="text-[var(--accent)]" />
                            <h1 className="text-5xl md:text-6xl font-black text-white tracking-tighter">
                                StrainVerse
                            </h1>
                         </div>
                        <p className="text-xl md:text-2xl text-white/70 font-medium mb-4">"The Universe of Strains, Powered by You."</p>
                        <p className="text-md text-white/50 leading-relaxed">
                           Discover, discuss, and share your favorite strains. StrainVerse is a social network built for the culture, centered around a living, community-powered encyclopedia of cannabis.
                        </p>
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <FeatureCard 
                            delay="0.2s" 
                            icon={Search} 
                            title="Explore Strains" 
                            description="Dive into a massive directory of strains with community photos and reviews." 
                        />
                         <FeatureCard 
                            delay="0.4s" 
                            icon={Users} 
                            title="Join Smoke Circles" 
                            description="Every strain has a live chat. Find your people and share your experience." 
                        />
                        <MockStrainCard delay="0.6s" />
                    </div>
                </div>
            </div>

            <div className="w-full lg:w-[480px] xl:w-[520px] flex-shrink-0 flex items-center justify-center p-8 lg:p-12 bg-black/30 lg:backdrop-blur-xl lg:border-l lg:border-white/5">
                <div className="w-full max-w-md opacity-0 animate-[fadeInUp_0.5s_ease-out_forwards]" style={{ animationDelay: '0.3s', animationFillMode: 'forwards' }}>
                    <AuthScreen onSuccess={onSuccess} />
                </div>
            </div>
        </div>
    </div>
  );
};

export default LandingPage;