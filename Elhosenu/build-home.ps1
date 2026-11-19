# ==============================================================================
# ElHosenu - Homepage Generator with Liquid Glass & 3D Depth
# ==============================================================================

. "$PSScriptRoot\data.ps1"
. "$PSScriptRoot\components.ps1"

$Header = Get-HeaderHtml -CurrentPage "home" -Depth 0 -IsHeroPage $true
$Footer = Get-FooterHtml -Depth 0
$CtaBanner = Get-CtaBannerHtml -Depth 0

# Build Services Section items
$ServicesHtml = ""
for ($i = 0; $i -lt $Services.Count; $i++) {
    $s = $Services[$i]
    $flipClass = if ($i % 2 -eq 1) { " flip" } else { "" }
    $ServicesHtml += @"
        <article class="service-card$flipClass card-3d">
          <div class="service-image-col">
            <img src="assets/img/$($s.Img)" alt="$($s.Title) - Photorealistic Engineering Demonstration" width="900" height="600" loading="lazy">
          </div>
          <div class="service-info-col">
            <span class="service-number">SERVICE $($s.Num)</span>
            <h3 class="service-title">$($s.Title)</h3>
            <p class="service-desc">$($s.ShortDesc)</p>
            <div>
              <a href="services/$($s.Slug)/index.html" class="arrow-link">
                Explore Technical Scope <span>&rarr;</span>
              </a>
            </div>
          </div>
        </article>
"@
}

# Build Projects Showcase items
$ProjectsHtml = ""
$spans = @("project-span-7", "project-span-5", "project-span-4", "project-span-4", "project-span-4", "project-span-12")
for ($i = 0; $i -lt 5; $i++) {
    $p = $Projects[$i]
    $span = $spans[$i]
    $ProjectsHtml += @"
        <article class="project-item $span card-3d">
          <div class="project-thumb">
            <img src="assets/img/$($p.Img)" alt="$($p.Title) - Real-World Engineering Demonstration" width="800" height="500" loading="lazy">
          </div>
          <div class="project-meta-wrap">
            <div>
              <span class="project-category">$($p.Category)</span>
              <h3 class="project-name">$($p.Title)</h3>
              <div class="project-details">
                <span><strong>Capacity:</strong> $($p.Capacity)</span>
                <span>&bull;</span>
                <span>$($p.Location)</span>
              </div>
            </div>
            <div>
              <a href="projects/$($p.Slug)/index.html" class="arrow-link">
                View Engineering Study <span>&rarr;</span>
              </a>
            </div>
          </div>
        </article>
"@
}

