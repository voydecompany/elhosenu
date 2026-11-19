# ==============================================================================
# ElHosenu Master Website Builder
# Generates all HTML files, sitemap.xml, and robots.txt
# ==============================================================================

. "$PSScriptRoot\data.ps1"

function Get-HeaderHtml {
    param(
        [string]$CurrentPage,
        [int]$Depth = 0,
        [bool]$IsHeroPage = $true
    )

    $Prefix = ""
    if ($Depth -eq 1) { $Prefix = "../" }
    elseif ($Depth -eq 2) { $Prefix = "../../" }

    $headerClass = "site-header"
    if (-not $IsHeroPage) {
        $headerClass += " header-solid"
    }

    return @"
  <header class="$headerClass" id="site-header">
    <div class="container-wide">
      <div class="nav-wrapper">
        <a href="${Prefix}index.html" class="brand-link" aria-label="ElHosenu Homepage">
          <img src="${Prefix}assets/logo/elhosenu-logo-white.png" alt="ElHosenu" class="brand-logo logo-white" width="180" height="38">
          <img src="${Prefix}assets/logo/elhosenu-logo-teal.png" alt="ElHosenu" class="brand-logo logo-teal" width="180" height="38">
        </a>

        <nav id="nav-menu" class="nav-menu" aria-label="Main Navigation">
          <a href="${Prefix}index.html" class="nav-link $(if($CurrentPage -eq 'home'){'active'})">Home</a>
          <a href="${Prefix}about/index.html" class="nav-link $(if($CurrentPage -eq 'about'){'active'})">About</a>
          <a href="${Prefix}services/index.html" class="nav-link $(if($CurrentPage -eq 'services'){'active'})">Services</a>
          <a href="${Prefix}projects/index.html" class="nav-link $(if($CurrentPage -eq 'projects'){'active'})">Projects</a>
          <a href="${Prefix}insights/index.html" class="nav-link $(if($CurrentPage -eq 'insights'){'active'})">Insights</a>
          <a href="${Prefix}contact/index.html" class="nav-link $(if($CurrentPage -eq 'contact'){'active'})">Contact</a>
        </nav>

        <div class="header-cta">
          <a href="${Prefix}contact/index.html" class="btn btn-primary">Discuss Your Project</a>
        </div>

        <button class="hamburger" id="hamburger-btn" aria-label="Open navigation menu" aria-expanded="false" aria-controls="nav-menu">
          <span class="hamburger-line"></span>
          <span class="hamburger-line"></span>
        </button>
      </div>
    </div>
  </header>
"@
}

function Get-FooterHtml {
    param(
        [int]$Depth = 0
    )

    $Prefix = ""
    if ($Depth -eq 1) { $Prefix = "../" }
    elseif ($Depth -eq 2) { $Prefix = "../../" }

    return @"
  <footer class="site-footer">
    <div class="container">
      <div class="footer-top-grid">
        <div class="footer-brand">
          <a href="${Prefix}index.html" aria-label="ElHosenu Home">
            <img src="${Prefix}assets/logo/elhosenu-logo-white.png" alt="ElHosenu" class="brand-logo" width="170" height="36">
          </a>
          <p>
            ElHosenu is an independent engineering design consultancy delivering technical excellence across civil, structural, solar and infrastructure engineering disciplines — from feasibility and design through to construction documentation and project delivery.
          </p>
        </div>

        <div>
          <h3 class="footer-col-title">Navigation</h3>
          <ul class="footer-links">
            <li><a href="${Prefix}index.html">Home</a></li>
            <li><a href="${Prefix}about/index.html">About ElHosenu</a></li>
            <li><a href="${Prefix}services/index.html">Engineering Capabilities</a></li>
            <li><a href="${Prefix}projects/index.html">Selected Projects</a></li>
            <li><a href="${Prefix}insights/index.html">Technical Insights</a></li>
            <li><a href="${Prefix}contact/index.html">Contact Us</a></li>
          </ul>
        </div>

        <div>
          <h3 class="footer-col-title">Engineering Services</h3>
          <ul class="footer-links">
            <li><a href="${Prefix}services/solar-3d-design/index.html">Solar 3D Pre &amp; Post Design</a></li>
            <li><a href="${Prefix}services/rooftop-detailed-engineering/index.html">Rooftop Detailed Engineering</a></li>
            <li><a href="${Prefix}services/ground-mount-design/index.html">Ground Mount Design</a></li>
            <li><a href="${Prefix}services/solar-permit-design/index.html">Solar Permit Design</a></li>
            <li><a href="${Prefix}services/civil-structural-engineering/index.html">Civil &amp; Structural Engineering</a></li>
            <li><a href="${Prefix}services/site-survey-fmb-topographical/index.html">Site Survey &amp; Topographical</a></li>
            <li><a href="${Prefix}services/mw-scale-project-management/index.html">MW-Scale Project Management</a></li>
          </ul>
        </div>

        <div>
          <h3 class="footer-col-title">Consultancy Office</h3>
          <ul class="footer-contact-list">
            <li>
              <strong>Engineering Inquiries:</strong><br>
              <a href="mailto:inquiry@elhosenu.com">inquiry@elhosenu.com</a>
            </li>
            <li>
              <strong>Direct Phone:</strong><br>
              <a href="tel:+919840012345">+91 98400 12345</a>
            </li>
            <li>
              <strong>Design Office:</strong><br>
              Tower 3, Industrial Tech Park, Phase II
            </li>
            <li>
              <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" style="color:#5EDCD0;">LinkedIn Official Profile &rarr;</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="footer-closing">
        ENGINEERING WITH PURPOSE. DESIGNING FOR THE FUTURE.
      </div>

      <div class="footer-bottom">
        <div>&copy; <span class="current-year">2026</span> ElHosenu. All rights reserved. Professional Engineering Consultancy.</div>
        <div>
          <a href="${Prefix}privacy-policy/index.html">Privacy Policy &amp; Terms of Engagement</a>
        </div>
      </div>
    </div>
  </footer>
  <script src="${Prefix}assets/js/site.js" defer></script>
"@
}

function Get-CtaBannerHtml {
    param([int]$Depth = 0)
    $Prefix = ""
    if ($Depth -eq 1) { $Prefix = "../" }
    elseif ($Depth -eq 2) { $Prefix = "../../" }

    return @"
  <!-- SECTION 07 — FINAL CTA -->
  <section class="sec-cta-banner">
    <div class="cta-banner-bg" aria-hidden="true">
      <img src="${Prefix}assets/img/cta-solar-farm.webp" alt="Expansive ground-mounted solar power plant at sunset" width="2000" height="900" loading="lazy">
    </div>
    <div class="cta-banner-overlay" aria-hidden="true"></div>
    <div class="container">
      <div class="cta-banner-content">
        <h2 class="heading-section">HAVE AN ENGINEERING PROJECT IN MIND?</h2>
        <p class="lead-text" style="margin-left:auto;margin-right:auto;">
          Let's discuss your project requirements and explore the right engineering approach for your development.
        </p>
        <div style="margin-top: 28px;">
          <a href="${Prefix}contact/index.html" class="btn btn-primary" style="padding: 16px 36px; font-size: 1rem;">
            START A PROJECT &rarr;
          </a>
        </div>
      </div>
    </div>
  </section>
"@
}

Write-Host "Helper components loaded."
