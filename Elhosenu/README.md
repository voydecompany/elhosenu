# ElHosenu — Solar Engineering & Design Consultancy Website

A responsive corporate website engineered for **ElHosenu**, an engineering design consultancy specialising in solar engineering, civil engineering, structural design, site surveys, and large-scale solar project management.

Designed and developed to international agency standards with a core philosophy:
**"Less decoration. More substance. Exceptional execution."**

---

## Brand Architecture & Visual System

- **Primary Brand Color**: `#007D72` (ElHosenu Teal) — applied strategically for buttons, active links, and brand accents.
- **Deep Teal**: `#064E47` — used for high-impact engineering approach & technical governance panels.
- **Dark Charcoal**: `#202725` — used for the cinematic hero backgrounds, footer, and high-contrast text.
- **Warm White**: `#F8F9F7` — primary editorial background canvas.
- **Light Grey**: `#EFF1EE` — secondary section background for subtle visual contrast.
- **Mid Grey**: `#777F7C` — meta labels, borders, and secondary text.
- **White**: `#FFFFFF` — clean card surfaces and project showcase backgrounds.

### Typography
- **Headings**: `Manrope` (Weights 600, 700, 800) — clean, architectural, and authoritative.
- **Body & Navigation**: `Inter` (Weights 400, 500, 600) — high legibility and refined spacing.

### Rounded Corner System
- Large photographic elements: `16px` (`--radius-photo`)
- Service containers & editorial cards: `14px` (`--radius-card`)
- Action buttons: `8px` (`--radius-btn`)
- Input fields & forms: `8px` (`--radius-form`)

---

## Site Structure & URL Hierarchy

```
/
├── index.html                                    # Full-screen Hero, Intro, 7 Services, Approach, Showcase, Why ElHosenu, CTA, Footer
├── about/index.html                              # Company Profile, Vision, Mission, Engineering Philosophy, Governance Codes
├── services/index.html                           # Comprehensive Capabilities Hub
│   ├── solar-3d-design/index.html                # Service 01: Solar 3D Pre & Post Design
│   ├── rooftop-detailed-engineering/index.html   # Service 02: Rooftop Detailed Engineering
│   ├── ground-mount-design/index.html            # Service 03: Ground Mount Design
│   ├── solar-permit-design/index.html            # Service 04: Solar Permit Design
│   ├── civil-structural-engineering/index.html   # Service 05: Civil & Structural Engineering
│   ├── site-survey-fmb-topographical/index.html  # Service 06: Site Survey, FMB & Topographical Sketch
│   └── mw-scale-project-management/index.html    # Service 07: MW-Scale Project Management
├── projects/index.html                           # Engineering Portfolio Archive with Category Filtering
│   ├── industrial-rooftop-solar/index.html       # 2.4 MWp Industrial Rooftop Case Study
│   ├── ground-mounted-solar-plant/index.html     # 45 MWp Utility Ground-Mount Case Study
│   ├── solar-3d-visualisation/index.html         # 850 kWp Campus 3D Visual Study
│   ├── civil-structural-engineering/index.html   # 12 MWp High-Wind Structural Engineering Study
│   ├── site-survey-topographical/index.html      # 220 Hectare Topographical & FMB Mapping Study
│   └── mw-scale-solar-development/index.html     # 75 MWp Owner's Engineering Case Study
├── insights/index.html                           # Technical Engineering Briefings & Whitepapers
├── contact/index.html                            # Project Intake Desk with 8-Field Form & Direct Channels
├── privacy-policy/index.html                     # Engineering NDA & Data Governance Terms
├── 404.html                                      # Branded 404 Error Page
├── sitemap.xml                                   # XML Sitemap covering all 21 URLs
├── robots.txt                                    # Search Engine Indexing Directives
└── assets/
    ├── css/site.css                              # Production CSS with Custom Properties
    ├── js/site.js                                # Scroll transitions, filter tabs, validation & submission
    ├── img/                                      # 28 Hyper-realistic webp photography assets
    └── logo/                                     # Original ElHosenu logos (white & teal variants)
```

---

## Interactive Features

1. **Refined Navigation Bar**: Starts fully transparent over the cinematic hero photograph and transitions into a warm-white background with subtle border, soft shadow, and reduced height upon scrolling.
2. **Interactive Projects Category Filter**: Real-time filtering by discipline (Rooftop, Ground Mount, 3D Design, Civil & Structural, Site Survey, Project Management) with smooth opacity transitions.
3. **8-Field Project Intake Form**:
   - Field 1: Full Name
   - Field 2: Company / Organization
   - Field 3: Business Email
   - Field 4: Phone Number
   - Field 5: Project Location
   - Field 6: Service Required (all 7 disciplines selectable)
   - Field 7: Project Capacity / Footprint
   - Field 8: Project Description & Technical Requirements
   - Validates client-side, gives field-level error messages, and generates an interactive submission confirmation modal with SLA notice.

---

## Rebuilding the Website

The website is statically generated with pure, dependency-free PowerShell scripts:

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```
