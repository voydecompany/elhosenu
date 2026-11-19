# ==============================================================================
# ElHosenu - About, Projects, Insights, Contact, Privacy, 404 & SEO Generator
# ==============================================================================

. "$PSScriptRoot\data.ps1"
. "$PSScriptRoot\components.ps1"

# Create directories
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\about" | Out-Null
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\projects" | Out-Null
foreach ($p in $Projects) {
    New-Item -ItemType Directory -Force -Path "$PSScriptRoot\projects\$($p.Slug)" | Out-Null
}
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\insights" | Out-Null
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\contact" | Out-Null
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\privacy-policy" | Out-Null

# ------------------------------------------------------------------------------
# 1. ABOUT PAGE (about/index.html)
# ------------------------------------------------------------------------------
$HeaderAbout = Get-HeaderHtml -CurrentPage "about" -Depth 1 -IsHeroPage $true
$FooterAbout = Get-FooterHtml -Depth 1
$CtaAbout = Get-CtaBannerHtml -Depth 1

$AboutHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>About ElHosenu | Engineering Clarity. Building Confidence.</title>
  <meta name="description" content="ElHosenu is an independent engineering design consultancy delivering technical excellence across civil, structural, solar and infrastructure engineering disciplines.">
  <link rel="canonical" href="https://elhosenu.com/about/">

  <meta property="og:type" content="website">
  <meta property="og:title" content="About ElHosenu | Engineering Design Consultancy">
  <meta property="og:description" content="Engineering clarity, technical precision and buildable design solutions across civil, structural, solar and infrastructure disciplines.">
  <meta property="og:url" content="https://elhosenu.com/about/">
  <meta property="og:image" content="../assets/img/hero-about.webp">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderAbout

  <main id="main-content">
    <!-- About Hero -->
    <section class="subpage-hero">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../assets/img/hero-about.webp" alt="Senior solar engineers reviewing engineering drawings on site" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">About</span>
          </nav>
          <span class="eyebrow eyebrow-light">ABOUT EL HOSENU</span>
          <h1 class="heading-display">ENGINEERING CLARITY. BUILDING CONFIDENCE.</h1>
          <p class="lead-text">
            Professional engineering solutions from technical drawings to real-world infrastructure.
          </p>
        </div>
      </div>
    </section>

    <!-- Company Introduction Editorial -->
    <section class="sec-intro">
      <div class="container">
        <div class="grid-intro">
          <div>
            <span class="eyebrow">OUR IDENTITY</span>
            <h2 class="heading-section">AN INDEPENDENT ENGINEERING PRACTICE.</h2>
            <p class="body-text" style="font-size: 1.0625rem; font-weight: 500; color: var(--charcoal-dark); margin-bottom: 20px;">
              ElHosenu was established on a single foundational principle: infrastructure demands genuine engineering rigour.
            </p>
            <p class="body-text">
              We are not equipment suppliers, contractors, or developers. We are dedicated consulting engineers. By focusing strictly on engineering design, structural calculations, and technical governance across civil, structural, solar and infrastructure disciplines, our clients receive objective, technically uncompromised guidance.
            </p>
            <p class="body-text" style="margin-bottom: 28px;">
              Whether engineering a complex multi-megawatt ground-mounted solar plant, resolving roof load interfaces for commercial portfolios, designing civil infrastructure or validating boundary coordinates through total station surveys — we engineer with technical precision at every scale.
            </p>
            <div>
              <a href="../services/index.html" class="btn btn-primary">Explore Our Engineering Services &rarr;</a>
            </div>
          </div>
          <div class="intro-image-wrap">
            <img src="../assets/img/intro-engineer-drawings.webp" alt="Consulting engineer reviewing CAD layouts and single-line schematics" width="900" height="600" loading="lazy">
          </div>
        </div>
      </div>
    </section>

    <!-- Vision & Mission -->
    <section style="background-color: var(--light-grey); padding: 100px 0;">
      <div class="container">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 48px;">
          <div style="background-color: var(--white); padding: 48px; border-radius: var(--radius-card); border: 1px solid var(--border-light); box-shadow: var(--shadow-subtle);">
            <span class="eyebrow">OUR VISION</span>
            <h2 class="heading-subsection" style="font-size: 1.75rem; margin-bottom: 16px;">THE BENCHMARK OF ENGINEERING EXCELLENCE.</h2>
            <p class="body-text">
              To be recognised internationally as the engineering consultancy that sets the benchmark for technical precision, buildability and structural reliability across infrastructure, energy and built environment projects.
            </p>
          </div>

          <div style="background-color: var(--white); padding: 48px; border-radius: var(--radius-card); border: 1px solid var(--border-light); box-shadow: var(--shadow-subtle);">
            <span class="eyebrow">OUR MISSION</span>
            <h2 class="heading-subsection" style="font-size: 1.75rem; margin-bottom: 16px;">RESOLUTE TECHNICAL ACCURACY.</h2>
            <p class="body-text">
              To empower asset owners, EPCs, and developers by producing coordinated, accurate, and bankable engineering packages that streamline construction, eliminate site downtime, and safeguard long-term performance.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Engineering Philosophy -->
    <section style="background-color: var(--white); padding: 110px 0;">
      <div class="container">
        <div class="section-header text-center" style="max-width: 780px; margin-left: auto; margin-right: auto;">
          <span class="eyebrow">OUR CREED</span>
          <h2 class="heading-section">CORE DESIGN PHILOSOPHY</h2>
          <p class="lead-text-dark" style="font-size: 1.35rem; font-weight: 600; color: var(--teal-primary); margin-left:auto; margin-right:auto;">
            "Less decoration. More substance. Exceptional execution."
          </p>
        </div>

        <div class="scope-grid">
          <div class="scope-card">
            <div class="scope-card-num">01</div>
            <h3>Physics Before Aesthetics</h3>
            <p>Every line in our CAD drawings corresponds to a physical reality: conductor thermal thresholds, steel yield points, wind shear limits and solar angles.</p>
          </div>

          <div class="scope-card">
            <div class="scope-card-num">02</div>
            <h3>Buildability at the Core</h3>
            <p>Our engineers have hands-on construction experience. We design systems that installation crews can assemble safely, quickly and accurately.</p>
          </div>

          <div class="scope-card">
            <div class="scope-card-num">03</div>
            <h3>Multi-Disciplinary Synergy</h3>
            <p>Electrical engineers, structural designers and land surveyors sit together. Electrical cable routes never conflict with civil storm channels.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Standards & Rigor -->
    <section style="background-color: var(--teal-deep); color: var(--white); padding: 90px 0;">
      <div class="container">
        <div class="section-header text-center" style="max-width: 720px; margin-left: auto; margin-right: auto;">
          <span class="eyebrow eyebrow-light">GOVERNANCE &amp; CODES</span>
          <h2 class="heading-section" style="color: var(--white);">DESIGNED TO INTERNATIONAL CODES</h2>
          <p style="color: rgba(255, 255, 255, 0.85); font-size: 1.0625rem;">
            Our drawing sets and structural calculations comply with leading statutory and international engineering standards.
          </p>
        </div>

        <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 24px; margin-top: 40px;">
          <div style="background-color: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.16); padding: 20px 32px; border-radius: var(--radius-btn); text-align: center;">
            <strong style="display: block; font-size: 1.25rem; color: #5EDCD0;">IEC 62548 / 62446</strong>
            <span style="font-size: 0.8125rem; color: rgba(255, 255, 255, 0.8);">Photovoltaic Array Design &amp; Commissioning</span>
          </div>

          <div style="background-color: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.16); padding: 20px 32px; border-radius: var(--radius-btn); text-align: center;">
            <strong style="display: block; font-size: 1.25rem; color: #5EDCD0;">NFPA 70 / NEC 690</strong>
            <span style="font-size: 0.8125rem; color: rgba(255, 255, 255, 0.8);">National Electrical Code Solar Requirements</span>
          </div>

          <div style="background-color: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.16); padding: 20px 32px; border-radius: var(--radius-btn); text-align: center;">
            <strong style="display: block; font-size: 1.25rem; color: #5EDCD0;">ASCE 7-16 / 7-22</strong>
            <span style="font-size: 0.8125rem; color: rgba(255, 255, 255, 0.8);">Minimum Design Loads &amp; Wind Structural Codes</span>
          </div>

          <div style="background-color: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.16); padding: 20px 32px; border-radius: var(--radius-btn); text-align: center;">
            <strong style="display: block; font-size: 1.25rem; color: #5EDCD0;">ISO 9001</strong>
            <span style="font-size: 0.8125rem; color: rgba(255, 255, 255, 0.8);">Quality Management in Engineering Documentation</span>
          </div>
        </div>
      </div>
    </section>

    $CtaAbout
  </main>

  $FooterAbout
