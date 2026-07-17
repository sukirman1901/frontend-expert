(() => {
  const nav = document.getElementById("settings-nav");
  const toggle = document.getElementById("nav-toggle");
  const panel = document.getElementById("settings-panel");
  const navItems = document.querySelectorAll(".settings-nav__item");
  const sections = document.querySelectorAll("[data-section-panel]");

  function isMobileNav() {
    return window.matchMedia("(max-width: 767px)").matches;
  }

  function closeMobileNav({ restoreFocus = false } = {}) {
    if (!nav.classList.contains("is-open")) return;
    nav.classList.remove("is-open");
    toggle.setAttribute("aria-expanded", "false");
    toggle.setAttribute("aria-label", "Open settings menu");
    if (restoreFocus) {
      toggle.focus();
    }
  }

  function openMobileNav() {
    nav.classList.add("is-open");
    toggle.setAttribute("aria-expanded", "true");
    toggle.setAttribute("aria-label", "Close settings menu");
    const firstItem = nav.querySelector(".settings-nav__item");
    firstItem?.focus();
  }

  function setSection(id) {
    navItems.forEach((btn) => {
      const active = btn.dataset.section === id;
      if (active) {
        btn.setAttribute("aria-current", "page");
      } else {
        btn.removeAttribute("aria-current");
      }
    });

    sections.forEach((section) => {
      const match = section.dataset.sectionPanel === id;
      section.hidden = !match;
      section.classList.toggle("is-hidden", !match);
    });

    if (isMobileNav()) {
      closeMobileNav();
    }

    const heading = document.querySelector(`#section-${id} h1`);
    if (heading) {
      document.title = `${heading.textContent} — Settings — Acme`;
    }
  }

  toggle.addEventListener("click", () => {
    const open = !nav.classList.contains("is-open");
    if (open) {
      openMobileNav();
    } else {
      closeMobileNav({ restoreFocus: true });
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key !== "Escape") return;
    if (!nav.classList.contains("is-open") || !isMobileNav()) return;
    event.preventDefault();
    closeMobileNav({ restoreFocus: true });
  });

  navItems.forEach((btn) => {
    btn.addEventListener("click", () => {
      setSection(btn.dataset.section);
      panel.focus({ preventScroll: true });
    });
  });

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

  // Demo: loading / error / empty for team (not auto-triggered)
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
    // Placeholder — keeps invite action wired without a modal for this demo
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

  // Expose for quick manual checks in console if needed
  window.__settingsDemo = { setSection, showTeamState };
})();