$HomeContent = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ElHosenu | Engineering Design Consultancy</title>
  <meta name="description" content="ElHosenu is an independent engineering design consultancy delivering technical excellence across civil, structural, solar and infrastructure engineering disciplines.">
  <link rel="canonical" href="https://elhosenu.com/">

  <!-- Open Graph / Meta -->
  <meta property="og:type" content="website">
  <meta property="og:title" content="ElHosenu | Engineering Design Consultancy">
  <meta property="og:description" content="Independent engineering design consultancy — civil, structural, solar engineering, site surveys and MW-scale project management.">
  <meta property="og:url" content="https://elhosenu.com/">
  <meta property="og:image" content="assets/img/hero-solar-aerial.webp">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="assets/css/site.css">

  <!-- Organization Schema -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "ElHosenu",
    "url": "https://elhosenu.com/",
    "logo": "https://elhosenu.com/assets/logo/elhosenu-logo-teal.png",
    "description": "Independent engineering design consultancy specialising in civil, structural, solar engineering, site surveys and MW-scale project management.",
    "email": "inquiry@elhosenu.com",
    "telephone": "+919840012345",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "Tower 3, Industrial Tech Park, Phase II",
      "addressCountry": "IN"
    }
  }
  </script>
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $Header

  <main id="main-content">
    <!-- SECTION 01 — FULL-SCREEN HERO WITH RELATABLE PHOTOGRAPHY & LIQUID GLASS TELEMETRY -->
    <section class="hero-section" id="hero">
      <div class="hero-background" aria-hidden="true">
        <img src="assets/img/hero-solar-aerial.webp" alt="Consulting solar engineers reviewing layout blueprints and tablet overlooking an expansive solar power plant in natural daylight" width="2400" height="1350" fetchpriority="high">
      </div>
      <div class="hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="hero-grid">
          <div class="hero-content">
            <div class="telemetry-glass-badge">
              <span class="pulse-dot"></span>
              <span>INDEPENDENT ENGINEERING DESIGN CONSULTANCY</span>
            </div>

            <h1 class="heading-display">
              PRECISION ENGINEERING.<br>BUILT TO LAST.
            </h1>

            <p class="lead-text">
              Civil, structural &amp; solar engineering — from feasibility and technical design through to construction documentation and project delivery.
            </p>

            <div class="btn-group">
              <a href="services/index.html" class="btn btn-primary">Explore Our Expertise</a>
              <a href="contact/index.html" class="btn btn-secondary">Discuss Your Project</a>
            </div>
          </div>
        </div>
      </div>

      <div class="scroll-indicator" aria-hidden="true">
        <span>Scroll to explore</span>
        <div class="scroll-indicator-line"></div>
      </div>
    </section>

    <!-- SECTION 02 — COMPANY INTRODUCTION -->
    <section class="sec-intro" id="about-intro">
      <div class="container">
        <div class="grid-intro">
          <div class="intro-image-wrap card-3d">
            <img src="assets/img/intro-engineer-drawings.webp" alt="Senior consulting solar design engineer in architectural office reviewing complex 3D solar layout across dual monitors with CAD drawings and tablet" width="1200" height="900" loading="lazy">
          </div>
          <div class="intro-text-wrap">
            <span class="eyebrow">ABOUT EL HOSENU</span>
            <h2 class="heading-section">ENGINEERING BEYOND EXPECTATIONS.</h2>
            <p class="body-text" style="font-size: 1.0625rem; margin-bottom: 20px;">
              ElHosenu is an independent engineering design consultancy delivering technical excellence across civil, structural, solar and infrastructure engineering disciplines.
            </p>
            <p class="body-text">
              We combine multi-disciplinary engineering expertise, rigorous design practices and practical project methodologies to support developments from initial planning through to construction delivery.
            </p>
            <p class="body-text" style="margin-bottom: 32px;">
              Our focus is to deliver accurate, coordinated and buildable engineering solutions that meet the technical and regulatory requirements of every project.
            </p>
            <div>
              <a href="about/index.html" class="arrow-link" style="font-size: 1rem;">
                Discover ElHosenu <span>&rarr;</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- SECTION 03 — SERVICES -->
    <section class="sec-services" id="services">
      <div class="container">
        <div class="section-header text-center">
          <span class="eyebrow">WHAT WE DO</span>
          <h2 class="heading-section">COMPREHENSIVE ENGINEERING CAPABILITIES.</h2>
          <p class="lead-text-dark" style="margin-left: auto; margin-right: auto;">
            Integrated engineering and design solutions across civil, structural, solar and infrastructure disciplines — from concept through construction delivery.
          </p>
        </div>

        <div class="services-list">
          $ServicesHtml
        </div>
      </div>
    </section>

    <!-- LIVELY INTERACTIVE COMPONENT: SOLAR FEASIBILITY & ESTIMATOR ENGINE -->
    <section class="sec-estimator" id="estimator">
      <div class="container">
        <div class="estimator-card liquid-glass">
          <div class="section-header" style="margin-bottom: 20px;">
            <span class="eyebrow">INTERACTIVE SYSTEM SCOPING</span>
            <h2 class="heading-section" style="font-size: 2.15rem;">SOLAR FEASIBILITY &amp; TECHNICAL ESTIMATOR</h2>
            <p class="lead-text-dark" style="margin-bottom: 0;">
              Simulate preliminary engineering parameters for a solar development. Adjust capacity to preview estimated module counts, structural footprints, and generational yields — then discuss the full scope with our engineers.
            </p>
          </div>

          <div class="estimator-layout">
            <div class="estimator-controls">
              <div>
                <label style="display: block; font-size: 0.875rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: var(--charcoal-dark); margin-bottom: 12px;">
                  1. Select Installation Profile
                </label>
                <div class="type-buttons-group">
                  <button type="button" class="type-btn active" data-type="rooftop">Rooftop C&amp;I</button>
                  <button type="button" class="type-btn" data-type="ground">Utility Ground</button>
                  <button type="button" class="type-btn" data-type="carport">Solar Carport</button>
                </div>
              </div>

              <div class="capacity-slider-wrap">
                <div class="slider-header">
                  <label for="calc-capacity" style="font-size: 0.875rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: var(--charcoal-dark);">
                    2. Target System Capacity
                  </label>
                  <div class="slider-val-badge" id="calc-cap-display">2.0 MWp</div>
                </div>

                <input type="range" id="calc-capacity" min="100" max="15000" step="100" value="2000" class="range-slider" aria-label="System Capacity in kWp">

                <div class="preset-chips">
                  <button type="button" class="preset-chip" data-val="500">500 kWp</button>
                  <button type="button" class="preset-chip" data-val="2000">2 MWp</button>
                  <button type="button" class="preset-chip" data-val="5000">5 MWp</button>
                  <button type="button" class="preset-chip" data-val="10000">10 MWp</button>
                  <button type="button" class="preset-chip" data-val="15000">15 MWp</button>
                </div>
              </div>
            </div>

            <!-- Calculated Metrics Box -->
            <div class="estimator-results-box card-3d">
              <div style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--teal-accent); font-weight: 700; margin-bottom: 18px;">
                ENGINEERING SCOPE TELEMETRY
              </div>

              <div class="results-grid">
                <div class="result-item">
                  <h4>PV Module Matrix</h4>
                  <div class="result-stat" id="calc-modules">3,571 Panels</div>
                </div>
                <div class="result-item">
                  <h4>Required Footprint</h4>
                  <div class="result-stat" id="calc-footprint">13,600 m&sup2;</div>
                </div>
                <div class="result-item">
                  <h4>Est. Monthly Yield</h4>
                  <div class="result-stat" id="calc-generation">224 MWh / mo</div>
                </div>
                <div class="result-item">
                  <h4>Engineering Turnaround</h4>
                  <div class="result-stat" id="calc-timeline">5&ndash;7 Days</div>
                </div>
              </div>

              <button type="button" id="calc-apply-btn" class="btn btn-primary" style="width: 100%; padding: 14px; font-size: 0.9375rem;">
                Transfer Parameters to Project Scope &rarr;
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- SECTION 04 — ENGINEERING APPROACH (With Liquid Glass Stage Cards) -->
    <section class="sec-approach" id="approach">
      <div class="container">
        <div class="grid-approach">
          <div>
            <span class="eyebrow eyebrow-light">OUR METHODOLOGY</span>
            <h2 class="heading-section" style="color: #FFFFFF;">
              FROM ENGINEERING DRAWINGS TO REAL-WORLD EXECUTION.
            </h2>
            <p style="color: rgba(255, 255, 255, 0.88); font-size: 1.0625rem; line-height: 1.6; margin-bottom: 24px;">
              Every successful engineering project begins with a well-engineered foundation.
            </p>
            <p style="color: rgba(255, 255, 255, 0.8); line-height: 1.6; margin-bottom: 32px;">
              Our approach brings together site understanding, technical design, multi-disciplinary engineering coordination and project-focused documentation to support practical development at every scale.
            </p>

            <div class="stages-list">
              <div class="stage-card-glass">
                <div class="stage-num">01</div>
                <div>
                  <h3 class="stage-name">Understand</h3>
                  <p class="stage-detail">Project requirements, regulatory guidelines and site environmental conditions.</p>
                </div>
              </div>

              <div class="stage-card-glass">
                <div class="stage-num">02</div>
                <div>
                  <h3 class="stage-name">Design</h3>
                  <p class="stage-detail">Rigorous technical layouts, electrical calculations and structural engineering solutions.</p>
                </div>
              </div>

              <div class="stage-card-glass">
                <div class="stage-num">03</div>
                <div>
                  <h3 class="stage-name">Validate</h3>
                  <p class="stage-detail">Multi-disciplinary review, clash detection and coordination of all engineering deliverables.</p>
                </div>
              </div>

              <div class="stage-card-glass">
                <div class="stage-num">04</div>
                <div>
                  <h3 class="stage-name">Deliver</h3>
                  <p class="stage-detail">Provide construction-ready documentation and support project execution through commissioning.</p>
                </div>
              </div>
            </div>
          </div>

          <div class="approach-image-wrap card-3d">
            <img src="assets/img/why-structural-detail.webp" alt="Hyperrealistic macro architectural photograph of hot-dip galvanized steel mounting torque tube clamp and driven pile foundation" width="1000" height="1200" loading="lazy">
          </div>
        </div>
      </div>
    </section>

    <!-- SECTION 05 — PROJECT SHOWCASE -->
    <section class="sec-projects" id="selected-work">
      <div class="container">
        <div class="section-header" style="max-width: 760px;">
          <span class="eyebrow">SELECTED WORK</span>
          <h2 class="heading-section">ENGINEERING THAT TAKES SHAPE.</h2>
          <p class="lead-text-dark">
            A closer look at engineering designs, technical documentation and solar infrastructure projects.
          </p>
        </div>

        <div class="projects-editorial-grid">
          $ProjectsHtml
        </div>

        <div class="portfolio-note">
          <p>
            <strong>Engineering Study Disclosure:</strong> The projects presented above illustrate representative engineering designs, technical documentation and structural methodologies developed by ElHosenu. Specific project locations and client corporate identifiers are protected by non-disclosure agreements and are confirmed only where verified permission has been granted.
          </p>
        </div>

        <div style="margin-top: 40px; text-align: center;">
          <a href="projects/index.html" class="btn btn-outline-dark">Explore All Engineering Studies &rarr;</a>
        </div>
      </div>
    </section>

    <!-- SECTION 06 — WHY EL HOSENU -->
    <section class="sec-why" id="why-elhosenu">
      <div class="container">
        <div class="grid-why">
          <div>
            <span class="eyebrow">THE CONSULTANCY ADVANTAGE</span>
            <h2 class="heading-section">BUILT ON PRECISION. DRIVEN BY ENGINEERING.</h2>
            <p class="body-text" style="font-size: 1.0625rem;">
              We operate exclusively as an independent engineering consultancy. This focus ensures our designs prioritize technical rigor, cost efficiency and constructability without equipment bias.
            </p>

            <div class="pillars-list">
              <div class="pillar-item">
                <div class="pillar-bullet"></div>
                <div class="pillar-content">
                  <strong>Engineering-Led Thinking</strong>
                  <p>Every proposal is grounded in engineering physics, electrical standards, structural load limits and thermodynamic realities.</p>
                </div>
              </div>

              <div class="pillar-item">
                <div class="pillar-bullet"></div>
                <div class="pillar-content">
                  <strong>Practical Design Solutions</strong>
                  <p>We craft designs that installation teams can actually build on-site, minimizing field queries, redesigns and material waste.</p>
                </div>
              </div>

              <div class="pillar-item">
                <div class="pillar-bullet"></div>
                <div class="pillar-content">
                  <strong>Detailed Technical Documentation</strong>
                  <p>Clear single-line diagrams, comprehensive schedules and coordinate-indexed layout drawings that expedite AHJ approvals.</p>
                </div>
              </div>

              <div class="pillar-item">
                <div class="pillar-bullet"></div>
                <div class="pillar-content">
                  <strong>Integrated Engineering Capabilities</strong>
                  <p>Seamless synergy across civil, structural, electrical and land surveying disciplines under one accountable team.</p>
                </div>
              </div>

              <div class="pillar-item">
                <div class="pillar-bullet"></div>
                <div class="pillar-content">
                  <strong>Project-Focused Coordination</strong>
                  <p>Active support during construction phase to resolve site RFI queries and ensure as-built integrity matches design intent.</p>
                </div>
              </div>
            </div>
          </div>

          <div class="why-image-wrap card-3d">
            <img src="assets/img/hero-about.webp" alt="Senior consulting solar engineers reviewing array alignment on site with layout blueprints and CAD tablet" width="1000" height="1250" loading="lazy">
          </div>
        </div>
      </div>
    </section>

    $CtaBanner
  </main>

  $Footer
</body>
</html>
"@

$HomeContent | Out-File -FilePath "$PSScriptRoot\index.html" -Encoding utf8
Write-Host "Homepage index.html regenerated with liquid glass and 3D depth."