</body>
</html>
"@

$AboutHtml | Out-File -FilePath "$PSScriptRoot\about\index.html" -Encoding utf8
Write-Host "About page about/index.html generated."


# ------------------------------------------------------------------------------
# 2. PROJECTS ARCHIVE (projects/index.html) & CASE STUDIES
# ------------------------------------------------------------------------------
$HeaderProjects = Get-HeaderHtml -CurrentPage "projects" -Depth 1 -IsHeroPage $true
$FooterProjects = Get-FooterHtml -Depth 1
$CtaProjects = Get-CtaBannerHtml -Depth 1

# Category filter mapping
# Categories: "rooftop", "ground", "3d", "civil", "survey", "pm"
function Get-CatKey([string]$cat) {
    if ($cat -like "*Rooftop*") { return "rooftop" }
    if ($cat -like "*Ground*") { return "ground" }
    if ($cat -like "*3D*") { return "3d" }
    if ($cat -like "*Civil*") { return "civil" }
    if ($cat -like "*Survey*") { return "survey" }
    if ($cat -like "*Management*" -or $cat -like "*PM*") { return "pm" }
    return "all"
}

$ProjectsCardsHtml = ""
foreach ($p in $Projects) {
    $catKey = Get-CatKey $p.Category
    $ProjectsCardsHtml += @"
      <article class="project-card-full" data-category="$catKey">
        <div class="project-card-img">
          <img src="../assets/img/$($p.Img)" alt="$($p.Title)" width="800" height="500" loading="lazy">
        </div>
        <div class="project-card-content">
          <div>
            <span class="badge-tag">$($p.Category)</span>
            <h2 style="font-size: 1.35rem; margin-bottom: 8px;">$($p.Title)</h2>
            <div style="font-size: 0.875rem; color: var(--mid-grey); margin-bottom: 14px;">
              <span><strong>Capacity:</strong> $($p.Capacity)</span> &bull; <span>$($p.Location)</span>
            </div>
            <p class="body-text" style="font-size: 0.9375rem; margin-bottom: 20px;">
              $($p.Desc)
            </p>
          </div>
          <div>
            <a href="$($p.Slug)/index.html" class="arrow-link">
              Read Detailed Engineering Study <span>&rarr;</span>
            </a>
          </div>
        </div>
      </article>
"@
}

$ProjectsArchiveHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Engineering Projects Archive &amp; Technical Studies | ElHosenu</title>
  <meta name="description" content="Explore ElHosenu's portfolio of engineering designs — rooftop solar studies, utility ground mount plants, structural calculations, civil infrastructure and cadastral surveys.">
  <link rel="canonical" href="https://elhosenu.com/projects/">

  <meta property="og:type" content="website">
  <meta property="og:title" content="Engineering Projects Archive | ElHosenu">
  <meta property="og:description" content="A closer look at engineering designs, technical documentation and solar infrastructure projects.">
  <meta property="og:url" content="https://elhosenu.com/projects/">
  <meta property="og:image" content="../assets/img/hero-projects.webp">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderProjects

  <main id="main-content">
    <section class="subpage-hero">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../assets/img/hero-projects.webp" alt="Expansive ground-mounted solar installation showcasing structural engineering" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">Projects</span>
          </nav>
          <span class="eyebrow eyebrow-light">SELECTED WORK</span>
          <h1 class="heading-display">ENGINEERING THAT TAKES SHAPE.</h1>
          <p class="lead-text">
            A closer look at engineering designs, technical documentation and solar infrastructure projects across different scales and topographies.
          </p>
        </div>
      </div>
    </section>

    <section class="sec-projects" style="background-color: var(--warm-white);">
      <div class="container">
        <!-- Category Filter Bar -->
        <div class="portfolio-filter-bar" role="tablist" aria-label="Project Category Filter">
          <button class="filter-btn active" data-filter="all" role="tab" aria-selected="true">All Disciplines</button>
          <button class="filter-btn" data-filter="rooftop" role="tab" aria-selected="false">Rooftop Solar</button>
          <button class="filter-btn" data-filter="ground" role="tab" aria-selected="false">Ground Mount</button>
          <button class="filter-btn" data-filter="3d" role="tab" aria-selected="false">3D Design</button>
          <button class="filter-btn" data-filter="civil" role="tab" aria-selected="false">Civil &amp; Structural</button>
          <button class="filter-btn" data-filter="survey" role="tab" aria-selected="false">Site Survey</button>
          <button class="filter-btn" data-filter="pm" role="tab" aria-selected="false">Project Management</button>
        </div>

        <div class="portfolio-archive-grid" id="projects-grid">
          $ProjectsCardsHtml
        </div>

        <div class="portfolio-note" style="margin-top: 56px;">
          <p>
            <strong>Engineering Study Disclosure:</strong> The case studies presented above illustrate representative engineering designs, technical documentation and structural methodologies developed by ElHosenu. Specific project locations and client corporate identifiers are protected by non-disclosure agreements and are confirmed only where verified permission has been granted.
          </p>
        </div>
      </div>
    </section>

    $CtaProjects
  </main>

  $FooterProjects
</body>
</html>
"@

$ProjectsArchiveHtml | Out-File -FilePath "$PSScriptRoot\projects\index.html" -Encoding utf8
Write-Host "Projects archive projects/index.html generated."

