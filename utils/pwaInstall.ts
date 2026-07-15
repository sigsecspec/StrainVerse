export interface BeforeInstallPromptEvent extends Event {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>;
}

export const PWA_INSTALL_DISMISS_KEY = 'strainverse-pwa-install-dismissed';
export const PWA_INSTALL_AVAILABLE_EVENT = 'strainverse-pwa-install-available';

let deferredPrompt: BeforeInstallPromptEvent | null = null;
const listeners = new Set<() => void>();

export const getDeferredInstallPrompt = () => deferredPrompt;

export const onInstallPromptAvailable = (listener: () => void) => {
  listeners.add(listener);
  if (deferredPrompt) listener();
  return () => listeners.delete(listener);
};

export const isStandaloneMode = () =>
  window.matchMedia('(display-mode: standalone)').matches ||
  (window.navigator as Navigator & { standalone?: boolean }).standalone === true;

export const isIOS = () => /iphone|ipad|ipod/i.test(navigator.userAgent);

export const isAndroid = () => /android/i.test(navigator.userAgent);

export const isChromiumDesktop = () => {
  const ua = navigator.userAgent;
  return /chrome|chromium|crios/i.test(ua) && !/edg|opr|brave|mobile/i.test(ua) && !isIOS();
};

const notifyListeners = () => {
  listeners.forEach((listener) => listener());
};

if (typeof window !== 'undefined') {
  window.addEventListener('beforeinstallprompt', (event) => {
    event.preventDefault();
    deferredPrompt = event as BeforeInstallPromptEvent;
    notifyListeners();
    window.dispatchEvent(new Event(PWA_INSTALL_AVAILABLE_EVENT));
  });

  window.addEventListener('appinstalled', () => {
    deferredPrompt = null;
    localStorage.removeItem(PWA_INSTALL_DISMISS_KEY);
  });
}
