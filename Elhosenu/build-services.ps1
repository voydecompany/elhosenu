# ==============================================================================
# ElHosenu - Services Hub & 7 Dedicated Landing Pages Generator
# ==============================================================================

. "$PSScriptRoot\data.ps1"
. "$PSScriptRoot\components.ps1"

# Ensure directories exist
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\services" | Out-Null
foreach ($s in $Services) {
    New-Item -ItemType Directory -Force -Path "$PSScriptRoot\services\$($s.Slug)" | Out-Null
}

# ------------------------------------------------------------------------------
# 1. SERVICES HUB (services/index.html)
# ------------------------------------------------------------------------------
$HeaderServices = Get-HeaderHtml -CurrentPage "services" -Depth 1 -IsHeroPage $true
$FooterServices = Get-FooterHtml -Depth 1
$CtaServices = Get-CtaBannerHtml -Depth 1

$HubListHtml = ""
for ($i = 0; $i -lt $Services.Count; $i++) {
    $s = $Services[$i]
    $flipClass = if ($i % 2 -eq 1) { " flip" } else { "" }
    $HubListHtml += @"
      <article class="service-card$flipClass">
        <div class="service-image-col">
          <img src="../assets/img/$($s.Img)" alt="$($s.Title) - Engineering Consultancy" width="900" height="600" loading="lazy">
        </div>
        <div class="service-info-col">
          <span class="service-number">CAPABILITY $($s.Num)</span>
          <h2 class="service-title" style="font-size: 1.85rem;">$($s.Title)</h2>
          <p class="service-desc" style="font-size: 1.0625rem; margin-bottom: 20px;">$($s.Intro)</p>
          <p class="body-text" style="margin-bottom: 24px;">$($s.ShortDesc)</p>
          <div>
            <a href="$($s.Slug)/index.html" class="btn btn-outline-dark">
              View Detailed Scope &amp; Deliverables &rarr;
            </a>
          </div>
        </div>
      </article>
"@
}

$ServicesHubHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Engineering Capabilities &amp; Technical Services | ElHosenu</title>
  <meta name="description" content="Explore ElHosenu's integrated engineering capabilities: 3D solar design, rooftop engineering, ground mount design, solar permitting, civil &amp; structural analysis, site surveys and MW-scale project management.">
  <link rel="canonical" href="https://elhosenu.com/services/">

  <meta property="og:type" content="website">
  <meta property="og:title" content="Engineering Capabilities &amp; Technical Services | ElHosenu">
  <meta property="og:description" content="Integrated engineering and design solutions across civil, structural, solar and infrastructure disciplines.">
  <meta property="og:url" content="https://elhosenu.com/services/">
  <meta property="og:image" content="../assets/img/hero-services.webp">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderServices

  <main id="main-content">
    <section class="subpage-hero">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../assets/img/hero-services.webp" alt="Expansive commercial solar installation showing advanced engineering layout" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">Services</span>
          </nav>
          <span class="eyebrow eyebrow-light">ENGINEERING CAPABILITIES</span>
          <h1 class="heading-display">COMPREHENSIVE ENGINEERING CAPABILITIES.</h1>
          <p class="lead-text">
            Integrated engineering and design solutions across civil, structural, solar and infrastructure disciplines — from preliminary feasibility through to detailed construction documentation.
          </p>
        </div>
      </div>
    </section>

    <section class="sec-services" style="background-color: var(--warm-white);">
      <div class="container">
        <div class="services-list">
          $HubListHtml
        </div>
      </div>
    </section>

    $CtaServices
  </main>

  $FooterServices
</body>
</html>
"@

$ServicesHubHtml | Out-File -FilePath "$PSScriptRoot\services\index.html" -Encoding utf8
Write-Host "Services hub services/index.html generated."


