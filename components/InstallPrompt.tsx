import React, { useEffect, useState } from 'react';
import { Download, X, Share, Sprout } from 'lucide-react';

interface BeforeInstallPromptEvent extends Event {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>;
}

const DISMISS_KEY = 'strainverse-pwa-install-dismissed';

const isStandaloneMode = () =>
  window.matchMedia('(display-mode: standalone)').matches ||
  (window.navigator as Navigator & { standalone?: boolean }).standalone === true;

const isIOS = () => /iphone|ipad|ipod/i.test(navigator.userAgent);

const InstallPrompt: React.FC = () => {
  const [deferredPrompt, setDeferredPrompt] = useState<BeforeInstallPromptEvent | null>(null);
  const [visible, setVisible] = useState(false);
  const [showIOSHelp, setShowIOSHelp] = useState(false);
  const [isInstalling, setIsInstalling] = useState(false);

  useEffect(() => {
    if (isStandaloneMode() || localStorage.getItem(DISMISS_KEY) === '1') {
      return;
    }

    const onBeforeInstall = (event: Event) => {
      event.preventDefault();
      setDeferredPrompt(event as BeforeInstallPromptEvent);
      setShowIOSHelp(false);
      setVisible(true);
    };

    window.addEventListener('beforeinstallprompt', onBeforeInstall);

    // iOS Safari has no beforeinstallprompt — offer Add to Home Screen help instead
    if (isIOS()) {
      const timer = window.setTimeout(() => setVisible(true), 2500);
      return () => {
        window.removeEventListener('beforeinstallprompt', onBeforeInstall);
        window.clearTimeout(timer);
      };
    }

    return () => window.removeEventListener('beforeinstallprompt', onBeforeInstall);
  }, []);

  const dismiss = () => {
    localStorage.setItem(DISMISS_KEY, '1');
    setVisible(false);
    setDeferredPrompt(null);
  };

  const handleInstall = async () => {
    if (isIOS() || !deferredPrompt) {
      setShowIOSHelp(true);
      return;
    }

    setIsInstalling(true);
    try {
      await deferredPrompt.prompt();
      const { outcome } = await deferredPrompt.userChoice;
      if (outcome === 'accepted') {
        dismiss();
      }
    } catch (error) {
      console.error('PWA install failed:', error);
    } finally {
      setIsInstalling(false);
      setDeferredPrompt(null);
    }
  };

  if (!visible || isStandaloneMode()) {
    return null;
  }

  return (
    <div className="fixed bottom-20 lg:bottom-6 left-4 right-4 z-50 mx-auto max-w-md fade-in-up" role="dialog" aria-label="Install StrainVerse app">
      <div
        className="rounded-2xl border shadow-2xl overflow-hidden"
        style={{ background: 'var(--bg-card)', borderColor: 'var(--border)', boxShadow: '0 8px 32px rgba(0,0,0,0.5)' }}
      >
        <div className="p-4 flex items-start gap-3">
          <div
            className="w-12 h-12 rounded-xl flex items-center justify-center flex-shrink-0"
            style={{ background: 'rgba(34, 95, 65, 0.2)', color: 'var(--accent)' }}
          >
            <Sprout size={24} />
          </div>
          <div className="flex-1 min-w-0">
            <h3 className="font-bold text-white text-sm">Install StrainVerse</h3>
            <p className="text-xs mt-0.5" style={{ color: 'var(--text-muted)' }}>
              {showIOSHelp || (isIOS() && !deferredPrompt)
                ? 'Tap Share, then "Add to Home Screen" for the full app experience.'
                : 'Add to your home screen for faster access and an app-like experience.'}
            </p>
          </div>
          <button
            onClick={dismiss}
            className="p-1.5 rounded-full flex-shrink-0 hover:bg-white/10 transition-colors"
            style={{ color: 'var(--text-muted)' }}
            aria-label="Dismiss install prompt"
          >
            <X size={18} />
          </button>
        </div>

        {!showIOSHelp && !(isIOS() && !deferredPrompt) && (
          <div className="px-4 pb-4">
            <button
              onClick={handleInstall}
              disabled={isInstalling}
              className="w-full flex items-center justify-center gap-2 py-2.5 rounded-xl font-bold text-sm text-white transition-colors disabled:opacity-60"
              style={{ background: 'var(--accent)' }}
            >
              <Download size={16} />
              {isInstalling ? 'Installing...' : 'Install App'}
            </button>
          </div>
        )}

        {(showIOSHelp || (isIOS() && !deferredPrompt)) && (
          <div className="px-4 pb-4 flex items-center gap-2 text-xs rounded-lg py-2 mx-4 mb-4" style={{ background: 'var(--bg-input)', color: 'var(--text-secondary)' }}>
            <Share size={14} className="flex-shrink-0 text-sky-400" />
            <span>Share → Add to Home Screen</span>
          </div>
        )}
      </div>
    </div>
  );
};

export default InstallPrompt;
