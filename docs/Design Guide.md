# Byzantine Doors — Design Guide

*This document defines the visual identity, typography, color system, and design principles for byzantinedoors.com. All design and development work should reference this guide.*

---

## 1. DESIGN PHILOSOPHY

**The metaphor: Stepping into a Byzantine church.**

The site should evoke the experience of walking through the doors of an Eastern church — the warm darkness, the glow of candlelight on gold, the quiet grandeur of icons looking back at you. This is not a heritage site or a museum. It is a living, breathing space that invites you deeper.

**Key principles:**

- **Beauty first, but never at the cost of clarity.** Eastern Christianity leads with beauty. The site should feel like a place you want to linger, but every piece of text must be readable, every navigation path must be obvious.
- **Warmth over coldness.** Everything is warm-toned. No cool grays, no blue-whites, no sterile tech aesthetics. Even the darkest backgrounds should feel like dark wood, not dark steel.
- **Invitation over intimidation.** The aesthetic should feel welcoming to someone who has never set foot in an Eastern church. Beautiful, yes. Overwhelming, no.
- **Anglo-Byzantine.** This is an English-language site for English speakers. No Slavonic script, no untranslated text, no visual elements that signal "this is for insiders." The Eastern aesthetic is communicated through color, typography, proportion, and imagery — not through cultural markers that exclude.

---

## 2. COLOR PALETTE

The palette is drawn from the physical elements of a Byzantine church interior: beeswax candles, gold leaf, aged wood, incense smoke, and the deep reds and blues of iconography.

### Primary colors

| Name | Hex | Role | Usage |
|------|-----|------|-------|
| Narthex dark | `#0D0B08` | Primary background | Navigation, hero sections, landing pages, immersive areas |
| Warm dark | `#1A1611` | Reading surface | Article content, catechetical pages, daily reflections, tools |
| Icon wall | `#151210` | Card/surface background | Elevated surfaces, cards, panels on the dark background |
| Halo gold | `#BA8F43` | Primary accent | Links, highlights, borders, icons, interactive elements |
| Beeswax | `#E8DCC8` | Primary text | Headlines, important body text on dark backgrounds |
| Aged vellum | `#C4B8A5` | Body text | Extended reading content, article body text |
| Censer smoke | `#8B7D6B` | Muted/secondary text | Metadata, captions, breadcrumbs, secondary information |
| Deep muted | `#6B5F50` | Tertiary text | Timestamps, attributions, lowest-priority information |

### Accent colors (used sparingly)

| Name | Hex | Role | Usage |
|------|-----|------|-------|
| Liturgical red | `#7B2D3B` | Warm accent | Feast days, liturgical markers, occasional emphasis |
| Theotokos blue | `#1D3A4A` | Cool accent | Marian content, contrast sections, secondary categorization |

### Gold scale (for borders, dividers, interactive states)

| State | Value | Usage |
|-------|-------|-------|
| Gold full | `#BA8F43` | Active links, primary buttons, key accents |
| Gold 40% | `rgba(186,143,67,0.4)` | Button borders, outlined elements |
| Gold 15% | `rgba(186,143,67,0.15)` | Dividers, section borders, subtle separators |
| Gold 10% | `rgba(186,143,67,0.1)` | Container borders, card outlines |
| Gold 6% | `rgba(186,143,67,0.06)` | Background tints, hover states |
| Gold 4% | `rgba(186,143,67,0.04)` | Pullquote backgrounds, very subtle emphasis |

### Background glow effect

For hero sections and landing pages, a radial gradient creates the illusion of candlelight:

```css
background: radial-gradient(ellipse at 50% 30%, rgba(186,143,67,0.12) 0%, transparent 60%);
```

This should be used as an overlay (`position: absolute` with `pointer-events: none`), not as the main background.

---

## 3. TYPOGRAPHY

### Three-font system

The site uses three typefaces, each with a distinct role. No other fonts should be used.

#### Display — Cormorant Garamond (Google Fonts)

- **Role:** Page titles, article headlines, hero text, pullquotes, section headers
- **Weights:** 300 (light — heroes and large display), 400 (regular — article titles), 500 (medium — emphasis), italic (pullquotes)
- **Character:** High contrast between thick and thin strokes. Elegant, dramatic, evokes the grandeur of liturgical books without being ornate. At large sizes, it has the presence of a cathedral inscription.
- **Sizing:**
  - Hero/page titles: 28–36px, weight 300, letter-spacing 2–4px
  - Article titles: 22–26px, weight 400
  - Section headers: 18–20px, weight 500
  - Pullquotes: 19px, italic

