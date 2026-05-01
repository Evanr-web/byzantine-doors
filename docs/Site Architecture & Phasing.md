# Byzantine Doors — Site Architecture & Phasing

*This document defines the site structure, content architecture, infrastructure approach, and phased roadmap for byzantinedoors.com and its companion products.*

---

## 1. SITE STRUCTURE — WHAT LIVES WHERE

### Main site: byzantinedoors.com

The primary website containing all catechetical and educational content.

**Five pillars:**

1. **Journey** — A guided, sequential path through Eastern Christianity for seekers. Starts from curiosity, moves through discovery, into doctrine, practice, and eventually parish life. Designed to be followed in order but accessible at any point.

2. **Library** — A topic-based reference collection. Every topic is standalone (assume the reader arrived via search, not the Journey). Cross-linked to related Journey steps and other Library topics.

3. **Daily** — Fresh content every day tied to the liturgical calendar: Scripture readings, a reflection (from Royal Doors archive or AI-drafted/theologian-edited), saint/feast of the day, a Desert Father saying, and a prayer.

4. **Liturgy** — Learning the liturgy resources. Detailed guides to what happens during the Divine Liturgy, why it happens, what you'll see/hear/smell. Designed so someone could use these guides and walk into a Ukrainian Catholic parish feeling prepared.

5. **Tools** — Practical resources: "Your First Visit" guide, how to make the sign of the cross (Eastern style), how to venerate an icon, fasting guidelines, a glossary, parish finder.

### Narthex layer (pre-Journey)

Discovery content that lives outside the formal Journey structure. These are entry-point articles designed for people who aren't yet interested in "learning about Eastern Christianity" but might be drawn in through broader questions:

- Why does beauty matter?
- What did ancient Christians actually believe?
- Is there more to reality than what we can measure?
- What if prayer isn't what you think it is?

The Narthex content makes no assumptions about the reader's beliefs. It draws on the Eastern tradition without labeling it as such until the reader is ready.

### Companion apps/subdomains

| Product | Domain | Description | Phase |
|---------|--------|-------------|-------|
| Prayer PWA | pray.byzantinedoors.com | Offline-capable progressive web app for daily prayers, Horologion hours, akathists. Pulls from the liturgical calendar. | Phase 2 |
| Calendar API | calendar.byzantinedoors.com | Liturgical calendar service. Internal use in Phase 1 (powering Daily content). Public API in Phase 2. UGCC calendar with verification layer over orthocal.info data. | Phase 1 (internal) / Phase 2 (public) |

### Separate platforms (same vision, different products)

| Product | Description | Phase |
|---------|-------------|-------|
| Parish Website Platform | A website-building platform for Eastern Catholic parishes. Consumes Byzantine Doors services (calendar, content) but is its own product with its own admin interface. Includes bulletin generator. | Phase 4 |
| Cantor Training | Music/chant resources and cantor training programs. May be a subdomain (cantors.byzantinedoors.com) or a separate site. | Phase 4 |

---

## 2. CONTENT DEPTH MODEL — THREE LAYERS

Every piece of substantive content (Journey steps, Library articles) uses a three-layer depth system:

### Layer 1 — Overview (~500 words)

- Plain language, no jargon without explanation
- Answers: "What is this and why does it matter?"
- References COP paragraphs as subtle metadata
- Uses questions, stories, and concrete images
- This is what most visitors will read

### Layer 2 — Going Deeper (expandable sections)

- Church Fathers excerpts with accessible commentary
- Becoming Byzantine audio links (where relevant)
- East vs. West notes (how this topic differs in Latin Catholicism)
- Catholic vs. Orthodox notes (where relevant)
- Accordion/expandable format — doesn't overwhelm Layer 1 readers
- Each expansion is self-contained

### Layer 3 — Source Texts (links and references)

- Links to full patristic texts (New Advent, CCEL)
- Relevant Council canons (NPNF2 Vol. 14)
- Full COP sections
- Reading guides for going further
- Academic resources for the deeply interested

