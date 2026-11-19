# ==============================================================================
# ElHosenu Website Generator
# Generates all static pages for the engineering consultancy website
# ==============================================================================

$BaseDir = "c:\Users\DELL\Downloads\Elhosenu"

# Service definitions
$Services = @(
    @{
        Slug = "solar-3d-design"
        Num = "01"
        Title = "Solar 3D Pre & Post Design"
        H1 = "Solar 3D Design & Visualisation Services"
        ShortDesc = "Precision 3D PV modelling, shading analysis simulations and bankable pre/post-construction visual engineering."
        Img = "service-3d-visualisation.webp"
        HeroImg = "hero-3d-visualisation.webp"
        ProjectImg = "project-visualisation.webp"
        Intro = "Clear visual communication helps stakeholders understand a solar project before and after it is built. ElHosenu prepares high-fidelity 3D models and visual representations grounded strictly in engineering specifications."
        TechnicalExplanation = "Our 3D design team translates coordinate survey datasets, structural dimensions and PV layouts into millimetre-precise digital assets. Pre-design models verify azimuth, row spacing, tilt angle and inter-row shading under all solar elevation angles throughout the year. Post-design visualisations capture as-built details for asset documentation, compliance dossiers and stakeholder handovers."
        Scope = @(
            "Building massing and site terrain 3D mesh modeling",
            "Module string arrangement and balance-of-system placement",
            "Solar ray-tracing and obstruction shading analysis",
            "Inverter station, transformer and cable route visualization",
            "Comparative pre-construction vs as-built rendering packages"
        )
        Considerations = @(
            "Accurate topographical slope adjustments avoiding module collision",
            "Microclimate irradiance modeling and seasonal sun path calibration",
            "Clearance requirements around existing rooftop HVAC and parapet boundaries",
            "Integration with CAD/BIM formats (DWG, DXF, IFC) for multi-disciplinary coordination"
        )
        Deliverables = @(
            "High-resolution 3D layout orthographic views and perspective renderings",
            "Shading simulation reports and solar access loss percentages",
            "Comprehensive presentation drawing sheets (PDF/DWG)",
            "Native 3D model files and coordination exports"
        )
        Related = @("rooftop-detailed-engineering", "ground-mount-design", "solar-permit-design")
    },
    @{
        Slug = "rooftop-detailed-engineering"
        Num = "02"
        Title = "Rooftop Detailed Engineering"
        H1 = "Detailed Engineering for Rooftop Solar Systems"
        ShortDesc = "Commercial and industrial rooftop solar layouts, structural loading interfaces and construction-ready drawing sets."
        Img = "service-rooftop-engineering.webp"
        HeroImg = "hero-rooftop-engineering.webp"
        ProjectImg = "project-rooftop-solar.webp"
        Intro = "Commercial and industrial rooftop solar systems demand absolute precision. ElHosenu prepares detailed engineering packages that harmonize electrical yield with roof geometry, structural capacity and safety clearances."
        TechnicalExplanation = "We evaluate roof decking types, purlin spacings, load paths and obstruction envelopes to craft buildable designs. Our packages define string configurations, DC routing pathways, combiner box locations, inverter staging and AC grid tie-in points, preventing costly site clashes and warranty issues."
        Scope = @(
            "Roof condition evaluation and obstruction mapping",
            "Module stringing, DC cable routing and voltage drop calculations",
            "Mounting rail layout, purlin attachment and clamp detailing",
            "Single-line diagrams (SLD) and three-line AC distribution schematics",
            "Maintenance walkways, lifelines and fire access corridor planning"
        )
        Considerations = @(
            "Dead and live roof loading capacity under maximum module burden",
            "Puck-to-purlin fastener pullout and shear resistance",
            "Thermal expansion joints along continuous aluminum mounting rails",
            "IBC, NFPA 70 (NEC 690), and local fire safety setbacks"
        )
        Deliverables = @(
            "Construction-ready rooftop array layout sheets",
            "Structural mounting and penetrative/ballasted connection details",
            "Electrical single-line diagrams and string schedules",
            "Comprehensive Bill of Materials (BOM) and conduit schedules"
        )
        Related = @("civil-structural-engineering", "solar-permit-design", "solar-3d-design")
    },
    @{
        Slug = "ground-mount-design"
        Num = "03"
        Title = "Ground Mount Design"
        H1 = "Ground-Mounted Solar Plant Engineering & Design"
        ShortDesc = "Large-scale ground-mounted solar plant engineering, array layout optimization, civil grading and substation tie-in."
        Img = "service-ground-mount.webp"
        HeroImg = "hero-ground-mount.webp"
        ProjectImg = "project-ground-mount.webp"
        Intro = "Ground-mounted solar developments depend on how intelligently the design responds to topography and geotechnical conditions. ElHosenu develops optimized array layouts that minimize earthworks while maximizing generational yield."
        TechnicalExplanation = "From fixed-tilt racks to single-axis tracker corridors, our engineers align table configurations with undulating land contours. We establish table pitch, ground coverage ratios (GCR), DC trenching routes, internal haul roads, perimeter fencing, and inverter stations for seamless field construction."
        Scope = @(
            "Topographical surface analysis and slope suitability zoning",
            "Tracker vs fixed-tilt yield optimization and row spacing calculation",
            "Civil earthwork cut-and-fill optimization and grading design",
            "Underground MV/LV cable corridor mapping and trench detailing",
            "Stormwater drainage, detention pond and site access roadway design"
        )
        Considerations = @(
            "Geotechnical soil resistivity, pile pullout resistance and frost heave",
            "Inter-table backtracking algorithms to eliminate row-on-row shading",
            "Flood plain clearances and natural watershed conservation",
            "Constructability for heavy pile driving and cabling machinery"
        )
        Deliverables = @(
            "Master site layout and array boundary general arrangement drawings",
            "Pile coordinate plans and civil grading profiles",
            "Electrical MV collection trenching diagrams and SLDs",
            "Technical design basis memorandum and BoQ schedules"
        )
        Related = @("site-survey-fmb-topographical", "civil-structural-engineering", "mw-scale-project-management")
    },
    @{
        Slug = "solar-permit-design"
        Num = "04"
        Title = "Solar Permit Design"
        H1 = "Solar Permit Design & Engineering Documentation"
        ShortDesc = "Compliant permit plan sets, authority-specific drawing packages and technical submittals for rapid statutory approval."
        Img = "service-permit-design.webp"
        HeroImg = "hero-permit-design.webp"
        ProjectImg = "hero-permit-design.webp"
        Intro = "Regulatory and utility approvals require meticulous, authoritative documentation. ElHosenu creates complete solar permit packages structured to satisfy Authorities Having Jurisdiction (AHJ) and regional utilities on first submission."
        TechnicalExplanation = "Permit packages require precise coordination across building codes, fire codes, electrical standards, and structural guidelines. We produce plan sets including cover sheets, site plans, single-line diagrams, warning placard schedules, equipment specification sheets and structural interface calculations ready for review."
        Scope = @(
            "Comprehensive AHJ and utility submission package preparation",
            "Cover sheet with project codes, jurisdiction notes and vicinage map",
            "Site and roof plans depicting setbacks and equipment locations",
            "Electrical single-line diagrams and conductor derating schedules",
            "Safety signage, labeling schedules and Rapid Shutdown (RSD) details"
        )
        Considerations = @(
            "AHJ-specific electrical code revisions (e.g. NEC 2017/2020/2023)",
            "Local utility interconnection rules and export limitation guidelines",
            "Fire marshal clearance pathways and rapid shutdown initiator placements",
            "Rapid turnaround of plan check review comments and minor redlines"
        )
        Deliverables = @(
            "Full permit drawing package in standard architectural sizes (ANSI/ISO)",
            "Electrical calculations package (voltage drop, short circuit, ampacity)",
            "Equipment cut sheets and safety compliance schedules",
            "Revision logs and comment response matrices"
        )
        Related = @("rooftop-detailed-engineering", "ground-mount-design", "solar-3d-design")
    },
    @{
        Slug = "civil-structural-engineering"
        Num = "05"
        Title = "Civil & Structural Engineering"
        H1 = "Civil & Structural Engineering for Solar Infrastructure"
        ShortDesc = "Structural mounting calculations, foundation design, wind tunnel analysis and civil drainage engineering for PV assets."
        Img = "service-civil-structural.webp"
        HeroImg = "hero-civil-structural.webp"
        ProjectImg = "project-civil-structural.webp"
        Intro = "A solar power facility is first and foremost a structural asset. ElHosenu delivers civil design and structural analysis for mounting systems, foundations, substations and site works engineered to withstand extreme environmental forces."
        TechnicalExplanation = "Our licensed civil and structural engineers utilize advanced finite element analysis (FEA) and structural code calculation software (STAAD.Pro, SAP2000) to evaluate dead, live, wind, and seismic loads. We design driven steel piles, ground screws, concrete ballast blocks, and custom rooftop support frames that satisfy international building standards."
        Scope = @(
            "Finite Element Analysis (FEA) of solar racking structures",
            "Foundation design: driven posts, helical piers, cast-in-place concrete and ballasts",
            "Existing roof structural load capacity evaluation and reinforcement design",
            "Site grading, earthwork volumes and hydrological drainage planning",
            "Wind load calculation per ASCE 7-16 / 7-22, IS 875, and Eurocode 1"
        )
        Considerations = @(
            "Aerodynamic uplift, vortex shedding and torsional flutter under typhoon winds",
            "Soil corrosivity and sacrificial steel zinc galvanization thickness",
            "Differential settlement across soft or heterogeneous ground strata",
            "Structural safety factors, deflection limits and connection hardware shear"
        )
        Deliverables = @(
            "Structural layout drawings, section cuts and joint connection details",
            "Foundation reinforcement and cast-in-place rebar detailing drawings",
            "Certified structural analysis calculation reports",
            "Civil grading, drainage, and access road engineering plans"
        )
        Related = @("ground-mount-design", "rooftop-detailed-engineering", "site-survey-fmb-topographical")
    },
    @{
        Slug = "site-survey-fmb-topographical"
        Num = "06"
        Title = "Site Survey, FMB & Topographical Sketch"
        H1 = "Site Survey & Topographical Survey Services"
        ShortDesc = "High-precision boundary surveying, FMB digital sketching, elevation contour mapping and terrain modeling."
        Img = "service-site-survey.webp"
        HeroImg = "hero-site-survey.webp"
        ProjectImg = "project-survey.webp"
        Intro = "Flawless engineering begins with uncompromised field data. ElHosenu executes and processes land surveys, FMB documentation and topographical surveys to provide an accurate physical baseline for solar development."
        TechnicalExplanation = "Using high-precision total stations, GNSS RTK rovers and aerial LiDAR/drone surveys, our surveyors establish precise land boundaries, boundary stone positions, and elevation contours. We cross-verify Field Measurement Book (FMB) sketches against physical ground conditions to avoid land disputes and costly design revisions."
        Scope = @(
            "Boundary survey, cadastral reconciliation and boundary stone staking",
            "Field Measurement Book (FMB) digitization and title boundary validation",
            "Topographical contour mapping (0.25m to 1.0m contour intervals)",
            "Spot elevation networks and slope inclination thematic maps",
            "Rooftop physical survey: parapets, vents, mechanical plant and purlin coordinates"
        )
        Considerations = @(
            "Integration with national and regional coordinate reference systems (UTM/WGS84)",
            "Identification of easements, right-of-way (ROW), water bodies and high-tension lines",
            "Seasonal vegetation cover and terrain accessibility constraints",
            "Accuracy thresholds suitable for direct civil cut-and-fill computation"
        )
        Deliverables = @(
            "Digital boundary plans and FMB vector overlay sketches (DWG/DXF/PDF)",
            "Topographical contour maps and Digital Elevation Models (DEM)",
            "Site obstruction and shadow risk survey reports",
            "Survey control point benchmark documentation"
        )
        Related = @("ground-mount-design", "civil-structural-engineering", "mw-scale-project-management")
    },
    @{
        Slug = "mw-scale-project-management"
        Num = "07"
        Title = "MW-Scale Project Management"
        H1 = "MW-Scale Solar Project Management Services"
        ShortDesc = "Technical owner's engineering, multi-discipline design management, milestone tracking and commissioning support."
        Img = "service-project-management.webp"
        HeroImg = "hero-project-management.webp"
        ProjectImg = "project-mw-scale.webp"
        Intro = "Multi-megawatt solar projects involve complex timelines, multiple contractors and stringent regulatory milestones. ElHosenu delivers engineering-focused project management that safeguards quality, schedule and financial viability."
        TechnicalExplanation = "As Owner's Engineers or Technical Advisors, we orchestrate the interaction between civil, electrical, structural, geotechnical and interconnection teams. We monitor deliverable schedules, conduct design reviews, oversee vendor technical compliance, and verify quality standards from initial feasibility through plant commissioning."
        Scope = @(
            "Project technical scope definition and work breakdown structure (WBS)",
            "Multi-disciplinary engineering schedule coordination and milestone tracking",
            "Independent engineering design review and request-for-information (RFI) clearance",
            "Vendor technical compliance audit and factory acceptance test (FAT) advisory",
            "Site technical coordination during piling, structure erection and string cabling"
        )
        Considerations = @(
            "Strict critical path management to align with utility interconnection deadlines",
            "Risk mitigation regarding equipment delivery delays and supply chain bottlenecks",
            "Health, safety and environmental (HSE) engineering compliance on active sites",
            "Alignment with international quality standards (ISO 9001, IEC 62446)"
        )
        Deliverables = @(
            "Master engineering management plans and technical progress dashboards",
            "Design review memoranda, compliance reports and technical risk matrices",
            "Quality assurance audit records and site inspection logs",
            "Final engineering handover dossier and as-built document verification"
        )
        Related = @("ground-mount-design", "civil-structural-engineering", "site-survey-fmb-topographical")
    }
)