#### Body — EB Garamond (Google Fonts)

- **Role:** Article body text, catechetical content, daily reflections, extended reading
- **Weights:** 400 (regular — body text), 500 (medium — inline emphasis), italic (Father quotes within body text)
- **Character:** Designed specifically for sustained screen reading. Faithful to Garamond's humanist tradition — warm, open, and comfortable for long sessions. Pairs naturally with Cormorant Garamond without competing.
- **Sizing:**
  - Body text: 17px, line-height 1.8
  - Layer 2 commentary: 15px, line-height 1.7
  - Father quotes in Layer 2: 16px italic, line-height 1.7

#### UI — Inter (Google Fonts)

- **Role:** Navigation, buttons, metadata, tags, breadcrumbs, form elements, labels, captions
- **Weights:** 300 (light — captions), 400 (regular — navigation), 500 (medium — button labels)
- **Character:** Clean, modern, highly legible at small sizes. Provides crisp contrast against the serif fonts, signaling "this is functional" vs. "this is content."
- **Sizing:**
  - Navigation links: 12–13px, letter-spacing 0.5px
  - Buttons: 11–12px, letter-spacing 0.5–1px
  - Metadata/tags: 10–11px, letter-spacing 1–2px
  - Breadcrumbs: 11px

### Decorative touches (replacing Slavonic)

Where decorative typographic elements are needed (drop caps, section dividers, logo mark), use Cormorant Garamond at display sizes with gold color at reduced opacity. This achieves the illuminated manuscript feel without introducing non-Latin script.

- **Drop caps:** Cormorant Garamond, 48–56px, `#BA8F43` at 70% opacity, floated left
- **Section dividers:** Three-star pattern (✦ ✦ ✦) in gold at 40% opacity, or a thin gold rule
- **Logo:** "Byzantine Doors" in Cormorant Garamond light, with a stylized Byzantine cross or "BD" monogram

### Font loading

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;1,400;1,500&family=EB+Garamond:ital,wght@0,400;0,500;1,400&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
```

---

## 4. HYBRID SURFACE APPROACH

The site uses two background surfaces to balance immersion with readability.

### Immersive surface — `#0D0B08` (Narthex dark)

Used for areas that should feel like entering the church: navigation bars, hero sections, landing pages, the liturgical calendar, and any "gateway" experiences.

These areas can use the candlelight glow effect, larger typography, and more dramatic visual treatment.

### Reading surface — `#1A1611` (Warm dark)

Used for any area where users will spend time reading: article content, catechetical pages, daily reflections, practical tools, Layer 2 expansions.

The warmer tone reduces eye strain during extended reading. The difference from the immersive surface is subtle but meaningful over long content.

### Transition

The shift between surfaces uses a CSS gradient over ~40px:

```css
background: linear-gradient(to bottom, #0D0B08, #1A1611);
```

This avoids a hard line between the two zones.

---

## 5. COMPONENT PATTERNS

### Navigation bar

- Background: Narthex dark (`#0D0B08`)
- Logo: Cormorant Garamond 17–18px, Halo gold
- Links: Inter 12–13px, Censer smoke (`#8B7D6B`), active state in Beeswax (`#E8DCC8`)
- CTA button: Inter 11–12px, Halo gold text, 0.5px gold border at 40% opacity, 4px border-radius
- Bottom border: 0.5px solid gold at 10% opacity

### Article page

- Breadcrumbs: Inter 11px, Deep muted (`#6B5F50`), separator arrows in Halo gold
- Title: Cormorant Garamond 26px weight 400, Beeswax
- Metadata: Inter 11px, Censer smoke, COP references in Halo gold
- Body: EB Garamond 17px, Aged vellum (`#C4B8A5`), line-height 1.8
- Drop cap (first article letter): Cormorant Garamond 48–56px, Halo gold at 70% opacity

### Pullquotes

- Left border: 2px solid Halo gold
- Background: Gold at 4% opacity
- Border radius: 0 top-left/bottom-left, 8px top-right/bottom-right
- Quote text: Cormorant Garamond italic 19px, lighter Beeswax (`#D4C5AB`)
- Attribution: Inter 11–12px, Censer smoke

### Layer 2 expansion panels

- Container: 0.5px gold border at 15%, 8px border-radius
- Header: Gold at 6% background, Inter 13px weight 500 for label, "LAYER 2" tag in gold
- Body: EB Garamond 15px for commentary, 16px italic for Father quotes
- Father quote sidebar: 1px left border in gold at 20%

### Buttons