---

## 3. THE JOURNEY — SEQUENCE

The Journey is the backbone of the catechetical content. It's organized into steps that follow a seeker's natural path of curiosity:

### Discovery (Narthex / Pre-Journey)
- Why does beauty matter?
- What did ancient Christians actually believe?
- Is there more to reality than materialism?
- Ancient cosmology vs. modern worldview

### Part 1: What is this place? (Steps 1–4)
1. What Happens Behind Those Doors? (The Divine Liturgy as first encounter)
2. Icons — Windows into Heaven (Visual theology, why the walls are covered in paintings)
3. The Holy Trinity — Three Persons, One God, and Why It Matters
4. Jesus Christ — God Becomes Human (The Incarnation)

### Part 2: What do they believe? (Steps 5–9)
5. Creation and the Fall — What Went Wrong (Ancestral sin, not inherited guilt)
6. Salvation as Healing — Theosis and the Journey to God
7. The Holy Spirit — The Lord and Giver of Life
8. The Church — One Body, Many Members
9. The Mysteries (Sacraments) — Where Heaven Meets Earth

### Part 3: How do they live? (Steps 10–13)
10. Prayer — Learning to Breathe (The Eastern approach to prayer life)
11. The Liturgical Year — Living in Sacred Time
12. Fasting and Feasting — The Rhythm of the Body
13. The Saints — A Cloud of Witnesses

### Part 4: Where do I fit? (Steps 14–16)
14. Byzantine Catholic and Eastern Orthodox — The Same Tradition, a Painful Division
15. Eastern and Western Catholicism — Two Lungs, One Body
16. Coming Home — What It Looks Like to Join

---

## 4. INFRASTRUCTURE APPROACH

### Recommended stack

| Layer | Recommendation | Rationale |
|-------|---------------|-----------|
| Frontend | **Astro** | Evan has experience with Astro. Static site generation = fast, SEO-friendly, cheap to host. Islands architecture allows interactive components where needed (search, Layer 2 toggles) without shipping JS everywhere. |
| CMS | **Sanity** | Evan has experience with Sanity. Structured content with custom schemas maps perfectly to the three-layer content model. Real-time collaboration. GROQ queries are powerful for cross-referencing content. Generous free tier. |
| Hosting | Vercel or Netlify | Pairs naturally with Astro. CDN-delivered, automatic builds on CMS publish. |
| Calendar API | Custom service (Node.js or similar) | Lightweight service that wraps orthocal.info data with UGCC calendar verification. Internal in Phase 1, public API in Phase 2. |
| Search | Pagefind (built into Astro) or Algolia | Pagefind is free, static, and works offline. Algolia for more advanced search if needed later. |
| Auth | None in Phase 1 | No user accounts needed initially. Add auth (Clerk, Auth.js) in Phase 2 if needed for saved progress, personalization, or parish platform. |

### Sanity content schemas (Phase 1)

Key content types to define:

- **JourneyStep** — title, step number, part (1–4), layers (1–3 as structured content), COP references, related topics, patristic sources
- **LibraryArticle** — title, category, layers (1–3), COP references, related Journey steps, related topics
- **NarthexArticle** — title, hook question, body content, related Journey entry points
- **DailyContent** — date, liturgical season, feast/saint, Scripture readings, reflection, Desert Father saying, prayer
- **LiturgicalDay** — date, tone, fast type, feast level, saint commemorations, readings (structured for calendar API)
- **PracticalTool** — title, category, step-by-step content, "what to expect" sensory details
- **PatristicSource** — author, work, section, translation, public domain status, full text or link
- **Glossary** — term, plain language definition, first occurrence article

### Shared infrastructure layer

These services are consumed by the main site and (eventually) companion apps:

1. **Liturgical Calendar** — The single source of truth for "what day is it in the church year"
2. **Content CMS** — All structured content lives in Sanity
3. **Source Text Database** — Patristic texts, Council canons, COP references (stored in CMS or a separate collection)
4. **Design System** — Shared component library and CSS tokens (can be an Astro component library or a Tailwind config)