# Generate 6 Project Case Study Detail Pages
foreach ($p in $Projects) {
    $HeaderProjectDetail = Get-HeaderHtml -CurrentPage "projects" -Depth 2 -IsHeroPage $true
    $FooterProjectDetail = Get-FooterHtml -Depth 2
    $CtaProjectDetail = Get-CtaBannerHtml -Depth 2

    $ProjectDetailHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$($p.Title) | Engineering Study | ElHosenu</title>
  <meta name="description" content="$($p.Desc) Technical engineering case study by ElHosenu — independent engineering design consultancy.">
  <link rel="canonical" href="https://elhosenu.com/projects/$($p.Slug)/">

  <meta property="og:type" content="article">
  <meta property="og:title" content="$($p.Title) | ElHosenu Engineering Case Study">
  <meta property="og:description" content="$($p.Desc)">
  <meta property="og:url" content="https://elhosenu.com/projects/$($p.Slug)/">
  <meta property="og:image" content="../../assets/img/$($p.Img)">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderProjectDetail

  <main id="main-content">
    <section class="subpage-hero">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../../assets/img/$($p.Img)" alt="$($p.Title)" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <a href="../index.html">Projects</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">$($p.Title)</span>
          </nav>
          <span class="eyebrow eyebrow-light">$($p.Category) STUDY</span>
          <h1 class="heading-display">$($p.Title)</h1>
          <p class="lead-text">
            $($p.Desc)
          </p>
          <div class="btn-group">
            <a href="../../contact/index.html" class="btn btn-primary">Discuss a Similar Project</a>
            <a href="../index.html" class="btn btn-secondary">&larr; Back to Projects</a>
          </div>
        </div>
      </div>
    </section>

    <section class="sec-intro" style="background-color: var(--white);">
      <div class="container">
        <div class="grid-intro">
          <div>
            <span class="eyebrow">PROJECT SNAPSHOT</span>
            <h2 class="heading-section">ENGINEERING OVERVIEW.</h2>
            <div style="background-color: var(--warm-white); border: 1px solid var(--border-light); border-radius: var(--radius-card); padding: 24px; margin-bottom: 24px;">
              <ul style="list-style: none; display: flex; flex-direction: column; gap: 10px; font-size: 0.9375rem;">
                <li><strong>Discipline:</strong> $($p.Category)</li>
                <li><strong>Project Capacity / Scale:</strong> $($p.Capacity)</li>
                <li><strong>Region:</strong> $($p.Location)</li>
                <li><strong>Deliverables:</strong> Full Technical Drawing Package, FEA Calculations, BoQ</li>
              </ul>
            </div>
            <p class="body-text">
              $($p.Desc)
            </p>
          </div>
          <div class="intro-image-wrap">
            <img src="../../assets/img/$($p.Img)" alt="$($p.Title) Technical Overview" width="900" height="600" loading="lazy">
          </div>
        </div>
      </div>
    </section>

    <!-- Technical Scope & Methodology -->
    <section style="background-color: var(--light-grey); padding: 100px 0;">
      <div class="container">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 48px;">
          <div style="background-color: var(--white); padding: 40px; border-radius: var(--radius-card); border: 1px solid var(--border-light); box-shadow: var(--shadow-subtle);">
            <span class="eyebrow">TECHNICAL SCOPE</span>
            <h2 class="heading-subsection">SCOPE OF ENGINEERING</h2>
            <p class="body-text" style="font-size: 1.0625rem; line-height: 1.65; margin-top: 14px;">
              $($p.Scope)
            </p>
          </div>

          <div style="background-color: var(--white); padding: 40px; border-radius: var(--radius-card); border: 1px solid var(--border-light); box-shadow: var(--shadow-subtle);">
            <span class="eyebrow">EXECUTION METHODOLOGY</span>
            <h2 class="heading-subsection">DESIGN METHODOLOGY</h2>
            <p class="body-text" style="font-size: 1.0625rem; line-height: 1.65; margin-top: 14px;">
              $($p.Methodology)
            </p>
          </div>
        </div>

        <div style="margin-top: 48px; background-color: var(--white); padding: 40px; border-radius: var(--radius-card); border: 1px solid var(--border-light); box-shadow: var(--shadow-subtle);">
          <span class="eyebrow">VERIFIED OUTCOMES</span>
          <h2 class="heading-subsection">PROJECT OUTCOMES &amp; PERFORMANCE IMPACT</h2>
          <p class="body-text" style="font-size: 1.0625rem; line-height: 1.65; margin-top: 14px;">
            $($p.Outcomes)
          </p>
        </div>
      </div>
    </section>

    $CtaProjectDetail
  </main>

  $FooterProjectDetail
</body>
</html>
"@

    $ProjectDetailHtml | Out-File -FilePath "$PSScriptRoot\projects\$($p.Slug)\index.html" -Encoding utf8
    Write-Host "Generated projects/$($p.Slug)/index.html"
}


# ------------------------------------------------------------------------------
# 3. INSIGHTS PAGE (insights/index.html)
# ------------------------------------------------------------------------------
$HeaderInsights = Get-HeaderHtml -CurrentPage "insights" -Depth 1 -IsHeroPage $true
$FooterInsights = Get-FooterHtml -Depth 1
$CtaInsights = Get-CtaBannerHtml -Depth 1

