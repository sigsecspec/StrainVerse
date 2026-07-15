import React from 'react';
import { Sprout } from 'lucide-react';

type LogoSize = 'sm' | 'md' | 'lg' | 'xl';

const sizeConfig: Record<LogoSize, { box: string; icon: number }> = {
  sm: { box: 'w-8 h-8', icon: 16 },
  md: { box: 'w-10 h-10', icon: 20 },
  lg: { box: 'w-12 h-12', icon: 24 },
  xl: { box: 'w-14 h-14', icon: 28 },
};

export const LogoMark: React.FC<{ size?: LogoSize; className?: string }> = ({ size = 'md', className = '' }) => {
  const { box, icon } = sizeConfig[size];

  return (
    <div
      className={`${box} bg-[var(--accent)]/20 rounded-lg flex items-center justify-center border border-[var(--border-strong)] shadow-md flex-shrink-0 ${className}`}
      aria-hidden="true"
    >
      <Sprout className="text-[var(--accent)]" size={icon} />
    </div>
  );
};

interface LogoProps {
  size?: LogoSize;
  showText?: boolean;
  showTagline?: boolean;
  className?: string;
  titleClassName?: string;
}

const Logo: React.FC<LogoProps> = ({
  size = 'md',
  showText = true,
  showTagline = false,
  className = '',
  titleClassName = 'text-xl',
}) => (
  <div className={`flex items-center gap-3 ${className}`}>
    <LogoMark size={size} />
    {showText && (
      <div>
        <h1 className={`font-black tracking-tight text-white ${titleClassName}`}>StrainVerse</h1>
        {showTagline && (
          <p className="text-[var(--text-muted)] text-sm -mt-1">The Universe of Strains, Powered by You.</p>
        )}
      </div>
    )}
  </div>
);

export default Logo;