---

## 5. PHASED ROADMAP

### Phase 1: Foundation
**Goal:** Launch the catechetical core — the Journey, Library, and Daily content.

**Deliverables:**
- byzantinedoors.com live with Journey (16 steps, Layer 1 content minimum), Library (core topics), Daily content engine
- Narthex discovery articles (4–6)
- Practical tools: First Visit guide, Glossary
- Liturgical calendar (internal service powering Daily content)
- AI Writing Frame in active use, theologian review loop established
- Mobile-responsive, accessible, fast

**Content priority for Phase 1:**
- Journey Steps 1–4 fully built out (all three layers)
- Journey Steps 5–16 at Layer 1 minimum
- Library: 10–15 core topic articles
- Narthex: 4–6 discovery articles
- Daily content engine: templated, pulling from calendar + curated sources

### Phase 2: Deepen
**Goal:** Add depth, interactivity, and companion tools.

**Deliverables:**
- All Journey steps fully built out (all three layers)
- Library expanded to 30+ topics
- Learning the Liturgy section (Pillar 4)
- Prayer PWA at pray.byzantinedoors.com
- Liturgical Calendar public API
- Curated homily resources for priests
- East vs. West and Catholic vs. Orthodox content fully developed

### Phase 3: Expand
**Goal:** Serve the parish community, not just individual seekers.

**Deliverables:**
- Domestic church toolkit (liturgical life in the home for families)
- English music and chant resources
- Liturgical community groups (forums or structured discussion)
- Parish finder with integration to parish platform (if ready)
- User accounts for saved progress and personalization

### Phase 4: Specialize
**Goal:** Launch separate products that consume Byzantine Doors services.

**Deliverables:**
- Parish Website Platform (separate product, own admin interface)
- Bulletin generator (part of parish platform)
- Cantor training programs
- Church Slavonic learning resources

---

## 6. PERMISSIONS AND LICENSING

### Content we have permission to use

| Source | Permission | Scope |
|--------|-----------|-------|
| Royal Doors | Approved | Daily reflections, catechetical resources, articles |
| Becoming Byzantine podcast (Fr. Joseph Matlak) | Full permission | All content — 10 webinars + 36 lessons based on Christ Our Pascha |
| NPNF/ANF translations (pre-1900) | Public domain | Full texts of Church Fathers, Ecumenical Councils |
| NPNF2 Vol. 14 (Ecumenical Councils) | Public domain | All seven councils, creeds, definitions, 102 Quinisext canons |
| The Met Open Access | CC0 | Byzantine art collection, high-resolution images |
| Wikimedia Commons Byzantine icons | Various (check per image) | Century-categorized icon collections |
| orthocal.info | Free API | Daily calendar/readings data (Orthodox calendar — needs UGCC verification) |

### Content requiring caution

| Source | Issue |
|--------|-------|
| Wortley's Desert Fathers (Anonymous Sayings) | © 2013 Cambridge UP — NOT public domain |
| The Rudder (Pedalion) English PDF | Copyright unclear — use NPNF2 Vol. 14 instead |
| Philokalia | Under copyright |
| Maximus the Confessor | Lacks comprehensive free English translations |
| John Climacus (The Ladder) | Lacks comprehensive free English translations |

---

## 7. CONTENT CREATION WORKFLOW

1. **Select topic** from Journey sequence or Library plan
2. **Check Resource Database** for available source material
3. **Draft Layer 1** using AI Writing Frame, with COP paragraph references
4. **Draft Layers 2–3** with patristic sources, cross-references
5. **Internal review** — check tone against Writing Frame tests ("Could a thoughtful atheist read this without feeling preached at?")
6. **Theologian review** — verify COP alignment, patristic accuracy, sensitive topic handling
7. **Publish** — enter into Sanity CMS, connect cross-references
8. **Track sources** — all COP paragraph numbers, patristic citations, and source metadata stored in CMS for Layer 3 links
