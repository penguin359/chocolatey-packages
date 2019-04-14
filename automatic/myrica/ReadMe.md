# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/myrica/myrica.png" width="48" height="48"/> [Myrika](https://chocolatey.org/packages/myrica)

Based on multiple font files, it has been combined / modified to improve visibility and discrimination.

## Features inherited from the programming font Ricty
- ASCII characters "Inconsolata" apply.
- For other characters, "Genshin Gothic" or "Mgen +" is applied.
- The width ratio of half-width characters to full-width characters is adjusted to 1: 2.
- You can use highly visible Japanese characters (such as half-toned sounds).

## Features not found in Ricty
The following characters have hinting information, so they are also clear on Windows:
- ASCII characters inherit hinting information from hinted Inconsolata.
- (Hinting information is added to Hiragana and Katakana) -> As quality was not good, we canceled.

## Font configuration / distribution file

### Myrica.ttc
The ASCII character is a file based on Inconsolata, and the other character is a source based on Gothic.

### MyricaM.ttc
ASCII characters are files based on Inconsolata, and other characters are based on Mgen +.

## Glyph composition
The characters are considered to be easy to distinguish for programming.

The ASCII character (0x21-0x7E) has been replaced with "Inconsolata"* and the following changes have been made. 
__* Inconsolata: Sans serif monospaced Latin font highly regarded for "Top 10 Programming Fonts" and "the best font for programming".__

- r with serif (replaced with another glyph contained in Inconsolata)
- D with crossbar (replaced with another glyph contained in Inconsolata)
- Is a break line (replaced by another glyph contained in Inconsolata)

Other than ASCII characters were based on "Genshin Gothic"* or "Mgen +". 
__* Gengen Gothic: Japanese font created based on “Genno Koji Gothic” Mgen +: Japanese font created based on "M + OUTLINE FONTS".__

Some characters have been corrected:

``- Correct to increase "'`,.:;``
``- 0x002a *: astarsk (original)``
``- 0x006c l: small letter l (original)``
``- 0x2013 –: en dash – (refer to Ricty)``
``- 0x2014 —: em dash — (refer to Ricty)``
- It is easy to distinguish it as a turbidity point by enlarging the half turbidity point of "Papipupe Papipupepo" (With reference to Migu)
- Distinguish between "Ka-to-Ki-Echi-ro-to-One-Nii" (Katakana / Kanji) - (With reference to Migu)
- Distinguishing between "..." (FULLWIDTH TILDE · WAVE DASH) - (With reference to Migu)
- Distinguishing between "-one-" (katakana, kanji and minus)

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/myrica/screenshot.png)