$InsightsArticles = @(
    @{
        Title = "Wind Load Engineering for Commercial Rooftop PV Systems: ASCE 7-16 vs Wind Tunnel Modeling"
        Date = "November 2026"
        ReadTime = "6 min read"
        Category = "Structural Engineering"
        Summary = "How aerodynamic drag coefficients, edge setbacks, and boundary-layer wind tunnel testing affect dead-weight ballasting and building structural safety."
    },
    @{
        Title = "Topographical Optimization for Utility-Scale PV: Minimizing Civil Earthworks"
        Date = "October 2026"
        ReadTime = "8 min read"
        Category = "Ground Mount Design"
        Summary = "Leveraging high-resolution LiDAR and terrain-following single-axis trackers to eliminate cut-and-fill volume by up to 35% on undulating sites."
    },
    @{
        Title = "Navigating Solar Permitting Packages: Best Practices for Rapid AHJ Approvals"
        Date = "September 2026"
        ReadTime = "5 min read"
        Category = "Permitting & Code"
        Summary = "Standardizing electrical single-line diagrams, rapid shutdown initiators, and placard labeling schedules to clear first-round plan check reviews."
    },
    @{
        Title = "Precision 3D Pre-Construction Modeling: Eliminating Inter-Row Shading Losses"
        Date = "August 2026"
        ReadTime = "7 min read"
        Category = "3D Visualisation"
        Summary = "Comparing diurnal ray-tracing shadow simulations against generic yield models to preserve up to 4.2% annual generation in high-density arrays."
    },
    @{
        Title = "The Structural Interface: Driven Piles vs Concrete Foundations in Variable Soil Strata"
        Date = "July 2026"
        ReadTime = "6 min read"
        Category = "Civil Engineering"
        Summary = "Geotechnical considerations for corrosive soils, frost heave zones, and rock-drilled micropiles to ensure 30-year foundation survivability."
    },
    @{
        Title = "Quality Assurance Protocols in MW-Scale Solar Project Management (IEC 62446)"
        Date = "June 2026"
        ReadTime = "9 min read"
        Category = "Project Management"
        Summary = "Essential engineering governance checkpoints: factory acceptance audits, torque-marking verification, and IV-curve field validation."
    }
)

$InsightsCardsHtml = ""
foreach ($a in $InsightsArticles) {
    $InsightsCardsHtml += @"
      <article class="insight-card">
        <div class="insight-body">
          <span class="badge-tag">$($a.Category)</span>
          <div class="insight-date">$($a.Date) &bull; $($a.ReadTime)</div>
          <h3>$($a.Title)</h3>
          <p>$($a.Summary)</p>
          <div>
            <a href="../contact/index.html" class="arrow-link">
              Request Technical Paper <span>&rarr;</span>
            </a>
          </div>
        </div>
      </article>
"@
}

$InsightsHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Technical Insights &amp; Engineering Briefings | ElHosenu</title>
  <meta name="description" content="Read ElHosenu's engineering briefings on solar structural wind load calculations, terrain grading optimization, permit packages and IEC quality compliance.">
  <link rel="canonical" href="https://elhosenu.com/insights/">

  <meta property="og:type" content="website">
  <meta property="og:title" content="Technical Insights &amp; Engineering Briefings | ElHosenu">
  <meta property="og:description" content="Technical perspectives and engineering whitepapers from ElHosenu's solar consultancy practice.">
  <meta property="og:url" content="https://elhosenu.com/insights/">
  <meta property="og:image" content="../assets/img/hero-insights.webp">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderInsights

  <main id="main-content">
    <section class="subpage-hero">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../assets/img/hero-insights.webp" alt="Engineering CAD documentation, blueprints and technical calculation sheets" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">Insights</span>
          </nav>
          <span class="eyebrow eyebrow-light">TECHNICAL BRIEFINGS</span>
          <h1 class="heading-display">TECHNICAL INSIGHTS &amp; BEST PRACTICES.</h1>
          <p class="lead-text">
            Authoritative technical perspectives on solar structural engineering, electrical code compliance, land mapping and project execution.
          </p>
        </div>
      </div>
    </section>

    <section class="sec-intro" style="background-color: var(--warm-white);">
      <div class="container">
        <div class="insights-grid">
          $InsightsCardsHtml
        </div>
      </div>
    </section>

    $CtaInsights
  </main>

  $FooterInsights
</body>
</html>
"@

$InsightsHtml | Out-File -FilePath "$PSScriptRoot\insights\index.html" -Encoding utf8
Write-Host "Insights page insights/index.html generated."


# ------------------------------------------------------------------------------
# 4. CONTACT PAGE (contact/index.html) - ALL 8 REQUIRED FIELDS & REAL FORM HANDLER
# ------------------------------------------------------------------------------
$HeaderContact = Get-HeaderHtml -CurrentPage "contact" -Depth 1 -IsHeroPage $true
$FooterContact = Get-FooterHtml -Depth 1

$ContactHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contact ElHosenu | Let's Engineer Your Next Project</title>
  <meta name="description" content="Discuss your civil, structural or solar engineering project, rooftop design, ground mount layout, structural analysis or site survey with ElHosenu consulting engineers.">
  <link rel="canonical" href="https://elhosenu.com/contact/">

  <meta property="og:type" content="website">
  <meta property="og:title" content="Contact ElHosenu | Engineering Design Consultancy">
  <meta property="og:description" content="Engage with ElHosenu's engineering team to scope your next infrastructure or solar engineering project.">
  <meta property="og:url" content="https://elhosenu.com/contact/">
  <meta property="og:image" content="../assets/img/hero-solar-aerial.webp">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderContact

  <main id="main-content">
    <section class="subpage-hero" style="min-height: 440px;">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../assets/img/hero-solar-aerial.webp" alt="Solar infrastructure facility engineering" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">Contact</span>
          </nav>
          <span class="eyebrow eyebrow-light">START A CONVERSATION</span>
          <h1 class="heading-display">LET'S ENGINEER YOUR NEXT PROJECT.</h1>
          <p class="lead-text">
            Discuss your project requirements, request a technical deliverable review, or engage our consulting engineers for your upcoming solar development.
          </p>
        </div>
      </div>
    </section>

    <section class="sec-contact">
      <div class="container">
        <div class="contact-layout">
          <!-- Left: Direct Office & Contact Info -->
          <div class="contact-info-panel">
            <div class="contact-info-card">
              <span class="eyebrow">CONSULTANCY DESK</span>
              <h2 class="heading-subsection" style="margin-bottom: 24px;">DIRECT CONTACT CHANNELS</h2>

              <div class="contact-item">
                <div class="contact-icon">&#9993;</div>
                <div class="contact-text">
                  <h4>Email Engineering Team</h4>
                  <p><a href="mailto:inquiry@elhosenu.com">inquiry@elhosenu.com</a></p>
                </div>
              </div>

              <div class="contact-item">
                <div class="contact-icon">&#9742;</div>
                <div class="contact-text">
                  <h4>Consultancy Telephone</h4>
                  <p><a href="tel:+919840012345">+91 98400 12345</a></p>
                </div>
              </div>

              <div class="contact-item">
                <div class="contact-icon">&#128392;</div>
                <div class="contact-text">
                  <h4>WhatsApp Technical Desk</h4>
                  <p><a href="https://wa.me/919840012345" target="_blank" rel="noopener noreferrer">Chat on WhatsApp &rarr;</a></p>
                </div>
              </div>

              <div class="contact-item">
                <div class="contact-icon">&#127970;</div>
                <div class="contact-text">
                  <h4>Head Engineering Office</h4>
                  <p>Tower 3, Industrial Tech Park, Phase II</p>
                </div>
              </div>

              <div class="contact-item">
                <div class="contact-icon">&#128337;</div>
                <div class="contact-text">
                  <h4>Working Hours</h4>
                  <p>Monday &ndash; Friday: 09:00 &ndash; 18:00 IST</p>
                </div>
              </div>
            </div>

            <div style="background-color: var(--teal-deep); color: var(--white); border-radius: var(--radius-card); padding: 32px;">
              <h3 style="font-size: 1.25rem; margin-bottom: 12px; color: #5EDCD0;">Technical Response SLA</h3>
              <p style="font-size: 0.9375rem; line-height: 1.6; color: rgba(255, 255, 255, 0.9);">
                Every project enquiry is reviewed by a qualified solar or structural engineer. We will review your preliminary parameters and respond within <strong>24 business hours</strong> with initial scoping observations.
              </p>
            </div>
          </div>

          <!-- Right: Professional Project Enquiry Form (All 8 Required Fields) -->
          <div class="form-card">
            <div class="form-header">
              <span class="eyebrow">PROJECT INTAKE FORM</span>
              <h2>SUBMIT YOUR PROJECT REQUIREMENTS</h2>
              <p>Please provide the technical parameters below. Our engineering team will assess the scope and provide feedback.</p>
            </div>

            <form id="project-enquiry-form" action="https://formspree.io/f/xvgowzqw" method="POST" novalidate>
              <div class="form-grid">
                <!-- 1. Name -->
                <div class="form-group">
                  <label for="field-name" class="form-label">Full Name *</label>
                  <input type="text" id="field-name" name="name" class="form-control" placeholder="e.g. David Vance" required autocomplete="name">
                  <span class="error-message" id="err-name"></span>
                </div>

                <!-- 2. Company -->
                <div class="form-group">
                  <label for="field-company" class="form-label">Company / Organization *</label>
                  <input type="text" id="field-company" name="company" class="form-control" placeholder="e.g. Apex Energy Holdings" required autocomplete="organization">
                  <span class="error-message" id="err-company"></span>
                </div>

                <!-- 3. Business Email -->
                <div class="form-group">
                  <label for="field-email" class="form-label">Business Email *</label>
                  <input type="email" id="field-email" name="email" class="form-control" placeholder="e.g. d.vance@apexenergy.com" required autocomplete="email">
                  <span class="error-message" id="err-email"></span>
                </div>

                <!-- 4. Phone Number -->
                <div class="form-group">
                  <label for="field-phone" class="form-label">Phone Number *</label>
                  <input type="tel" id="field-phone" name="phone" class="form-control" placeholder="e.g. +91 98765 43210" required autocomplete="tel">
                  <span class="error-message" id="err-phone"></span>
                </div>

                <!-- 5. Project Location -->
                <div class="form-group">
                  <label for="field-location" class="form-label">Project Location (State / Country) *</label>
                  <input type="text" id="field-location" name="location" class="form-control" placeholder="e.g. Gujarat, India / Texas, USA" required>
                  <span class="error-message" id="err-location"></span>
                </div>

                <!-- 6. Service Required -->
                <div class="form-group">
                  <label for="field-service" class="form-label">Service Required *</label>
                  <select id="field-service" name="service" class="form-control" required>
                    <option value="" disabled selected>Select an Engineering Discipline</option>
                    <option value="Solar 3D Pre &amp; Post Design">01. Solar 3D Pre &amp; Post Design</option>
                    <option value="Rooftop Detailed Engineering">02. Rooftop Detailed Engineering</option>
                    <option value="Ground Mount Design">03. Ground Mount Design</option>
                    <option value="Solar Permit Design">04. Solar Permit Design</option>
                    <option value="Civil &amp; Structural Engineering">05. Civil &amp; Structural Engineering</option>
                    <option value="Site Survey, FMB &amp; Topographical Sketch">06. Site Survey, FMB &amp; Topographical Sketch</option>
                    <option value="MW-Scale Project Management">07. MW-Scale Project Management</option>
                    <option value="Integrated Multi-Disciplinary Package">Integrated Multi-Disciplinary Package</option>
                  </select>
                  <span class="error-message" id="err-service"></span>
                </div>

                <!-- 7. Project Capacity -->
                <div class="form-group form-group-full">
                  <label for="field-capacity" class="form-label">Project Capacity / Footprint *</label>
                  <input type="text" id="field-capacity" name="capacity" class="form-control" placeholder="e.g. 500 kWp / 5 MWp / 15,000 sq.m / Survey Only" required>
                  <span class="error-message" id="err-capacity"></span>
                </div>

                <!-- 8. Project Description -->
                <div class="form-group form-group-full">
                  <label for="field-description" class="form-label">Project Description &amp; Technical Requirements *</label>
                  <textarea id="field-description" name="description" rows="5" class="form-control" placeholder="Please outline the current project stage, technical objectives, deadlines, and key structural or electrical considerations..." required></textarea>
                  <span class="error-message" id="err-description"></span>
                </div>
              </div>

              <div id="form-feedback" class="form-feedback" role="status"></div>

              <div style="margin-top: 28px;">
                <button type="submit" id="form-submit-btn" class="btn btn-primary" style="width: 100%; padding: 15px; font-size: 1rem;">
                  Submit Project Enquiry &rarr;
                </button>
              </div>

              <p style="margin-top: 16px; font-size: 0.8125rem; color: var(--mid-grey); text-align: center;">
                Information submitted is treated under strict engineering confidentiality and non-disclosure standards.
              </p>
            </form>
          </div>
        </div>
      </div>
    </section>
  </main>

  $FooterContact
