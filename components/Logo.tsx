import React from 'react';
import { Sprout } from 'lucide-react';

type LogoSize = 'sm' | 'md' | 'lg' | 'xl';

const iconSizes: Record<LogoSize, number> = {
  sm: 20,
  md: 24,
  lg: 32,
  xl: 36,
};

export const LogoMark: React.FC<{ size?: LogoSize; className?: string }> = ({ size = 'md', className = '' }) => (
  <Sprout className={`text-[var(--accent)] flex-shrink-0 ${className}`} size={iconSizes[size]} aria-hidden="true" />
);

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
