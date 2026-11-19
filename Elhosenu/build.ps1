# ==============================================================================
# ElHosenu Website Master Build Script
# Rebuilds the entire production website with all pages and assets
# ==============================================================================

Write-Host "Starting ElHosenu Website Build..." -ForegroundColor Cyan

& "$PSScriptRoot\build-home.ps1"
& "$PSScriptRoot\build-services.ps1"
& "$PSScriptRoot\build-other-pages.ps1"

Write-Host "`nElHosenu Website Build Complete! All pages, styles, scripts and sitemaps are up to date." -ForegroundColor Green
