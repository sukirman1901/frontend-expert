(() => {
  const app = document.getElementById("app");
  const layout = document.getElementById("layout");
  const sidebar = document.getElementById("sidebar");
  const nav = document.getElementById("settings-nav");
  const toggle = document.getElementById("nav-toggle");
  const backdrop = document.getElementById("nav-backdrop");
  const collapseBtn = document.getElementById("sidebar-collapse");
  const closeBtn = document.getElementById("nav-close");
  const panel = document.getElementById("settings-panel");
  const navItems = document.querySelectorAll(".settings-nav__item");
  const sections = document.querySelectorAll("[data-section-panel]");
  const iconMenu = toggle?.querySelector(".icon-menu");
  const iconClose = toggle?.querySelector(".icon-close");

  const COLLAPSE_KEY = "acme-settings-sidebar-collapsed";
  const mqMobile = window.matchMedia("(max-width: 767px)");
  const mqNarrowDesktop = window.matchMedia("(max-width: 1023px)");

  function prefersReducedMotion() {
    return window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  }

  function isMobileNav() {
    return mqMobile.matches;
  }

  function setMenuIcons(open) {
    if (!iconMenu || !iconClose) return;
    iconMenu.hidden = open;
    iconClose.hidden = !open;
  }

  function closeMobileNav({ restoreFocus = false } = {}) {
    if (!app.classList.contains("nav-open")) return;
    app.classList.remove("nav-open");
    toggle?.setAttribute("aria-expanded", "false");
    toggle?.setAttribute("aria-label", "Open settings menu");
    setMenuIcons(false);
    if (backdrop) backdrop.hidden = true;
    document.body.classList.remove("scroll-lock");
    if (restoreFocus) toggle?.focus();
  }

  function openMobileNav() {
    app.classList.add("nav-open");
    toggle?.setAttribute("aria-expanded", "true");
    toggle?.setAttribute("aria-label", "Close settings menu");
    setMenuIcons(true);
    if (backdrop) backdrop.hidden = false;
    document.body.classList.add("scroll-lock");
    const firstItem = nav?.querySelector(".settings-nav__item");
    firstItem?.focus();
  }

  function setSidebarCollapsed(collapsed) {
    layout?.classList.toggle("sidebar-collapsed", collapsed);
    collapseBtn?.setAttribute("aria-pressed", String(collapsed));
    collapseBtn?.setAttribute(
      "aria-label",
      collapsed ? "Expand sidebar" : "Collapse sidebar"
    );
    try {
      localStorage.setItem(COLLAPSE_KEY, collapsed ? "1" : "0");
    } catch {
      /* ignore */
    }
  }

  function autoCollapseForViewport() {
    if (isMobileNav()) {
      layout?.classList.remove("sidebar-collapsed");
      return;
    }
    // Auto-collapse on tablet landscape / small laptop; honor stored preference on ≥1024
    if (mqNarrowDesktop.matches && window.matchMedia("(min-width: 768px)").matches) {
      setSidebarCollapsed(true);
      return;
    }
    try {
      const stored = localStorage.getItem(COLLAPSE_KEY);
      if (stored === "1") setSidebarCollapsed(true);
      else if (stored === "0") setSidebarCollapsed(false);
    } catch {
      /* ignore */
    }
  }

  function setSection(id) {
    navItems.forEach((btn) => {
      const active = btn.dataset.section === id;
      if (active) btn.setAttribute("aria-current", "page");
      else btn.removeAttribute("aria-current");
    });

    sections.forEach((section) => {
      const match = section.dataset.sectionPanel === id;
      if (match) {
        section.hidden = false;
        section.classList.add("is-active");
        if (!prefersReducedMotion()) {
          section.classList.remove("is-entering");
          // reflow for re-trigger
          void section.offsetWidth;
          section.classList.add("is-entering");
        }
      } else {
        section.hidden = true;
        section.classList.remove("is-active", "is-entering");
      }
    });

    if (isMobileNav()) closeMobileNav();

    const heading = document.querySelector(`#section-${id} h2`);
    if (heading) {
      document.title = `${heading.textContent} — Settings — Acme`;
    }

    panel?.scrollTo({ top: 0, behavior: prefersReducedMotion() ? "auto" : "smooth" });
  }

  toggle?.addEventListener("click", () => {
    if (!isMobileNav()) return;
    const open = !app.classList.contains("nav-open");
    if (open) openMobileNav();
    else closeMobileNav({ restoreFocus: true });
  });

  backdrop?.addEventListener("click", () => {
    closeMobileNav({ restoreFocus: true });
  });

  closeBtn?.addEventListener("click", () => {
    closeMobileNav({ restoreFocus: true });
  });

  collapseBtn?.addEventListener("click", () => {
    if (isMobileNav()) return;
    const next = !layout.classList.contains("sidebar-collapsed");
    setSidebarCollapsed(next);
  });

  document.addEventListener("keydown", (event) => {
    if (event.key !== "Escape") return;
    if (app.classList.contains("nav-open") && isMobileNav()) {
      event.preventDefault();
      closeMobileNav({ restoreFocus: true });
    }
  });

  navItems.forEach((btn) => {
    btn.addEventListener("click", () => {
      setSection(btn.dataset.section);
      panel?.focus({ preventScroll: true });
    });
  });

  function onViewportChange() {
    if (!isMobileNav()) {
      closeMobileNav();
    }
    autoCollapseForViewport();
  }

  mqMobile.addEventListener("change", onViewportChange);
  mqNarrowDesktop.addEventListener("change", onViewportChange);
  autoCollapseForViewport();

  function wireSave(formId, statusId) {
    const form = document.getElementById(formId);
    const status = document.getElementById(statusId);
    if (!form || !status) return;

    form.addEventListener("submit", (event) => {
      event.preventDefault();
      if (!form.checkValidity()) {
        form.reportValidity();
        return;
      }

      const submit = form.querySelector('[type="submit"]');
      submit.disabled = true;
      status.textContent = "Saving…";
      status.classList.remove("is-success");

      window.setTimeout(() => {
        submit.disabled = false;
        status.textContent = "Saved";
        status.classList.add("is-success");
      }, 600);
    });
  }

  wireSave("form-profile", "status-profile");
  wireSave("form-notifications", "status-notifications");

  const teamList = document.getElementById("team-list");
  const teamLoading = document.getElementById("team-loading");
  const teamEmpty = document.getElementById("team-empty");
  const teamError = document.getElementById("team-error");
  const teamRetry = document.getElementById("team-retry");

  function showTeamState(state) {
    teamList.hidden = state !== "default";
    teamLoading.hidden = state !== "loading";
    teamEmpty.hidden = state !== "empty";
    teamError.hidden = state !== "error";
  }

  teamRetry?.addEventListener("click", () => {
    showTeamState("loading");
    window.setTimeout(() => showTeamState("default"), 700);
  });

  document.getElementById("invite-btn")?.addEventListener("click", () => {
    const status = document.createElement("p");
    status.className = "form__status is-success";
    status.setAttribute("role", "status");
    status.textContent = "Invite link copied (demo)";
    const toolbar = document.querySelector("#section-team .toolbar");
    const existing = toolbar.querySelector("[role='status']");
    existing?.remove();
    toolbar.appendChild(status);
    window.setTimeout(() => status.remove(), 2000);
  });

  window.__settingsDemo = { setSection, showTeamState, setSidebarCollapsed };
})();
