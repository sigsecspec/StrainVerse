import { GoogleGenAI, Type } from "@google/genai";
import { StrainSuggestion } from "../types";

const getAI = () => {
  // Strict adherence to using process.env.API_KEY directly
  return new GoogleGenAI({ apiKey: process.env.API_KEY });
};

export const generateSocialPost = async (topic: string): Promise<string> => {
  try {
    const ai = getAI();
    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: `Write a short, engaging social media post about: ${topic}. Keep it under 280 characters.`,
    });
    return response.text || "Just thinking about stuff...";
  } catch (e) {
    return "Hello world!";
  }
};

export const generateStrainSuggestion = async (mood: string, time: string, effect: string): Promise<StrainSuggestion | null> => {
  try {
    const ai = getAI();
    
    const fullPrompt = `
      You are a cannabis strain expert. A user wants a strain recommendation.
      Their preferences are:
      - Mood: "${mood}"
      - Time of day: "${time}"
      - Desired effect: "${effect}"
      
      Recommend one suitable cannabis strain.
    `;

    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: fullPrompt,
      config: {
        responseMimeType: "application/json",
        responseSchema: {
          type: Type.OBJECT,
          properties: {
            strainName: {
              type: Type.STRING,
              description: "The name of the recommended strain.",
            },
            description: {
              type: Type.STRING,
              description: "A brief, engaging description of the strain and its likely effects based on the user's preferences.",
            },
            type: {
              type: Type.STRING,
              description: "The type of the strain (Indica, Sativa, or Hybrid).",
            },
          },
          required: ["strainName", "description", "type"],
        },
      },
    });

    const jsonText = response.text?.trim();
    if (!jsonText) return null;
    
    return JSON.parse(jsonText) as StrainSuggestion;

  } catch (error) {
    console.error("Error generating strain suggestion:", error);
    return null;
  }
};

export const generateStonerCamImage = async (prompt: string, imageBase64: string, mimeType: string): Promise<string | null> => {
  try {
    const ai = getAI();
    
    const imagePart = {
      inlineData: {
        data: imageBase64,
        mimeType: mimeType,
      },
    };
    const textPart = { text: `User photo edit request. Keep the original person's likeness and pose, but apply this creative filter: "${prompt}". Make it fun and vibrant, suitable for a cannabis culture social media app.` };
    
    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash-image', // Using Flash for faster image generation
      contents: { parts: [imagePart, textPart] },
    });

    for (const part of response.candidates[0].content.parts) {
      if (part.inlineData) {
        return part.inlineData.data;
      }
    }
    return null;
  } catch (error) {
    console.error("Error generating Stoner Cam image:", error);
    return null;
  }
};

// Fix: Add missing generateCSSTheme function to resolve import error in CSSEditor.tsx
export const generateCSSTheme = async (prompt: string, isGroup: boolean): Promise<string> => {
    const selectors = isGroup 
        ? `.ys-group-root, .ys-group-header, .ys-group-chat, .ys-message-bubble` 
        : `.ys-profile-root, .ys-header, .ys-avatar, .ys-bio, .ys-card`;
    
    const fullPrompt = `
        You are an expert CSS theme designer for a social media app.
        A user wants a theme based on the prompt: "${prompt}".
        
        The theme will be applied to these CSS selectors: ${selectors}.
        
        Generate a CSS theme using ONLY CSS variables within a ":root" selector. Do NOT include any other CSS rules.
        The theme should be modern, clean, and visually appealing.
        You MUST define variables for the following properties:
        --bg-main, --bg-card, --bg-hover, --bg-input, --border, --border-strong, 
        --text-main, --text-secondary, --text-muted, --accent, --accent-hover, --shadow-color.
        
        Make sure the colors have good contrast and are accessible.
        Return ONLY the CSS code inside a \`\`\`css code block.
        
        Example output format:
        \`\`\`css
        :root {
            --bg-main: #1a1a1a;
            --bg-card: #2a2a2a;
            /* ...and so on */
        }
        \`\`\`
    `;

    try {
        const ai = getAI();
        const response = await ai.models.generateContent({
            model: 'gemini-2.5-flash',
            contents: fullPrompt,
        });

        const cssText = response.text || '';
        // Extract content from markdown code block
        const match = cssText.match(/```css\s*([\s\S]*?)\s*```/);
        return match ? match[1].trim() : `/* Sorry, couldn't generate a theme. */`;
    } catch (e) {
        console.error("Error generating CSS theme:", e);
        return `/* AI Error: Please try again. */`;
    }
};

export const generateHighdea = async (): Promise<string> => {
    try {
        const ai = getAI();
        const response = await ai.models.generateContent({
            model: 'gemini-2.5-flash',
            contents: 'Generate a short, funny, weird, or profound "highdea". Something you would think of while stoned. Keep it to one or two sentences.',
        });
        return response.text || "What if we're all just sims in a game played by a giant cat?";
    } catch(e) {
        return "If you wash your hands, your hands get clean. But what does the water get?";
    }
};

export const generateVibeOfTheDay = async (): Promise<string> => {
    try {
        const ai = getAI();
        const response = await ai.models.generateContent({
            model: 'gemini-2.5-flash',
            contents: 'Generate a short, witty, or philosophical quote related to cannabis culture. Make it fun and engaging for a social media app. Maximum 1-2 sentences.',
        });
        return response.text || "Keep it weird, stay lifted.";
    } catch(e) {
        return "The highest minds have the quietest thoughts.";
    }
};

export const moderatePostContent = async (content: string): Promise<{ isSafe: boolean; reason: string | null }> => {
    const prompt = `You are a content moderation AI for a social network where users connect locally. Analyze the following text for these violations ONLY:
1.  **Personal Identifiable Information**: Real-world addresses, phone numbers, email addresses, social media handles (e.g., @username, fb.com/name).
2.  **Explicit Meet-up Instructions**: Phrases that specify a precise location and time for a meeting (e.g., "pull up to 123 Main St at 4pm", "meet me at the corner of...").
3.  **Solicitation of Illegal Sales**: Language that clearly indicates buying or selling of illegal substances.
The community discusses cannabis, so do NOT flag terms like "smoke," "sesh," "strain," or "420." The goal is to prevent doxxing, unsafe meetups, and illegal transactions.

If a violation is found, respond with JSON: \`{"isSafe": false, "reason": "A brief, user-friendly explanation of the violation."}\`.
If no violations are found, respond with JSON: \`{"isSafe": true, "reason": null}\`.

Text to analyze:
"${content}"`;

    try {
        const ai = getAI();
        const response = await ai.models.generateContent({
            model: 'gemini-2.5-flash',
            contents: prompt,
            config: {
                responseMimeType: "application/json",
                responseSchema: {
                    type: Type.OBJECT,
                    properties: {
                        isSafe: { type: Type.BOOLEAN },
                        reason: { type: Type.STRING, nullable: true },
                    },
                    required: ['isSafe', 'reason'],
                },
            },
        });

        const jsonText = response.text?.trim();
        if (!jsonText) return { isSafe: false, reason: "AI moderation failed. Please try again." };
        
        return JSON.parse(jsonText);
    } catch (error) {
        console.error("Error during content moderation:", error);
        // Fail open to avoid blocking users due to AI service issues, but could be changed to fail closed.
        return { isSafe: true, reason: null };
    }
};