# ------------------------------------------------------------------------------
# 2. INDIVIDUAL SERVICE PAGES (7 PAGES)
# ------------------------------------------------------------------------------
foreach ($s in $Services) {
    $HeaderServicePage = Get-HeaderHtml -CurrentPage "services" -Depth 2 -IsHeroPage $true
    $FooterServicePage = Get-FooterHtml -Depth 2
    $CtaServicePage = Get-CtaBannerHtml -Depth 2

    # Scope Cards
    $ScopeCardsHtml = ""
    for ($j = 0; $j -lt $s.Scope.Count; $j++) {
        $item = $s.Scope[$j]
        $num = "{0:D2}" -f ($j + 1)
        $ScopeCardsHtml += @"
          <div class="scope-card">
            <div class="scope-card-num">PHASE $num</div>
            <h3>$item</h3>
            <p>Executed to meet local electrical, civil and structural statutory building codes with strict quality assurance.</p>
          </div>
"@
    }

    # Considerations Items
    $ConsiderationsHtml = ""
    foreach ($c in $s.Considerations) {
        $ConsiderationsHtml += @"
          <li class="checklist-item">
            <span class="checklist-icon">&#10003;</span>
            <div>$c</div>
          </li>
"@
    }

    # Deliverables Items
    $DeliverablesHtml = ""
    foreach ($d in $s.Deliverables) {
        $DeliverablesHtml += @"
          <li class="checklist-item">
            <span class="checklist-icon">&rarr;</span>
            <div><strong>$d</strong></div>
          </li>
"@
    }

    # Related Services Cards
    $RelatedHtml = ""
    foreach ($relSlug in $s.Related) {
        $relService = $Services | Where-Object { $_.Slug -eq $relSlug }
        if ($relService) {
            $RelatedHtml += @"
            <div class="project-card-full">
              <div class="project-card-img">
                <img src="../../assets/img/$($relService.Img)" alt="$($relService.Title)" width="600" height="400" loading="lazy">
              </div>
              <div class="project-card-content">
                <div>
                  <span class="badge-tag">RELATED CAPABILITY $($relService.Num)</span>
                  <h3 style="font-size: 1.25rem; margin-bottom: 8px;">$($relService.Title)</h3>
                  <p class="body-text" style="font-size: 0.9375rem; margin-bottom: 20px;">$($relService.ShortDesc)</p>
                </div>
                <div>
                  <a href="../$($relService.Slug)/index.html" class="arrow-link">
                    Explore Service <span>&rarr;</span>
                  </a>
                </div>
              </div>
            </div>
"@
        }
    }

    $ServicePageHtml = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$($s.Title) | ElHosenu Engineering Consultancy</title>
  <meta name="description" content="$($s.ShortDesc) Prepared by ElHosenu consulting engineers.">
  <link rel="canonical" href="https://elhosenu.com/services/$($s.Slug)/">

  <meta property="og:type" content="article">
  <meta property="og:title" content="$($s.H1) | ElHosenu">
  <meta property="og:description" content="$($s.ShortDesc)">
  <meta property="og:url" content="https://elhosenu.com/services/$($s.Slug)/">
  <meta property="og:image" content="../../assets/img/$($s.HeroImg)">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="theme-color" content="#007D72">

  <link rel="icon" href="../../assets/logo/favicon.png" type="image/png">
  <link rel="stylesheet" href="../../assets/css/site.css">

  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Service",
    "name": "$($s.Title)",
    "serviceType": "Solar Engineering Consultancy",
    "provider": {
      "@type": "Organization",
      "name": "ElHosenu",
      "url": "https://elhosenu.com/"
    },
    "description": "$($s.ShortDesc)"
  }
  </script>
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>

  $HeaderServicePage

  <main id="main-content">
    <!-- 1. Large Photographic Hero & 2. Service-specific H1 Heading -->
    <section class="subpage-hero">
      <div class="subpage-hero-bg" aria-hidden="true">
        <img src="../../assets/img/$($s.HeroImg)" alt="$($s.H1)" width="2000" height="900" fetchpriority="high">
      </div>
      <div class="subpage-hero-overlay" aria-hidden="true"></div>

      <div class="container-wide">
        <div class="subpage-hero-content">
          <nav class="breadcrumb" aria-label="Breadcrumb">
            <a href="../../index.html">Home</a>
            <span class="breadcrumb-separator">/</span>
            <a href="../index.html">Services</a>
            <span class="breadcrumb-separator">/</span>
            <span aria-current="page">$($s.Title)</span>
          </nav>
          <span class="eyebrow eyebrow-light">SERVICE $($s.Num)</span>
          <h1 class="heading-display">$($s.H1)</h1>
          <p class="lead-text">
            $($s.ShortDesc)
          </p>
          <div class="btn-group">
            <a href="../../contact/index.html" class="btn btn-primary">Discuss This Service</a>
            <a href="#scope" class="btn btn-secondary">Review Technical Scope</a>
          </div>
        </div>
      </div>
    </section>

    <!-- 3. Professional Introduction & 4. Technical Service Explanation -->
    <section class="service-intro-sec">
      <div class="container">
        <div class="grid-intro">
          <div>
            <span class="eyebrow">ENGINEERING PROFILE</span>
            <h2 class="heading-section">PRECISION-DRIVEN METHODOLOGY.</h2>
            <p class="body-text" style="font-size: 1.125rem; font-weight: 500; color: var(--charcoal-dark); margin-bottom: 20px;">
              $($s.Intro)
            </p>
            <p class="body-text">
              $($s.TechnicalExplanation)
            </p>
          </div>
          <div class="intro-image-wrap">
            <img src="../../assets/img/$($s.Img)" alt="$($s.Title) Engineering Documentation and Analysis" width="900" height="600" loading="lazy">
          </div>
        </div>
      </div>
    </section>

    <!-- 5. Scope of Services -->
    <section class="service-scope-sec" id="scope">
      <div class="container">
        <div class="section-header">
          <span class="eyebrow">COMPREHENSIVE EXECUTION</span>
          <h2 class="heading-section">SCOPE OF ENGINEERING SERVICES.</h2>
          <p class="lead-text-dark">
            Our deliverables follow structured design protocols ensuring seamless cross-disciplinary coordination from initial draft to final validation.
          </p>
        </div>

        <div class="scope-grid">
          $ScopeCardsHtml
        </div>
      </div>
    </section>

    <!-- 6. Engineering Considerations -->
    <section class="service-considerations-sec">
      <div class="container">
        <div class="grid-intro">
          <div class="intro-image-wrap">
            <img src="../../assets/img/$($s.ProjectImg)" alt="Field engineering detail for $($s.Title)" width="900" height="600" loading="lazy">
          </div>
          <div>
            <span class="eyebrow">TECHNICAL RIGOR</span>
            <h2 class="heading-section">KEY ENGINEERING CONSIDERATIONS.</h2>
            <p class="body-text" style="margin-bottom: 24px;">
              Technical accuracy eliminates site downtime and installation revisions. Every engineering package we generate rigorously addresses physical, environmental and statutory factors:
            </p>
            <ul class="checklist" style="grid-template-columns: 1fr;">
              $ConsiderationsHtml
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- 7. Relevant Deliverables -->
    <section class="service-deliverables-sec">
      <div class="container">
        <div class="deliverables-box">
          <div class="section-header" style="margin-bottom: 28px;">
            <span class="eyebrow">ENGINEERING DOCUMENTATION</span>
            <h2 class="heading-section">STANDARD DELIVERABLES PACKAGE.</h2>
            <p class="body-text" style="max-width: 680px;">
              Clients receive coordinated, high-resolution documentation packages indexed for tender evaluation, authority permitting, and contractor site execution.
            </p>
          </div>

          <ul class="checklist">
            $DeliverablesHtml
          </ul>

          <div style="margin-top: 36px; padding-top: 24px; border-top: 1px solid var(--border-light); display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 20px;">
            <div>
              <strong>Formats Delivered:</strong> High-Resolution PDF, AutoCAD DWG/DXF, Native 3D BIM (IFC), and Excel BoQ.
            </div>
            <div>
              <a href="../../contact/index.html" class="btn btn-primary">Request Sample Deliverable Set</a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 8. Supporting Project Images or Technical Drawings -->
    <section class="service-gallery-sec">
      <div class="container">
        <div class="section-header">
          <span class="eyebrow">DESIGN STUDIES &amp; FIELD APPLICATIONS</span>
          <h2 class="heading-section">ENGINEERING IN PRACTICE.</h2>
          <p class="lead-text-dark">
            Visual references illustrating drawing layouts, structural integration and physical implementation.
          </p>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 32px;">
          <div class="intro-image-wrap">
            <img src="../../assets/img/$($s.Img)" alt="$($s.Title) Technical drawing and CAD modeling" width="800" height="500" loading="lazy">
          </div>
          <div class="intro-image-wrap">
            <img src="../../assets/img/$($s.ProjectImg)" alt="$($s.Title) Site engineering and installation execution" width="800" height="500" loading="lazy">
          </div>
        </div>
      </div>
    </section>

    <!-- 9. Related Services -->
    <section class="service-related-sec">
      <div class="container">
        <div class="section-header">
          <span class="eyebrow">INTERDISCIPLINARY COORDINATION</span>
          <h2 class="heading-section">RELATED ENGINEERING DISCIPLINES.</h2>
        </div>

        <div class="portfolio-archive-grid">
          $RelatedHtml
        </div>
      </div>
    </section>

    <!-- 10. Project Enquiry CTA -->
    $CtaServicePage
  </main>

  $FooterServicePage
</body>
</html>
"@

    $ServicePageHtml | Out-File -FilePath "$PSScriptRoot\services\$($s.Slug)\index.html" -Encoding utf8
    Write-Host "Generated services/$($s.Slug)/index.html"
}
