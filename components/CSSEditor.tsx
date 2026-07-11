import React, { useState } from 'react';
import { X, Save, FileCode, Terminal } from 'lucide-react';

interface CSSEditorProps {
  initialCSS: string;
  initialJS: string;
  onSave: (css: string, js: string) => void;
  onClose: () => void;
  isGroup?: boolean;
}

const CSSEditor: React.FC<CSSEditorProps> = ({ initialCSS, initialJS, onSave, onClose, isGroup = false }) => {
  const [activeTab, setActiveTab] = useState<'CSS' | 'JS'>('CSS');
  const [css, setCss] = useState(initialCSS);
  const [js, setJs] = useState(initialJS || '');

  const jsPlaceholder = `/* 
  Write your custom JavaScript here!
  
  Examples:
  
  // Play a sound on load
  const audio = new Audio('https://mysound.com/sound.mp3');
  audio.play();

  // Add an event listener
  document.querySelector('.ys-avatar').addEventListener('click', () => {
     alert('You clicked my face!');
  });
*/`;

  return (
    <div className="fixed inset-0 bg-black/80 z-50 flex items-center justify-center p-4 backdrop-blur-sm">
      <div className="bg-[var(--bg-card)] border border-[var(--border)] rounded-xl w-full max-w-5xl flex flex-col h-[85vh] shadow-2xl shadow-[var(--shadow-color)]">
        {/* Header */}
        <div className="flex items-center justify-between p-4 border-b border-[var(--border)] bg-[var(--bg-main)]/50 rounded-t-xl">
          <div className="flex items-center gap-4">
            <h2 className="text-xl font-bold text-[var(--text-main)]">Theme Editor</h2>
            <div className="flex bg-[var(--bg-input)] rounded-lg p-1 border border-[var(--border)]">
                <button 
                    onClick={() => setActiveTab('CSS')}
                    className={`px-3 py-1 rounded-md text-xs font-bold flex items-center gap-2 transition-all ${activeTab === 'CSS' ? 'bg-[var(--accent)] text-[var(--bg-main)]' : 'text-[var(--text-muted)] hover:text-[var(--text-main)]'}`}
                >
                    <FileCode size={14} /> CSS
                </button>
                <button 
                    onClick={() => setActiveTab('JS')}
                    className={`px-3 py-1 rounded-md text-xs font-bold flex items-center gap-2 transition-all ${activeTab === 'JS' ? 'bg-[var(--accent)] text-[var(--bg-main)]' : 'text-[var(--text-muted)] hover:text-[var(--text-main)]'}`}
                >
                    <Terminal size={14} /> JavaScript
                </button>
            </div>
            <span className="text-xs bg-[var(--border-strong)] px-2 py-0.5 rounded text-[var(--text-muted)] uppercase tracking-wider font-bold">
              {isGroup ? 'Group Mode' : 'Profile Mode'}
            </span>
          </div>
          <button onClick={onClose} className="p-2 hover:bg-[var(--bg-hover)] rounded-full transition-colors text-[var(--text-muted)] hover:text-[var(--text-main)]">
            <X size={20} />
          </button>
        </div>

        {/* Body */}
        <div className="flex-1 flex flex-col md:flex-row overflow-hidden">
          {/* Editor Area */}
          <div className="flex-1 flex flex-col p-4 min-h-0 relative">
            <label className="text-sm font-medium text-[var(--text-muted)] mb-2 font-mono flex justify-between">
                <span>{activeTab === 'CSS' ? 'Styles (CSS)' : 'Scripts (JS)'}</span>
                {activeTab === 'JS' && <span className="text-[var(--neon-pink)] text-xs uppercase font-bold">Advanced / Risk</span>}
            </label>
            {activeTab === 'CSS' ? (
                <textarea
                    value={css}
                    onChange={(e) => setCss(e.target.value)}
                    className="flex-1 bg-[var(--bg-input)] text-[#a5b3ce] font-mono text-sm p-4 rounded-lg border border-[var(--border)] focus:ring-2 focus:ring-[var(--accent)] focus:outline-none resize-none leading-relaxed"
                    placeholder="/* Write your CSS here */"
                    spellCheck={false}
                />
            ) : (
                <textarea
                    value={js}
                    onChange={(e) => setJs(e.target.value)}
                    className="flex-1 bg-[#0d1117] text-[#79c0ff] font-mono text-sm p-4 rounded-lg border border-[var(--border)] focus:ring-2 focus:ring-[var(--accent)] focus:outline-none resize-none leading-relaxed"
                    placeholder={jsPlaceholder}
                    spellCheck={false}
                />
            )}
          </div>

          <div className={`w-full md:w-80 bg-[var(--bg-main)]/30 border-l border-[var(--border)] p-4 flex flex-col overflow-y-auto`}>
            <div className="text-[var(--text-muted)] text-xs space-y-2">
              <p className="font-semibold text-[var(--text-secondary)]">Available Selectors:</p>
              <ul className="list-disc list-inside font-mono text-[10px] space-y-1 text-[var(--text-muted)]">
                {isGroup ? (
                    <>
                        <li>.ys-group-root</li>
                        <li>.ys-group-header</li>
                        <li>.ys-group-chat</li>
                        <li>.ys-message-bubble</li>
                    </>
                ) : (
                    <>
                        <li>.ys-profile-root</li>
                        <li>.ys-header</li>
                        <li>.ys-avatar</li>
                        <li>.ys-bio</li>
                        <li>.ys-layout-grid</li>
                        <li>.ys-sidebar</li>
                        <li>.ys-feed</li>
                        <li>.ys-card</li>
                    </>
                )}
              </ul>
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="p-4 border-t border-[var(--border)] bg-[var(--bg-card)] flex justify-end gap-3">
          <button onClick={onClose} className="px-4 py-2 text-[var(--text-muted)] hover:bg-[var(--bg-hover)] rounded-lg transition-colors">
            Cancel
          </button>
          <button onClick={() => onSave(css, js)} className="px-6 py-2 bg-[var(--accent)] hover:bg-[var(--accent-hover)] text-white rounded-lg font-medium flex items-center gap-2 transition-colors shadow-lg shadow-[var(--accent)]/20">
            <Save size={18} />
            Save Changes
          </button>
        </div>
      </div>
    </div>
  );
};

export default CSSEditor;