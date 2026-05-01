# Byzantine Gateway

**The digital infrastructure for Byzantine Catholic life in North America.**

Byzantine Catholicism is the most digitally underserved major Christian tradition on the continent. The Orthodox Church has Ancient Faith Ministries, the Digital Chant Stand, and Orthodox Web Solutions. The Latin Rite has FORMED, Hallow, and Catholic Answers. Byzantine Catholics have scattered PDFs and 20-year-old link farms.

Meanwhile, converts are flooding into Eastern Christianity — and finding Orthodoxy first, because Orthodoxy built the digital on-ramp. Byzantine Catholicism offers the same liturgical beauty, the same patristic depth, the same ancient worship, plus communion with Rome. But there is no digital front door.

**Byzantine Gateway is that front door.**

---

## What We're Building

A unified digital platform with six core modules:

### 1. Prayer PWA *(in progress — v0.8)*
Daily prayer app with the Byzantine daily cycle (Vespers, Compline, Matins, Hours). Liturgical calendar-aware, offline-capable, mobile-first, single `index.html` architecture. Great Compline is implemented.

### 2. Liturgical Calendar API
Machine-readable Byzantine calendar with propers, fasts, tone cycles, saints, and readings. No good English-language Byzantine calendar API exists anywhere. This engine powers everything else.

**Endpoints:**
- `GET /api/v1/today` — today's liturgical data
- `GET /api/v1/date/{YYYY-MM-DD}` — specific date
- `GET /api/v1/week/{YYYY-MM-DD}` — current week
- `GET /api/v1/month/{YYYY-MM}` — full month
- `GET /api/v1/fasting/today` — current fasting rule
- `GET /api/v1/readings/today` — epistle and gospel
- `GET /api/v1/saints/today` — saint commemorations
- `GET /api/v1/tone/today` — tone of the week

### 3. Resource Website (The Hub)
- **Pray** — embeds the PWA, daily readings, prayer guides
- **Learn** — catechetical explainers, "New to the Byzantine Rite?" pathway, convert resources
- **Print** — downloadable PDFs: icon coloring pages, feast day activity sheets, troparion cards, fasting guides, family formation resources

### 4. Parish Bulletin Generator
Liturgical calendar integration auto-populates feast days, fasting rules, and readings. Parish admin adds announcements. Clean PDF output weekly. Replaces ugly Word doc bulletins across hundreds of parishes.

### 5. Parish Website Template
Purpose-built for Byzantine Catholic parishes. Pre-loaded convert-friendly content, liturgical calendar widget, prayer PWA embed, livestream integration, online giving. Goal: any parish has a beautiful, seeker-friendly site in an afternoon.

### 6. Catechumenate Resources *(future)*
Structured pathway for those entering Byzantine Catholicism. Nothing like this exists for Eastern Catholics.

---

## What We Are NOT Building

- A streaming/media platform (that's FORMED's model)
- A social network or forum (byzcath.org has message boards)
- A news site (eparchies handle news)
- Anything that duplicates Magisterium AI, Hallow, or Laudate
- Anything in Ukrainian (Молитва Церкви already serves that need)

---

## Domain Structure

```
byzantinegateway.com
├── /                    Landing page & hub
├── /pray                Prayer PWA
├── /calendar            Liturgical calendar (web view)
├── /api/v1/             Calendar API (JSON)
├── /learn
│   ├── /new             "New to the Byzantine Rite?" pathway
│   ├── /catechism       Links to Christ Our Pascha
│   ├── /liturgy         Divine Liturgy explainer
│   ├── /fasting         Fasting guide
│   ├── /saints          Saint of the day (from calendar API)
│   └── /explore         Convert pathway (8-10 article series)
├── /print
│   ├── /kids            Children's resources & coloring pages
│   ├── /family          Family formation printables
│   ├── /parish          Parish-use printables
│   └── /liturgical      Troparion cards, prayer cards
├── /bulletin            Parish bulletin generator
├── /parishes            Parish website template info & signup
├── /about               Mission, team, contact
└── /blog                Occasional articles (low priority)
```

