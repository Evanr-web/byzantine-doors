# PROJECT.md — Byzantine Gateway

> This file is the canonical project scope for any AI agent working on Byzantine Gateway.
> Read this before doing anything.

---

## Identity

**Project:** Byzantine Gateway
**Domain:** byzantinegateway.com (or chosen domain)
**Owner:** Full-time executive, father, devout Catholic. Available in margins only. Do not assume unlimited time.
**Role of AI:** Heavy lifting — code, content drafting, document creation, design implementation. The owner provides vision, theological direction, editorial review, and final approval.
**Tone:** Reverent but warm. Dignified but inviting. Never twee, never corporate, never generic "church website." Think: a well-read friend who loves the Byzantine rite and wants you to experience it.

---

## Current State

- **Prayer PWA (v0.8):** Exists. Great Compline implemented. Vanilla JS, single `index.html`, offline-capable. Needs liturgical calendar integration and additional services (Vespers, Matins, Hours).
- **Everything else:** Not yet built.

---

## Phased Build Plan

Each phase must ship something usable. No phase should require more than 4–6 weeks of part-time effort.

### Phase 1: Consolidate What Exists (Weeks 1–3)
**Goal:** Landing page + unified brand + initial printable PDFs.

Deliverables:
- Static landing page (Astro, Hugo, or plain HTML)
  - Hero: "The Digital Home for Byzantine Catholics"
  - Three sections: Pray / Learn / Print
  - Pray links to existing Prayer PWA
  - Learn links to Christ Our Pascha, Royal Doors, MCI
  - Print section with 3–5 initial downloadable PDFs
  - About page, email signup
- Move Prayer PWA under the new domain
- Create initial printable PDFs (AI-generated, owner-reviewed):
  - Icon coloring pages (2–3 major feasts)
  - Home prayer corner setup guide (1 page)
  - Fasting guide for the Byzantine rite (1 page)
  - "Your First Divine Liturgy" visitor guide (1 page)
  - Troparion cards for major feasts (printable, cuttable)

### Phase 2: Liturgical Calendar API (Weeks 4–8)
**Goal:** Build the engine that powers everything else.

Deliverables:
- Data model: feasts, fasts, tones, propers, saints, readings
- Populate one full liturgical year from official sources
- REST API (JSON) on Cloudflare Workers or Vercel Edge
- Embed calendar widget on resource website
- Feed calendar data into Prayer PWA
- Publish API docs

Endpoints:
```
GET /api/v1/today
GET /api/v1/date/{YYYY-MM-DD}
GET /api/v1/week/{YYYY-MM-DD}
GET /api/v1/month/{YYYY-MM}
GET /api/v1/fasting/today
GET /api/v1/readings/today
GET /api/v1/saints/today
GET /api/v1/tone/today
```

Technical: JSON data files in Git initially. Database only if needed later. Gregorian calendar primary.

### Phase 3: Parish Bulletin Generator (Weeks 9–12)
**Goal:** Beautiful weekly bulletin with near-zero effort for any parish.

Deliverables:
- Web-based builder (React SPA or HTML/JS)
- Parish inputs: name, address, priest, schedule, announcements
- Auto-populated from Calendar API: feasts, fasting, readings, saint of the day, tone
- Clean PDF output (print-ready, 2-page or 4-page folded)
- Save parish profile for one-click weekly generation
- 2–3 template designs (Byzantine aesthetic)
- Beta test with owner's parish, then outreach to 5–10 parishes

### Phase 4: Parish Website Template (Weeks 13–20)
**Goal:** Any parish can have a modern, convert-friendly site in an afternoon.

Deliverables:
- Template (WordPress theme or static site generator — decision pending)
- Pre-built pages: Home, Visit Us, About the Byzantine Rite, Explore the Faith, Schedule, Contact, Online Giving, Livestream, Bulletin, Prayer PWA embed
- All pre-written content auto-populated
- Setup wizard: parish name, priest info, schedule, logo, photos, calendar jurisdiction, giving integration, livestream URL
- Target: 30–60 minutes for a non-technical person
- Deploy for owner's parish as proof of concept

Key decision: WordPress (lowest barrier for parish volunteers) vs. static site (cheaper, faster) vs. hosted platform (highest adoption but most expensive). Start with WordPress. Consider hosted platform only after 20+ parishes adopt.

### Phase 5: Content Expansion (Weeks 21–30)
**Goal:** Deep resource library + catechumenate pathway.

