import React from 'react';
import { AppView, User } from '../types';
import { Sprout, Globe, MapPin, Users, User as UserIcon, LogOut, Flame } from 'lucide-react';
import Logo from './Logo';

interface SidebarProps {
  currentView: AppView;
  setView: (view: AppView) => void;
  user: User;
  onSignOut: () => void;
  userAge: number | null;
}

const navItems = [
    { view: AppView.STRAINVERSE, label: 'StrainVerse', icon: Sprout },
    { view: AppView.HERBHUB, label: 'HerbHub', icon: Globe },
    { view: AppView.MATCHIT, label: 'MatchIt', icon: Flame, ageGate: true },
    { view: AppView.SOCIALSESH, label: 'SocialSesh', icon: Users },
    { view: AppView.PROFILE, label: 'My Stash', icon: UserIcon },
];

const NavLink: React.FC<{ icon: React.ElementType, label: string, isActive: boolean, onClick: () => void }> = ({ icon: Icon, label, isActive, onClick }) => (
    <button
      onClick={onClick}
      style={isActive ? { animation: 'breathing-glow 3s ease-in-out infinite' } : {}}
      className={`flex items-center w-full gap-3 px-4 py-2.5 rounded-lg text-left transition-colors ${
        isActive
          ? 'bg-[var(--accent)] text-white font-bold'
          : 'text-[var(--text-secondary)] hover:bg-[var(--bg-hover)] hover:text-white'
      }`}
    >
      <Icon size={20} />
      <span>{label}</span>
    </button>
);

const Sidebar: React.FC<SidebarProps> = ({ currentView, setView, user, onSignOut, userAge }) => {
  const visibleNavItems = navItems.filter(item => {
    if (item.ageGate) {
        return userAge !== null && userAge >= 21;
    }
    return true;
  });

  return (
    <aside className="w-64 h-screen sticky top-0 border-r border-[var(--border)] p-4 flex-col justify-between hidden lg:flex">
      <div>
        <div className="mb-8 px-2">
            <Logo />
        </div>

        <nav className="space-y-2">
            {visibleNavItems.map(item => (
                <NavLink
                  key={item.view}
                  icon={item.icon}
                  label={item.label}
                  isActive={currentView === item.view}
                  onClick={() => setView(item.view)}
                />
            ))}
        </nav>
      </div>
      
      <div className="border-t border-[var(--border)] pt-4">
        <div className="flex items-center gap-3">
            <img src={user.avatar} alt={user.name} className="w-10 h-10 rounded-full" />
            <div className="flex-1 min-w-0">
                <p className="font-bold text-sm truncate">{user.name}</p>
                <p className="text-xs text-[var(--text-muted)] truncate">@{user.handle}</p>
            </div>
            <button onClick={onSignOut} className="p-2 text-[var(--text-muted)] hover:text-white hover:bg-[var(--bg-hover)] rounded-lg transition-colors">
                <LogOut size={18} />
            </button>
        </div>
      </div>
    </aside>
  );
};

export default Sidebar;