</body>
</html>
"@

$ContactHtml | Out-File -FilePath "$PSScriptRoot\contact\index.html" -Encoding utf8
Write-Host "Contact page contact/index.html generated."


# ------------------------------------------------------------------------------
# 5. PRIVACY POLICY (privacy-policy/index.html)
# ------------------------------------------------------------------------------
$HeaderPrivacy = Get-HeaderHtml -CurrentPage "" -Depth 1 -IsHeroPage $false
$FooterPrivacy = Get-FooterHtml -Depth 1

$PrivacyHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Privacy Policy &amp; Terms of Engagement | ElHosenu</title>
  <meta name="description" content="Privacy policy, data protection and engineering confidentiality standards for ElHosenu consultancy practice.">
  <link rel="canonical" href="https://elhosenu.com/privacy-policy/">
  <meta name="theme-color" content="#007D72">
  <link rel="icon" href="../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderPrivacy

  <main id="main-content" style="padding-top: 100px; padding-bottom: 100px; background-color: var(--warm-white);">
    <div class="container-narrow">
      <nav class="breadcrumb" style="color: var(--mid-grey); margin-bottom: 24px;" aria-label="Breadcrumb">
        <a href="../index.html" style="color: var(--teal-primary);">Home</a>
        <span class="breadcrumb-separator">/</span>
        <span aria-current="page">Privacy Policy</span>
      </nav>

      <span class="eyebrow">LEGAL &amp; COMPLIANCE</span>
      <h1 class="heading-section">PRIVACY POLICY &amp; TERMS OF ENGAGEMENT</h1>
      <p class="body-text" style="color: var(--mid-grey); margin-bottom: 32px;">Last updated: November 2026</p>

      <div style="background-color: var(--white); padding: 48px; border-radius: var(--radius-photo); border: 1px solid var(--border-light); box-shadow: var(--shadow-subtle);">
        <h2 class="heading-subsection" style="font-size: 1.35rem;">1. Engineering Non-Disclosure &amp; Confidentiality</h2>
        <p class="body-text">
          As a specialized engineering consultancy, ElHosenu treats all CAD drawings, coordinate surveys, electrical specifications, and commercial agreements under strict non-disclosure obligations. Client proprietary site data is never shared with third parties without written authorization.
        </p>

        <h2 class="heading-subsection" style="font-size: 1.35rem; margin-top: 32px;">2. Information Collected via this Website</h2>
        <p class="body-text">
          When you submit an enquiry through our project intake form, we collect the details provided: full name, business email, organization, contact telephone, project location, capacity, and project notes. This information is utilized solely to evaluate the engineering scope and prepare technical proposals.
        </p>

        <h2 class="heading-subsection" style="font-size: 1.35rem; margin-top: 32px;">3. Intellectual Property Rights in Engineering Deliverables</h2>
        <p class="body-text">
          Engineering drawing packages, calculation sheets, FEA reports, and 3D visual models prepared by ElHosenu are copyrighted works. Upon settlement of consulting engagement agreements, clients receive irrevocable licenses to utilize deliverables for statutory approvals and construction execution.
        </p>

        <h2 class="heading-subsection" style="font-size: 1.35rem; margin-top: 32px;">4. Inquiries &amp; Data Subject Requests</h2>
        <p class="body-text">
          To request the modification or erasure of your submitted contact details, please write to our compliance officer at <a href="mailto:inquiry@elhosenu.com" style="color: var(--teal-primary); font-weight: 600;">inquiry@elhosenu.com</a>.
        </p>
      </div>
    </div>
  </main>

  $FooterPrivacy