Deliverables:
- 20+ printables (feast day kits, children's guides, Lenten tracker, Pascha checklist, sacrament prep guides)
- "Exploring the Byzantine Rite" — 8–10 structured articles (800–1200 words each, one concept, one prayer, one action step per article)
- Catholic Case for Bitcoin (standalone document grounded in CST — Rerum Novarum, Centesimus Annus, Laudato Si', Caritas in Veritate)

### Phase 6: Community & Growth (Weeks 31+)
**Goal:** Recognized digital home for English-speaking Byzantine Catholics.

- Seek formal endorsement from Edmonton Eparchy
- Present to Pittsburgh, Winnipeg, Philadelphia archeparchies
- Parish adoption campaign
- Consider podcast/audio content
- Consider expanding to serve English-speaking Orthodox

---

## Design System

### Colors
```
--byz-blue:       #1B2A4A
--byz-gold:       #C6A032
--byz-cream:      #FAF8F0
--byz-charcoal:   #2D2D2D
--byz-red:        #8B2500   /* sparingly */
--byz-teal:       #1A6B5C   /* CTA */
```

### Typography
- Headings: Playfair Display or Cormorant Garamond (serif)
- Body: Inter or Source Sans Pro (sans-serif)
- Liturgical text: distinct serif or italic treatment

### Imagery
- Iconographic imagery for decorative elements
- Parish photography for people/community
- No generic stock photos
- Icon reproductions used tastefully, not cluttered

### Layout
- Mobile-first responsive
- Max content width: 1200px
- Generous whitespace
- Service times always visible on mobile without scrolling

---

## Theological Guardrails

**These are non-negotiable.**

1. All doctrinal content must be reviewed by a priest or theologian before publication.
2. Use only official sources for liturgical texts (Basilian prayer books, Patriarchal Liturgical Commission, Christ Our Pascha).
3. Clearly label unofficial or devotional content.
4. Do not reproduce copyrighted catechetical texts — link to them.
5. Never present Byzantine Catholicism as superior to or in competition with the Latin Rite. We are one Church.
6. Never present Byzantine Catholicism as identical to Orthodoxy. We are in communion with Rome; this matters.
7. When discussing differences between Byzantine and Latin practice, frame as "different expression" not "better/worse."
8. The convert-friendly tone must not become anti-Orthodox or polemical.

---

## Key Collaborators & Models

| Entity | Relationship | Notes |
|---|---|---|
| Royal Doors | Collaborator | English propers source. May share data for API. |
| MCI (Archeparchy of Pittsburgh) | Collaborator | Chant and liturgical resources. Institutional but aligned. |
| God With Us | Potential endorser | Official USCCB Eastern Catholic catechetical body. |
| Eastern Christian Publications | Complementary | Publisher; basic app. Not competing. |
| Orthodox Web Solutions | Model to study | Their parish platform model is what we need. |
| AGES / Digital Chant Stand | Model to study | Liturgical engine gold standard. |
| Молитва Церкви developers | Potential collaborator | Liturgical data in Ukrainian. English adaptation? |
| Eparchial offices | Endorsers/distributors | Edmonton, Pittsburgh, Winnipeg, Philadelphia. |

---

## SEO Targets

These terms have virtually no quality competition:
- "Byzantine Catholic" + prayers, liturgy, fasting, calendar, convert
- "Ukrainian Catholic" + English, prayers, Divine Liturgy explained
- "Eastern Catholic" + resources, how to, new, visit
- "What is the Byzantine rite"
- "Byzantine Catholic vs Orthodox"
- "Can Catholics attend Byzantine liturgy"
- "Eastern Catholic fasting rules"

---

## Risk Register

| Risk | Mitigation |
|---|---|
| Owner bandwidth | Phases scoped small. Ship MVP before moving on. AI does 80% of production. |
| Theological error | All doctrinal content priest-reviewed. Official sources only. Label devotional content. |
| No parish adoption | Start with own parish. Prove value before scaling. |
| Scope creep into media | Stay in "tools and resources" lane. Media only Phase 6+ if demand exists. |
| Better-funded competitor | Unlikely given market. If it happens, collaborate. Goal is serving the Church. |

---

## Success Metrics

- Parishes using the bulletin generator
- Monthly active users on the Prayer PWA
- Downloads of printable resources
- Parishes adopting the website template
- Inbound seeker inquiries ("I found you online and want to visit a parish")
- Adoption/endorsement by at least one eparchy

---

## File & Folder Conventions

```
byzantine-gateway/
├── README.md              # This project overview
├── PROJECT.md             # This scope file (you're reading it)
├── site/                  # Resource website (Astro/Hugo)
├── pray/                  # Prayer PWA
├── api/                   # Calendar API
│   ├── data/              # JSON liturgical data files
│   └── workers/           # Cloudflare Workers / Vercel functions
├── bulletin/              # Bulletin generator SPA
├── parish-template/       # Parish website template
├── print/                 # Printable PDF source files
├── docs/                  # Internal documentation
│   ├── vision.md
│   ├── competitive-landscape.md
│   ├── parish-template-spec.md
│   ├── build-plan.md
│   └── site-architecture.md
└── assets/                # Shared design assets (icons, fonts, palette)
```

---

## Working With This Project

- **Before writing code:** Confirm which phase we're in and what the current deliverable is.
- **Before writing content:** Check the theological guardrails above.
- **Before adding scope:** Ask whether it belongs in the current phase or a future one. Default to future.
- **When in doubt:** Ship the simpler version. We can iterate.
- **Formatting:** All web content is English-first, mobile-first, convert-friendly.
- **AI-generated content:** Always flagged for human review before publication. Never publish directly.
