import React, { useState } from 'react';
import { Widget } from '../types';
import { XCircle, Save, Loader2, Plus, Trash2, Youtube, Image as ImageIcon, FileText, GripVertical } from 'lucide-react';

interface WidgetsModalProps {
  widgets: Widget[];
  onClose: () => void;
  onSave: (widgets: Widget[]) => Promise<void>;
}

const WIDGET_TYPES: { type: Widget['type']; label: string; icon: React.ElementType; placeholder: string }[] = [
  { type: 'YOUTUBE', label: 'YouTube Video', icon: Youtube, placeholder: 'Paste a YouTube URL (e.g. https://youtube.com/watch?v=...)' },
  { type: 'IMAGE', label: 'Image', icon: ImageIcon, placeholder: 'Paste an image URL' },
  { type: 'TEXT', label: 'Text Block', icon: FileText, placeholder: 'Write something about yourself...' },
];

const widgetIcon = (type: Widget['type']): React.ElementType => {
  const found = WIDGET_TYPES.find(w => w.type === type);
  return found ? found.icon : FileText;
};

const WidgetsModal: React.FC<WidgetsModalProps> = ({ widgets: initialWidgets, onClose, onSave }) => {
  const [widgets, setWidgets] = useState<Widget[]>(initialWidgets);
  const [newType, setNewType] = useState<Widget['type']>('TEXT');
  const [newTitle, setNewTitle] = useState('');
  const [newContent, setNewContent] = useState('');
  const [isSaving, setIsSaving] = useState(false);
  const [error, setError] = useState('');

  const activeTypeConfig = WIDGET_TYPES.find(w => w.type === newType)!;

  const handleAddWidget = () => {
    if (!newContent.trim()) {
      setError('Please provide content for the widget.');
      return;
    }
    setError('');
    const widget: Widget = {
      id: `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
      type: newType,
      content: newContent.trim(),
      title: newTitle.trim() || undefined,
    };
    setWidgets(prev => [...prev, widget]);
    setNewTitle('');
    setNewContent('');
  };

  const handleRemoveWidget = (id: string) => {
    setWidgets(prev => prev.filter(w => w.id !== id));
  };

  const handleSave = async () => {
    setIsSaving(true);
    try {
      await onSave(widgets);
    } finally {
      setIsSaving(false);
    }
  };

  return (
    <div className="fixed inset-0 bg-black/80 z-50 flex items-center justify-center p-4 backdrop-blur-sm" onClick={onClose}>
      <div className="bg-[var(--bg-card)] border border-[var(--border)] rounded-xl w-full max-w-lg flex flex-col shadow-2xl shadow-[var(--shadow-color)] max-h-[85vh]" onClick={e => e.stopPropagation()}>
        <div className="flex items-center justify-between p-4 border-b border-[var(--border)]">
          <h2 className="text-lg font-bold">Manage Profile Widgets</h2>
          <button onClick={onClose} className="p-2 hover:bg-[var(--bg-hover)] rounded-full text-[var(--text-muted)] hover:text-white">
            <XCircle size={20} />
          </button>
        </div>

        <div className="p-6 space-y-4 overflow-y-auto flex-1">
          {widgets.length > 0 && (
            <div className="space-y-2">
              <label className="block text-xs font-bold text-[var(--text-muted)] uppercase tracking-wider mb-1">Your Widgets</label>
              {widgets.map(w => {
                const Icon = widgetIcon(w.type);
                return (
                  <div key={w.id} className="flex items-center gap-2 bg-[var(--bg-input)] border border-[var(--border)] rounded-lg p-2.5">
                    <GripVertical size={16} className="text-[var(--text-muted)] flex-shrink-0" />
                    <Icon size={16} className="text-[var(--accent)] flex-shrink-0" />
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-bold truncate">{w.title || w.type}</p>
                      <p className="text-xs text-[var(--text-muted)] truncate">{w.content}</p>
                    </div>
                    <button onClick={() => handleRemoveWidget(w.id)} className="p-1.5 text-[var(--text-muted)] hover:text-red-400 hover:bg-red-500/10 rounded-full flex-shrink-0">
                      <Trash2 size={16} />
                    </button>
                  </div>
                );
              })}
            </div>
          )}

          <div className="border-t border-[var(--border)] pt-4 space-y-3">
            <label className="block text-xs font-bold text-[var(--text-muted)] uppercase tracking-wider">Add a Widget</label>
            {error && <p className="text-sm text-red-400 bg-red-500/10 p-2 rounded-md">{error}</p>}
            <div className="flex gap-2">
              {WIDGET_TYPES.map(({ type, label, icon: Icon }) => (
                <button
                  key={type}
                  onClick={() => setNewType(type)}
                  className={`flex-1 flex flex-col items-center gap-1 p-2.5 rounded-lg border text-xs font-bold transition-colors ${
                    newType === type
                      ? 'bg-[var(--accent)] border-[var(--accent)] text-white'
                      : 'border-[var(--border)] text-[var(--text-muted)] hover:bg-[var(--bg-hover)]'
                  }`}
                >
                  <Icon size={16} />
                  {label}
                </button>
              ))}
            </div>
            <input
              type="text"
              value={newTitle}
              onChange={e => setNewTitle(e.target.value)}
              placeholder="Widget title (optional)"
              className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg p-2.5 text-sm focus:outline-none focus:border-[var(--accent)]"
            />
            {newType === 'TEXT' ? (
              <textarea
                value={newContent}
                onChange={e => setNewContent(e.target.value)}
                placeholder={activeTypeConfig.placeholder}
                className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg p-2.5 text-sm h-20 resize-none focus:outline-none focus:border-[var(--accent)]"
              />
            ) : (
              <input
                type="text"
                value={newContent}
                onChange={e => setNewContent(e.target.value)}
                placeholder={activeTypeConfig.placeholder}
                className="w-full bg-[var(--bg-input)] border border-[var(--border)] rounded-lg p-2.5 text-sm focus:outline-none focus:border-[var(--accent)]"
              />
            )}
            <button
              onClick={handleAddWidget}
              className="w-full flex items-center justify-center gap-2 bg-[var(--bg-input)] hover:bg-[var(--bg-hover)] border border-dashed border-[var(--border-strong)] text-sm font-bold py-2.5 rounded-lg transition-colors"
            >
              <Plus size={16} /> Add Widget
            </button>
          </div>
        </div>

        <div className="p-4 border-t border-[var(--border)] flex justify-end gap-3">
          <button onClick={onClose} className="px-4 py-2 text-sm text-[var(--text-muted)] hover:bg-[var(--bg-hover)] rounded-lg">
            Cancel
          </button>
          <button onClick={handleSave} disabled={isSaving} className="px-6 py-2 bg-[var(--accent)] hover:bg-[var(--accent-hover)] text-white rounded-lg font-medium flex items-center gap-2 disabled:opacity-50">
            {isSaving ? <Loader2 className="animate-spin" size={18} /> : <Save size={18} />}
            Save Widgets
          </button>
        </div>
      </div>
    </div>
  );
};

export default WidgetsModal;