# Project Case Studies definitions
$Projects = @(
    @{
        Slug = "industrial-rooftop-solar"
        Category = "Rooftop Solar"
        Title = "Industrial Rooftop Solar Installation"
        Capacity = "2.4 MWp"
        Location = "Industrial Corridor, Western Region"
        Img = "project-rooftop-solar.webp"
        Desc = "Complete electrical layout, structural loading verification, and ballasted mounting engineering for a multi-building logistics hub."
        Scope = "Roof structural analysis, 4,360 bifacial module layout, DC collection routing, inverter staging, and grid interconnection documentation."
        Methodology = "Conducted non-destructive structural roof survey, modeled purlin stress limits in STAAD.Pro, and engineered custom clamping interfaces to preserve roof membrane warranties."
        Outcomes = "Zero roof penetrations across 18,000 m2 of standing seam roofing; approved by local utility on first submission with zero revision requests."
    },
    @{
        Slug = "ground-mounted-solar-plant"
        Category = "Ground Mount"
        Title = "Utility Ground-Mounted Solar Plant"
        Capacity = "45 MWp"
        Location = "Semi-Arid Basin, Southern Zone"
        Img = "project-ground-mount.webp"
        Desc = "Detailed terrain modeling, tracker row layout, 33kV internal collection network, and civil drainage design across 140 hectares."
        Scope = "Civil cut-and-fill grading design, single-axis tracker layout optimization, pile placement plans, and inverter transformer station civil slabs."
        Methodology = "Processed drone LiDAR terrain data to optimize tracker torque tube slope limits, reducing site mass grading earthwork by 32% compared to conventional layouts."
        Outcomes = "Engineered over 82,000 PV modules across undulating contours with full drainage protection against 50-year storm events."
    },
    @{
        Slug = "solar-3d-visualisation"
        Category = "3D Design"
        Title = "Commercial Campus 3D Visualisation & Shading Study"
        Capacity = "850 kWp"
        Location = "Corporate Technology Park"
        Img = "project-visualisation.webp"
        Desc = "Architectural-grade 3D visual study, seasonal ray-tracing shading analysis, and stakeholder presentation package."
        Scope = "High-precision 3D massing model of 4 office towers, array layout integration, and minute-by-minute diurnal shadow simulation."
        Methodology = "Built coordinate-accurate digital twin in 3D CAD, mapped existing HVAC chillers and cooling towers, and refined tilt angles to reclaim 7% lost irradiance."
        Outcomes = "Secured immediate executive board and municipal architectural board approvals through realistic visual renders and documented yield data."
    },
    @{
        Slug = "civil-structural-engineering"
        Category = "Civil & Structural"
        Title = "High-Wind Zone Mounting & Foundation Engineering"
        Capacity = "12 MWp"
        Location = "Coastal Industrial Port"
        Img = "project-civil-structural.webp"
        Desc = "Specialized structural analysis and reinforced foundation design for ground-mounted arrays in high coastal wind zones (up to 180 km/h)."
        Scope = "Structural wind loading calculation under ASCE 7-16, driven post depth calculation, corrosion protection specification, and civil perimeter dyke."
        Methodology = "Executed 3D finite element frame modeling with dynamic wind gust simulation; calibrated pile embedment depths based on geotechnical soil borehole tests."
        Outcomes = "Optimized hot-dip galvanized steel usage, achieving a 14% material weight reduction while ensuring a 30-year design life in a C4 coastal environment."
    },
    @{
        Slug = "site-survey-topographical"
        Category = "Site Survey"
        Title = "Topographical Survey & FMB Cadastral Mapping"
        Capacity = "220 Hectares"
        Location = "Greenfield Energy Corridor"
        Img = "project-survey.webp"
        Desc = "Comprehensive cadastral boundary reconciliation, FMB sketch vectorization, spot height grid, and digital contour creation."
        Scope = "GNSS RTK baseline establishment, boundary stone coordinate verification, 0.5m contour mapping, and identification of surface water flows."
        Methodology = "Deployed dual-frequency RTK rovers tied to national geodetic benchmarks; digitized historical land revenue records (FMB) to resolve boundary conflicts."
        Outcomes = "Delivered certified civil-ready DWG terrain base map that eliminated site boundary overlaps and cleared statutory land records for project financing."
    },
    @{
        Slug = "mw-scale-solar-development"
        Category = "Project Management"
        Title = "MW-Scale Project Management & Owner's Engineering"
        Capacity = "75 MWp"
        Location = "Regional Renewable Energy Park"
        Img = "project-mw-scale.webp"
        Desc = "Technical coordination, engineering design governance, contractor deliverable audits, and milestone management."
        Scope = "Multi-contractor engineering interface management, technical RFI tracking, BoQ verification, and statutory inspection compliance."
        Methodology = "Established a rigorous document review protocol with 5-day SLA for technical submissions, standardizing drawing formats across 4 primary EPC contractors."
        Outcomes = "Delivered complete engineering dossier 3 weeks ahead of schedule, enabling successful grid synchronization with zero technical safety infractions."
    }
)

Write-Host "Services and Projects data loaded successfully."
