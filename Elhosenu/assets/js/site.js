/**
 * ELHOSENU — Solar Engineering & Design Consultancy
 * Interactive Client Engine v3.0: Liquid Glass, 3D Tilt & Lively Estimator
 */

(function () {
  'use strict';

  // 1. Navbar Scroll Transition (Liquid Glass)
  const header = document.getElementById('site-header');

  function updateNavbarOnScroll() {
    if (!header) return;
    if (header.classList.contains('header-solid')) return;

    if (window.scrollY > 40) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  }

  window.addEventListener('scroll', updateNavbarOnScroll, { passive: true });
  updateNavbarOnScroll();

  // 2. Mobile Hamburger Menu
  const hamburger = document.getElementById('hamburger-btn');
  const navMenu = document.getElementById('nav-menu');

  if (hamburger && navMenu) {
    hamburger.addEventListener('click', function () {
      const isExpanded = hamburger.getAttribute('aria-expanded') === 'true';
      const nextState = !isExpanded;

      hamburger.setAttribute('aria-expanded', String(nextState));
      hamburger.setAttribute('aria-label', nextState ? 'Close navigation menu' : 'Open navigation menu');
      navMenu.classList.toggle('open', nextState);
      document.body.style.overflow = nextState ? 'hidden' : '';
    });

    navMenu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        if (navMenu.classList.contains('open')) {
          hamburger.click();
        }
      });
    });

    window.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && navMenu.classList.contains('open')) {
        hamburger.click();
      }
    });

    document.addEventListener('click', function (e) {
      if (
        navMenu.classList.contains('open') &&
        !navMenu.contains(e.target) &&
        !hamburger.contains(e.target)
      ) {
        hamburger.click();
      }
    });
  }

  // 3. Subtle 3D Card Tilt on Mouse Move
  const tiltCards = document.querySelectorAll('.card-3d-wrap, .hero-glass-telemetry');
  
  if (tiltCards.length && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    tiltCards.forEach(function (card) {
      card.addEventListener('mousemove', function (e) {
        const rect = card.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        
        const rotateX = ((y - centerY) / centerY) * -4;
        const rotateY = ((x - centerX) / centerX) * 4;
        
        card.style.transform = `perspective(1000px) rotateX(${rotateX.toFixed(2)}deg) rotateY(${rotateY.toFixed(2)}deg) translateY(-4px)`;
      });

      card.addEventListener('mouseleave', function () {
        card.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) translateY(0px)';
      });
    });
  }

  // 4. Interactive Solar Feasibility & System Estimator Engine
  const capSlider = document.getElementById('calc-capacity');
  const capDisplay = document.getElementById('calc-cap-display');
  const typeBtns = document.querySelectorAll('.type-btn');
  const presetChips = document.querySelectorAll('.preset-chip');
  const outModules = document.getElementById('calc-modules');
  const outFootprint = document.getElementById('calc-footprint');
  const outGeneration = document.getElementById('calc-generation');
  const outTimeline = document.getElementById('calc-timeline');
  const applyScopeBtn = document.getElementById('calc-apply-btn');

  let currentType = 'rooftop'; // 'rooftop' | 'ground' | 'carport'

  function updateFeasibility() {
    if (!capSlider) return;
    const kw = parseFloat(capSlider.value);

    // Format display
    if (capDisplay) {
      if (kw >= 1000) {
        capDisplay.textContent = (kw / 1000).toFixed(1) + ' MWp';
      } else {
        capDisplay.textContent = Math.round(kw) + ' kWp';
      }
    }

    // Calculations (~560W Tier-1 Bifacial modules)
    const modules = Math.round((kw * 1000) / 560);
    if (outModules) {
      outModules.textContent = modules.toLocaleString() + ' Panels';
    }

    // Footprint estimation
    if (outFootprint) {
      if (currentType === 'rooftop') {
        const sqMeters = Math.round(kw * 6.8);
        outFootprint.textContent = sqMeters.toLocaleString() + ' m² (' + Math.round(sqMeters * 10.76).toLocaleString() + ' sq.ft)';
      } else if (currentType === 'ground') {
        const acres = ((kw / 1000) * 4.2).toFixed(1);
        outFootprint.textContent = acres + ' Acres (' + Math.round(kw * 9.5).toLocaleString() + ' m²)';
      } else {
        const bays = Math.round(kw / 3.2);
        outFootprint.textContent = bays.toLocaleString() + ' Parking Bays';
      }
    }

    // Monthly Generation Estimate (~4.6 Peak Sun Hours / day, 80% PR)
    if (outGeneration) {
      const monthlyMwh = Math.round((kw * 4.6 * 30 * 0.81) / 1000);
      outGeneration.textContent = monthlyMwh.toLocaleString() + ' MWh / mo';
    }

    // Turnaround SLA
    if (outTimeline) {
      if (kw < 1000) {
        outTimeline.textContent = '3–4 Business Days';
      } else if (kw < 5000) {
        outTimeline.textContent = '5–7 Business Days';
      } else {
        outTimeline.textContent = '8–12 Business Days';
      }
    }
  }

  if (capSlider) {
    capSlider.addEventListener('input', updateFeasibility);

    typeBtns.forEach(function (btn) {
      btn.addEventListener('click', function () {
        typeBtns.forEach(function (b) { b.classList.remove('active'); });
        this.classList.add('active');
        currentType = this.dataset.type;
        updateFeasibility();
      });
    });

    presetChips.forEach(function (chip) {
      chip.addEventListener('click', function () {
        capSlider.value = this.dataset.val;
        updateFeasibility();
      });
    });

    // Transfer Scope to Project Enquiry Form
    if (applyScopeBtn) {
      applyScopeBtn.addEventListener('click', function () {
        const kw = parseFloat(capSlider.value);
        const kwFormatted = kw >= 1000 ? (kw / 1000).toFixed(1) + ' MWp' : Math.round(kw) + ' kWp';
        const typeLabel = currentType === 'rooftop' ? 'Rooftop Detailed Engineering' : (currentType === 'ground' ? 'Ground Mount Design' : 'Solar 3D Pre & Post Design');
        
        // Scroll to contact form or navigate
        const contactForm = document.getElementById('project-enquiry-form');
        if (contactForm) {
          contactForm.scrollIntoView({ behavior: 'smooth' });

          const capField = document.getElementById('field-capacity');
          if (capField) capField.value = kwFormatted;

          const serviceField = document.getElementById('field-service');
          if (serviceField) {
            for (let i = 0; i < serviceField.options.length; i++) {
              if (serviceField.options[i].text.includes(typeLabel)) {
                serviceField.selectedIndex = i;
                break;
              }
            }
          }

          const descField = document.getElementById('field-description');
          if (descField) {
            descField.value = `[Estimator Scope Export]\nTarget Capacity: ${kwFormatted}\nSystem Profile: ${typeLabel}\nDeliverables Requested: Preliminary 3D Visualisation, Structural Interface Review, and Electrical Single-Line Schematics.`;
            descField.focus();
          }
        } else {
          // If on another page, route with query params
          window.location.href = `contact/index.html?cap=${encodeURIComponent(kwFormatted)}&svc=${encodeURIComponent(typeLabel)}`;
        }
      });
    }

    updateFeasibility();
  }

  // 5. Projects Category Filtering
  const filterButtons = document.querySelectorAll('.filter-btn');
  const projectItems = document.querySelectorAll('[data-category]');

  if (filterButtons.length && projectItems.length) {
    filterButtons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        const targetCategory = this.getAttribute('data-filter');

        filterButtons.forEach(function (b) { b.classList.remove('active'); });
        this.classList.add('active');

        projectItems.forEach(function (item) {
          const itemCat = item.getAttribute('data-category');
          if (targetCategory === 'all' || itemCat === targetCategory) {
            item.style.display = '';
            item.style.opacity = '0';
            setTimeout(function () {
              item.style.transition = 'opacity 0.3s ease';
              item.style.opacity = '1';
            }, 20);
          } else {
            item.style.display = 'none';
          }
        });
      });
    });
  }

  // 6. Project Enquiry Form Handling (8 Required Fields + Validation + Submission)
  const enquiryForm = document.getElementById('project-enquiry-form');

  if (enquiryForm) {
    // Check URL parameters for pre-fill
    const params = new URLSearchParams(window.location.search);
    if (params.has('cap')) {
      const capField = document.getElementById('field-capacity');
      if (capField) capField.value = params.get('cap');
    }
    if (params.has('svc')) {
      const svcVal = params.get('svc');
      const serviceField = document.getElementById('field-service');
      if (serviceField) {
        for (let i = 0; i < serviceField.options.length; i++) {
          if (serviceField.options[i].text.includes(svcVal)) {
            serviceField.selectedIndex = i;
            break;
          }
        }
      }
    }

    enquiryForm.addEventListener('submit', function (e) {
      e.preventDefault();

      const name = document.getElementById('field-name');
      const company = document.getElementById('field-company');
      const email = document.getElementById('field-email');
      const phone = document.getElementById('field-phone');
      const location = document.getElementById('field-location');
      const service = document.getElementById('field-service');
      const capacity = document.getElementById('field-capacity');
      const description = document.getElementById('field-description');
      const feedback = document.getElementById('form-feedback');
      const submitBtn = document.getElementById('form-submit-btn');

      let isValid = true;

      function checkField(input, condition, errorMsg) {
        const errorEl = document.getElementById('err-' + input.id.replace('field-', ''));
        if (!condition) {
          input.classList.add('error');
          if (errorEl) errorEl.textContent = errorMsg;
          isValid = false;
        } else {
          input.classList.remove('error');
          if (errorEl) errorEl.textContent = '';
        }
      }

      checkField(name, name.value.trim().length >= 2, 'Please enter your full name.');
      checkField(company, company.value.trim().length >= 2, 'Please specify your company or organization.');
      const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      checkField(email, emailPattern.test(email.value.trim()), 'Please enter a valid business email address.');
      checkField(phone, phone.value.trim().length >= 7, 'Please provide a contact phone number.');
      checkField(location, location.value.trim().length >= 2, 'Please state the project country / region.');
      checkField(service, service.value !== '', 'Please select an engineering service.');
      checkField(capacity, capacity.value.trim().length >= 1, 'Please indicate estimated capacity (e.g. 500 kWp, 5 MWp, or N/A).');
      checkField(description, description.value.trim().length >= 15, 'Please provide a brief summary of the engineering requirements.');

      if (!isValid) {
        if (feedback) {
          feedback.className = 'form-feedback error';
          feedback.textContent = 'Please correct the highlighted fields before submitting.';
          feedback.style.display = 'block';
        }
        return;
      }

      if (submitBtn) {
        submitBtn.disabled = true;
        submitBtn.textContent = 'Submitting Enquiry...';
      }

      setTimeout(function () {
        const summaryData = {
          name: name.value.trim(),
          company: company.value.trim(),
          email: email.value.trim(),
          phone: phone.value.trim(),
          location: location.value.trim(),
          service: service.options[service.selectedIndex].text,
          capacity: capacity.value.trim(),
          description: description.value.trim()
        };

        const endpoint = enquiryForm.getAttribute('action');
        if (endpoint && endpoint !== '#' && !endpoint.startsWith('javascript:')) {
          fetch(endpoint, {
            method: 'POST',
            headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
            body: JSON.stringify(summaryData)
          }).catch(function (err) {
            console.log('Endpoint handled with client fallback:', err);
          });
        }

        if (feedback) {
          feedback.className = 'form-feedback success';
          feedback.innerHTML = `
            <strong>Enquiry Successfully Received</strong>
            <p style="margin-top: 8px; line-height: 1.5;">Thank you, ${summaryData.name}. Your enquiry for <strong>${summaryData.service}</strong> (${summaryData.capacity}) has been logged with ElHosenu's engineering team.</p>
            <p style="margin-top: 6px; font-size: 0.875rem;">A senior consulting engineer will review your project scope and respond to <strong>${summaryData.email}</strong> within 24 business hours.</p>
          `;
          feedback.style.display = 'block';
        }

        enquiryForm.reset();
        if (submitBtn) {
          submitBtn.disabled = false;
          submitBtn.textContent = 'Enquiry Submitted';
        }
      }, 700);
    });
  }

  // 7. Dynamic Copyright Year
  const yearEls = document.querySelectorAll('.current-year');
  const currentYear = new Date().getFullYear();
  yearEls.forEach(function (el) {
    el.textContent = currentYear;
  });

  // 8. Button Ripple Effect
  document.querySelectorAll('.btn').forEach(function(btn) {
    btn.addEventListener('click', function(e) {
      var ripple = document.createElement('span');
      ripple.classList.add('btn-ripple');
      var rect = btn.getBoundingClientRect();
      var size = Math.max(rect.width, rect.height);
      var x = e.clientX - rect.left - size / 2;
      var y = e.clientY - rect.top - size / 2;
      ripple.style.width = ripple.style.height = size + 'px';
      ripple.style.left = x + 'px';
      ripple.style.top = y + 'px';
      btn.appendChild(ripple);
      setTimeout(function() { ripple.remove(); }, 700);
    });
  });

})();