</body>
</html>
"@

$PrivacyHtml | Out-File -FilePath "$PSScriptRoot\privacy-policy\index.html" -Encoding utf8
Write-Host "Privacy policy privacy-policy/index.html generated."


# ------------------------------------------------------------------------------
# 6. 404 PAGE (404.html)
# ------------------------------------------------------------------------------
$Header404 = Get-HeaderHtml -CurrentPage "" -Depth 0 -IsHeroPage $false
$Footer404 = Get-FooterHtml -Depth 0

$NotFoundHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Page Not Found | ElHosenu Engineering Consultancy</title>
  <meta name="description" content="The requested page could not be located.">
  <meta name="theme-color" content="#007D72">
  <link rel="icon" href="assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $Header404

  <main id="main-content" style="min-height: 70vh; display: flex; align-items: center; background-color: var(--warm-white); padding: 120px 0;">
    <div class="container text-center" style="max-width: 640px; margin-left: auto; margin-right: auto; text-align: center;">
      <span class="eyebrow">ERROR 404</span>
      <h1 class="heading-display" style="font-size: 3rem; margin-bottom: 16px;">PAGE NOT FOUND.</h1>
      <p class="lead-text-dark" style="margin-left: auto; margin-right: auto; margin-bottom: 32px;">
        The requested technical document or page does not exist or may have been relocated during our design system upgrade.
      </p>
      <div class="btn-group" style="justify-content: center;">
        <a href="index.html" class="btn btn-primary">Return to Homepage</a>
        <a href="services/index.html" class="btn btn-outline-dark">Browse Engineering Services</a>
      </div>
    </div>
  </main>

  $Footer404
</body>
</html>
"@

$NotFoundHtml | Out-File -FilePath "$PSScriptRoot\404.html" -Encoding utf8
Write-Host "404 page 404.html generated."


# ------------------------------------------------------------------------------
# 7. SITEMAP.XML & ROBOTS.TXT
# ------------------------------------------------------------------------------
$Domain = "https://elhosenu.com"
$Urls = @(
    "$Domain/",
    "$Domain/about/",
    "$Domain/services/",
    "$Domain/services/solar-3d-design/",
    "$Domain/services/rooftop-detailed-engineering/",
    "$Domain/services/ground-mount-design/",
    "$Domain/services/solar-permit-design/",
    "$Domain/services/civil-structural-engineering/",
    "$Domain/services/site-survey-fmb-topographical/",
    "$Domain/services/mw-scale-project-management/",
    "$Domain/projects/",
    "$Domain/projects/industrial-rooftop-solar/",
    "$Domain/projects/ground-mounted-solar-plant/",
    "$Domain/projects/solar-3d-visualisation/",
    "$Domain/projects/civil-structural-engineering/",
    "$Domain/projects/site-survey-topographical/",
    "$Domain/projects/mw-scale-solar-development/",
    "$Domain/insights/",
    "$Domain/contact/",
    "$Domain/privacy-policy/"
)

$SitemapXml = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
"@
foreach ($u in $Urls) {
    $SitemapXml += @"
  <url>
    <loc>$u</loc>
    <lastmod>2026-11-15</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
"@
}
$SitemapXml += "</urlset>`n"

$SitemapXml | Out-File -FilePath "$PSScriptRoot\sitemap.xml" -Encoding utf8
Write-Host "sitemap.xml generated."

$RobotsTxt = @"
User-agent: *
Allow: /

Sitemap: $Domain/sitemap.xml
"@

$RobotsTxt | Out-File -FilePath "$PSScriptRoot\robots.txt" -Encoding utf8
Write-Host "robots.txt generated."
