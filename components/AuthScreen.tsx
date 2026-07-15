import React, { useState } from 'react';
import { auth, api, formatSupabaseError } from '../services/supabaseClient';
import { Loader2, Sprout } from 'lucide-react';

interface AuthScreenProps {
  onSuccess: () => void;
}

const AuthScreen: React.FC<AuthScreenProps> = ({ onSuccess }) => {
  const [isLogin, setIsLogin] = useState(true);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [name, setName] = useState('');
  const [handle, setHandle] = useState('');
  const [dob, setDob] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      if (isLogin) {
        const { error } = await auth.signIn(email, password);
        if (error) throw error;
        const user = await api.getCurrentUser();
        if (!user) {
          throw new Error('Signed in but could not load your profile. Please try again.');
        }
      } else {
        if (!name || !handle || !dob) {
          throw new Error("Please fill out all fields.");
        }
        const { error } = await auth.signUp(email, password, name, handle, dob);
        if (error) throw error;
        const user = await api.getCurrentUser();
        if (!user) {
          throw new Error('Account created but could not load your profile. Try signing in.');
        }
      }
      onSuccess();
    } catch (err: any) {
      const msg = err.message || formatSupabaseError(err) || "An error occurred";
      if (msg.toLowerCase().includes('invalid login credentials')) {
        setError('Invalid email or password. If you signed up on Cookbook, use the same credentials here.');
      } else if (msg.toLowerCase().includes('already registered')) {
        setError('This email is already registered. Sign in with your Cookbook or Verse password.');
        setIsLogin(true);
      } else if (msg.toLowerCase().includes('schema cache') || msg.toLowerCase().includes('repair_postgrest_schemas')) {
        setError(msg);
      } else {
        setError(msg);
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="w-full bg-[var(--bg-card)] border border-[var(--border)] rounded-2xl shadow-2xl shadow-black/50 relative z-10 overflow-hidden">
      <div className="p-8 text-center border-b border-[var(--border)] bg-[var(--bg-main)]/50 backdrop-blur">
        <div className="w-14 h-14 bg-[var(--accent)]/20 text-[var(--accent)] rounded-xl flex items-center justify-center border border-[var(--border)] mx-auto mb-4 shadow-[0_0_20px_rgba(34,95,65,0.3)]">
          <Sprout size={28} />
        </div>
        <h1 className="text-2xl font-black text-[var(--text-main)] mb-1 tracking-tight">
          Welcome to StrainVerse
        </h1>
        <p className="text-[var(--text-muted)] text-sm font-medium">{isLogin ? 'Sign in to continue' : 'Create your account'}</p>
        <p className="text-[var(--text-muted)]/80 text-xs mt-2">
          One Verse account works across Cookbook, StrainVerse, and more.
        </p>
      </div>

      <div className="p-8">
        <form onSubmit={handleSubmit} className="space-y-4">
          {error && (
            <div className="p-3 bg-red-500/10 border border-red-500/20 rounded-lg text-red-400 text-xs text-center">
              {error}
            </div>
          )}

          {!isLogin && (
            <>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-[var(--text-muted)] text-xs font-bold uppercase tracking-wider mb-1">Display Name</label>
                  <input
                    type="text"
                    required
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="Alex Smith"
                    className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg px-4 py-2.5 text-[var(--text-main)] text-sm focus:border-[var(--accent)] outline-none transition-colors placeholder-[var(--text-muted)]/30"
                  />
                </div>
                <div>
                  <label className="block text-[var(--text-muted)] text-xs font-bold uppercase tracking-wider mb-1">Handle</label>
                  <input
                    type="text"
                    required
                    value={handle}
                    onChange={(e) => setHandle(e.target.value.toLowerCase().replace(/\s/g, ''))}
                    placeholder="@alex"
                    className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg px-4 py-2.5 text-[var(--text-main)] text-sm focus:border-[var(--accent)] outline-none transition-colors placeholder-[var(--text-muted)]/30"
                  />
                </div>
              </div>
               <div>
                <label className="block text-[var(--text-muted)] text-xs font-bold uppercase tracking-wider mb-1">Date of Birth</label>
                <input
                  type="date"
                  required
                  value={dob}
                  onChange={(e) => setDob(e.target.value)}
                  className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg px-4 py-2.5 text-[var(--text-main)] text-sm focus:border-[var(--accent)] outline-none transition-colors"
                />
              </div>
            </>
          )}

          <div>
            <label className="block text-[var(--text-muted)] text-xs font-bold uppercase tracking-wider mb-1">Email Address</label>
            <input
              type="email"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="you@example.com"
              className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg px-4 py-2.5 text-[var(--text-main)] text-sm focus:border-[var(--accent)] outline-none transition-colors placeholder-[var(--text-muted)]/30"
            />
          </div>

          <div>
            <label className="block text-[var(--text-muted)] text-xs font-bold uppercase tracking-wider mb-1">Password</label>
            <input
              type="password"
              required
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="••••••••"
              className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg px-4 py-2.5 text-[var(--text-main)] text-sm focus:border-[var(--accent)] outline-none transition-colors placeholder-[var(--text-muted)]/30"
            />
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-[var(--accent)] hover:bg-[var(--accent-hover)] text-white font-bold py-3 rounded-lg shadow-lg shadow-[var(--accent)]/30 transition-all active:scale-[0.98] flex items-center justify-center gap-2 mt-6"
          >
            {loading ? <Loader2 className="animate-spin" size={18} /> : (isLogin ? 'Sign In' : 'Create Account')}
          </button>
        </form>

        <div className="mt-6 text-center">
          <p className="text-[var(--text-muted)] text-sm">
            {isLogin ? "Don't have an account?" : "Already have an account?"}
            <button
              onClick={() => setIsLogin(!isLogin)}
              className="ml-2 text-[var(--accent)] hover:text-white/80 hover:underline font-medium transition-colors"
            >
              {isLogin ? "Sign Up" : "Log In"}
            </button>
          </p>
        </div>
      </div>
    </div>
  );
};

export default AuthScreen;