---

## Tech Stack

| Component | Technology | Rationale |
|---|---|---|
| Resource website | Astro or Hugo (static) | Fast, cheap, no server |
| Prayer PWA | Vanilla JS + JSON | Already built, keep simple |
| Calendar API | Cloudflare Workers or Vercel Edge | Free tier, fast, global |
| Calendar data | JSON files in Git | Version controlled, easy to edit |
| Bulletin generator | React SPA or HTML/JS | Runs in browser, no server cost |
| PDF generation | jsPDF or server-side Puppeteer | Depends on template complexity |
| Parish template | WordPress theme OR Astro template | Decision pending |
| Hosting | Cloudflare Pages or Netlify | Free for static sites |
| Email | Buttondown or Mailchimp free tier | Newsletter signup |

---

## Design System

### Color Palette
- **Primary:** Deep Byzantine Blue `#1B2A4A`
- **Accent:** Liturgical Gold `#C6A032`
- **Background:** Warm Cream `#FAF8F0`
- **Text:** Dark Charcoal `#2D2D2D`
- **Secondary:** Iconographic Red `#8B2500` (used sparingly)
- **CTA:** Deep Teal `#1A6B5C`

### Typography
- **Headings:** Serif (Playfair Display or Cormorant Garamond)
- **Body:** Clean sans-serif (Inter or Source Sans Pro)
- **Liturgical text/quotes:** Distinct serif or italic treatment

### Design Principles
1. **English-first** — serving diaspora and converts
2. **Convert-friendly** — every page assumes a first encounter
3. **Liturgically intelligent** — calendar-aware, typikon-driven, theologically accurate
4. **Beautiful but simple** — Byzantine aesthetic without complexity
5. **Practical over theoretical** — daily-use tools, not read-once articles
6. **Open and shareable** — free resources, open APIs, embeddable widgets
7. **AI-leveraged** — AI for generation, human review for theology
8. **Ship early, iterate** — launch what exists; don't let the full vision delay the first useful thing

---

## Addressable Market

| Group | Est. N. American Population | Active/Engaged |
|---|---|---|
| Ruthenian Byzantine Catholics | ~175,000 | ~50,000 |
| Ukrainian Greek Catholics (English diaspora) | ~150,000–200,000 | ~40,000–60,000 |
| Melkite, Romanian, Slovak Byzantine Catholics | ~30,000–50,000 | ~10,000–20,000 |
| **Total Byzantine Catholic** | **~350,000–425,000** | **~100,000–130,000** |
| Potential: English-speaking Orthodox | ~1.6M–2M+ | ~200,000+ |

This is not a venture market. It is an apostolate market.

---

## Content Sources

| Content | Source | Status |
|---|---|---|
| Liturgical calendar | Patriarchal Liturgical Commission (UGCC) | Official; needs digitizing |
| Propers (English) | Royal Doors (royaldoors.net) | Confirm usage rights |
| Prayer texts | Basilian prayer books / public domain | Verify per text |
| Catechism | Christ Our Pascha (catechism.royaldoors.net) | Link only; don't reproduce |
| Chant resources | MCI (mci.archpitt.org), UGCC Music | Link/embed with permission |
| Saint biographies | Public domain / AI-generated summaries | AI drafts, human review |
| Printable content | Original creation | Full ownership |

---

## Governance

- Content touching doctrine, liturgy, or catechesis: reviewed by a priest or theologian before publication
- Pursue informal episcopal blessing from the Edmonton Eparchy first
- Long-term: seek imprimatur or formal eparchial endorsement
- Liturgical texts follow official sources (Basilian prayer books, Patriarchal Liturgical Commission calendar, Christ Our Pascha)

---

## Project Constraints

The founder is a full-time executive and father. This is apostolate work built in margins. Every phase must ship something usable. AI handles heavy lifting on content generation, code, and document creation. The founder provides vision, theological direction, and editorial review.