- Primary (filled): Inter 12px, Narthex dark text on Halo gold background, 4px border-radius
- Secondary (outlined): Inter 12px, Halo gold text, 0.5px gold border at 40%, 4px border-radius
- Hover states: subtle opacity shift or background tint

### Cards (for Journey steps, Library topics)

- Background: Icon wall (`#151210`)
- Border: 0.5px gold at 15%
- Border radius: 12px
- Top accent: 1px gradient line (`transparent → gold 30% → transparent`)
- Padding: 24px

---

## 6. ICONOGRAPHY

### Source: Public domain museum collections

All icons used on the site should come from verified public domain or CC0 sources:

- **The Metropolitan Museum of Art** — Open Access program, CC0 license, API available for bulk access. Over 492,000 images including Byzantine art collection. https://www.metmuseum.org/hubs/open-access
- **Wikimedia Commons** — Byzantine icons category with century-specific subcategories (6th–15th century). High resolution. https://commons.wikimedia.org/wiki/Category:Byzantine_icons
- **Byzantine and Christian Museum, Athens** — ~3,000 digitized icons. https://www.ebyzantinemuseum.gr/
- **Dumbarton Oaks** — Image Collections and Fieldwork Archives for Byzantine studies. https://www.doaks.org/visit/museum/galleries/byzantine-gallery

### Usage guidelines

- Icons should be used as atmospheric elements, not as illustrations or clip art
- Present icons with reverence — adequate spacing, no cropping of faces or hands, no filters that distort the original
- Always provide attribution (museum, date, origin) even when not legally required — this models good practice and adds educational value
- Consider using icons as full-bleed background images at low opacity behind hero sections, or as featured images on article pages
- When possible, select icons that relate to the content topic (e.g., a Trinity icon for the Trinity article, a Theotokos icon for Marian content)

---

## 7. ACCESSIBILITY STANDARDS

### Contrast ratios (WCAG AA compliance)

| Element | Foreground | Background | Ratio | Status |
|---------|-----------|-----------|-------|--------|
| Headlines (Beeswax on Narthex dark) | `#E8DCC8` | `#0D0B08` | 11.7:1 | Pass |
| Body text (Aged vellum on Warm dark) | `#C4B8A5` | `#1A1611` | 7.4:1 | Pass |
| Body text (Aged vellum on Narthex dark) | `#C4B8A5` | `#0D0B08` | 8.2:1 | Pass |
| Gold accent on dark | `#BA8F43` | `#0D0B08` | 5.4:1 | Pass |
| Muted text (Censer smoke on dark) | `#8B7D6B` | `#0D0B08` | 3.8:1 | Caution |

### Muted text guidance

Censer smoke (`#8B7D6B`) at 3.8:1 does not meet WCAG AA for normal-sized text (requires 4.5:1). Use it ONLY for:
- Purely decorative metadata that is not essential to understanding
- Text at 14px+ bold or 18px+ regular (where the AA threshold is 3:1)

For any functional secondary text, use Aged vellum (`#C4B8A5`) instead, which passes at all sizes.

### Additional requirements

- All images must have descriptive alt text
- Navigation must be fully keyboard-accessible
- Focus states must be visible (gold outline ring)
- Font sizes must never go below 11px
- Touch targets must be at least 44x44px on mobile
- The Layer 2/3 expansion panels must be accessible via keyboard (Enter/Space to toggle)
- Screen reader users must be able to navigate by heading structure

---

## 8. RESPONSIVE CONSIDERATIONS

- The dark immersive aesthetic translates well to mobile — dark themes reduce battery usage on OLED screens
- Typography should scale proportionally: hero text ~24px on mobile, body text stays at 16–17px
- Navigation collapses to a hamburger menu with the same dark/gold treatment
- The Layer 2 expansion panels work naturally on mobile (already vertical/accordion)
- Cards stack to single column below 640px
- Pullquotes maintain their left border treatment on all screen sizes

---

## 9. WHAT THIS IS NOT

- **Not a medieval recreation.** The aesthetic draws from Byzantine tradition but the execution is contemporary. Clean layouts, generous whitespace, modern interaction patterns.
- **Not a dark theme for the sake of being dark.** The darkness serves the metaphor of entering a church. If a section would be more usable with a lighter treatment, consider it.
- **Not maximalist.** The temptation with gold and dark backgrounds is to overdo it. Restraint is essential. The gold should feel precious because it's used with intention, not splashed everywhere.
- **Not exclusionary.** Every design choice should pass the test: "Would someone who has never seen a Byzantine church find this beautiful and welcoming, or confusing and alienating?"
