(() => {
  const PROJECTS = [
    {
      id: "prj_8k2m",
      name: "Checkout API",
      mark: "CA",
      status: "live",
      owner: "Maya Chen",
      requests: "482k",
      updated: "2h ago",
    },
    {
      id: "prj_1n9q",
      name: "Pulse Analytics",
      mark: "PA",
      status: "live",
      owner: "Ayla Kim",
      requests: "1.1M",
      updated: "5h ago",
    },
    {
      id: "prj_4rt7",
      name: "Atlas Mobile",
      mark: "AM",
      status: "paused",
      owner: "Jon Hale",
      requests: "96k",
      updated: "Yesterday",
    },
    {
      id: "prj_0vx3",
      name: "Edge Auth",
      mark: "EA",
      status: "live",
      owner: "Rina Park",
      requests: "210k",
      updated: "2d ago",
    },
    {
      id: "prj_6wp1",
      name: "Billing Webhooks",
      mark: "BW",
      status: "draft",
      owner: "Ayla Kim",
      requests: "—",
      updated: "4d ago",
    },
    {
      id: "prj_2hz8",
      name: "Support Inbox",
      mark: "SI",
      status: "live",
      owner: "Maya Chen",
      requests: "64k",
      updated: "1w ago",
    },
  ];

  const SECTIONS = {
    overview: {
      title: "Overview",
      sub: "Workspace pulse for the last 30 days — ship velocity, usage, and open work.",
    },
    projects: {
      title: "Projects",
      sub: "All workspaces in this org. Filter by status or search by name.",
    },
    customers: {
      title: "Customers",
      sub: "Accounts with active seats and usage this billing cycle.",
    },
    billing: {
      title: "Billing",
      sub: "Plan, invoices, and seat allocation for Northline Pro.",
    },
    settings: {
      title: "Settings",
      sub: "Org profile, members, and security defaults.",
    },
  };

  const FOCUSABLE =
    'a[href], button:not([disabled]), input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])';

  const app = document.getElementById("app");
  const sidebar = document.getElementById("sidebar");
  const backdrop = document.getElementById("backdrop");
  const menuToggle = document.getElementById("menu-toggle");
  const menuIcon = document.getElementById("menu-icon");
  const collapseToggle = document.getElementById("collapse-toggle");
  const pageTitle = document.getElementById("page-title");
  const pageSub = document.getElementById("page-sub");
  const main = document.getElementById("main");
  const rowsEl = document.getElementById("project-rows");
  const statusFilter = document.getElementById("status-filter");
  const statusMenu = document.getElementById("status-filter-menu");
  const statusValueEl = document.getElementById("status-filter-value");
  const projectFilter = document.getElementById("project-filter");
  const tableWrap = document.getElementById("table-wrap");
  const loadingEl = document.getElementById("table-loading");
  const emptyEl = document.getElementById("table-empty");
  const errorEl = document.getElementById("table-error");
  const themeToggle = document.getElementById("theme-toggle");
  const themeIcon = document.getElementById("theme-icon");
  const demoBar = document.getElementById("demo-bar");
  const accountTrigger = document.getElementById("account-trigger");
  const accountMenu = document.getElementById("account-dropdown");

  let drawerOpen = false;
  let statusOpen = false;
  let accountOpen = false;
  let statusActiveIndex = 0;
  let collapsed =
    window.matchMedia("(min-width: 768px) and (max-width: 1023px)").matches;
  let viewState = "ready";
  let drawerKeyHandler = null;

  function getFocusable(container) {
    return Array.from(container.querySelectorAll(FOCUSABLE)).filter(
      (el) => !el.hasAttribute("disabled") && el.getAttribute("aria-hidden") !== "true"
    );
  }

  function getStatusOptions() {
    return Array.from(statusMenu.querySelectorAll(".select__option"));
  }

  function getStatusValue() {
    return statusFilter.dataset.value || "all";
  }

  function setStatusActiveIndex(index, { scroll = true } = {}) {
    const options = getStatusOptions();
    if (!options.length) return;
    statusActiveIndex = Math.max(0, Math.min(index, options.length - 1));
    options.forEach((opt, i) => {
      opt.classList.toggle("is-active", i === statusActiveIndex);
    });
    const active = options[statusActiveIndex];
    if (active) {
      statusFilter.setAttribute("aria-activedescendant", active.id);
      if (scroll) active.scrollIntoView({ block: "nearest" });
    }
  }

  function setStatusOpen(open) {
    statusOpen = open;
    statusFilter.setAttribute("aria-expanded", String(open));
    statusMenu.hidden = !open;
    if (open) {
      const options = getStatusOptions();
      const current = options.findIndex((o) => o.dataset.value === getStatusValue());
      setStatusActiveIndex(current >= 0 ? current : 0);
    } else {
      statusFilter.removeAttribute("aria-activedescendant");
      getStatusOptions().forEach((opt) => opt.classList.remove("is-active"));
    }
  }

  function setAccountOpen(open) {
    accountOpen = open;
    if (!accountTrigger || !accountMenu) return;
    accountTrigger.setAttribute("aria-expanded", String(open));
    accountMenu.hidden = !open;
    if (open) {
      accountMenu.querySelector('[role="menuitem"]')?.focus();
    }
  }

  function setStatusValue(value, label) {
    statusFilter.dataset.value = value;
    statusValueEl.textContent = label;
    getStatusOptions().forEach((opt) => {
      const selected = opt.dataset.value === value;
      opt.classList.toggle("is-selected", selected);
      opt.setAttribute("aria-selected", String(selected));
    });
  }

  function commitStatusOption(opt) {
    if (!opt) return;
    setStatusValue(opt.dataset.value, opt.textContent.trim());
    setStatusOpen(false);
    if (viewState !== "error") setViewState("ready");
    statusFilter.focus();
  }

  function isMobile() {
    return window.matchMedia("(max-width: 767px)").matches;
  }

  function releaseDrawerTrap() {
    if (drawerKeyHandler) {
      document.removeEventListener("keydown", drawerKeyHandler, true);
      drawerKeyHandler = null;
    }
  }

  function trapDrawerFocus() {
    releaseDrawerTrap();
    drawerKeyHandler = (e) => {
      if (!drawerOpen || !isMobile()) return;
      if (e.key !== "Tab") return;
      const nodes = getFocusable(sidebar);
      if (!nodes.length) return;
      const first = nodes[0];
      const last = nodes[nodes.length - 1];
      if (e.shiftKey && document.activeElement === first) {
        e.preventDefault();
        last.focus();
      } else if (!e.shiftKey && document.activeElement === last) {
        e.preventDefault();
        first.focus();
      }
    };
    document.addEventListener("keydown", drawerKeyHandler, true);
  }

  function setDrawer(open, { restoreFocus = true } = {}) {
    const wasOpen = drawerOpen;
    drawerOpen = open;
    sidebar.classList.toggle("is-open", open);
    backdrop.hidden = !open;
    backdrop.classList.toggle("is-visible", open);
    menuToggle.setAttribute("aria-expanded", String(open));
    menuToggle.setAttribute("aria-label", open ? "Close navigation" : "Open navigation");
    if (menuIcon) menuIcon.setAttribute("icon", open ? "x" : "menu");
    document.body.style.overflow = open && isMobile() ? "hidden" : "";

    if (open && isMobile()) {
      trapDrawerFocus();
      sidebar.querySelector(".nav-item")?.focus();
    } else {
      releaseDrawerTrap();
      if (restoreFocus && wasOpen && isMobile()) menuToggle.focus();
    }
  }

  function setCollapsed(next) {
    collapsed = next;
    app.classList.toggle("is-collapsed", next);
    collapseToggle.setAttribute("aria-pressed", String(next));
    collapseToggle.setAttribute(
      "aria-label",
      next ? "Expand sidebar" : "Collapse sidebar"
    );
  }

  function badgeClass(status) {
    if (status === "live") return "badge badge--live";
    if (status === "paused") return "badge badge--paused";
    return "badge badge--draft";
  }

  function filteredProjects() {
    const status = getStatusValue();
    const q = projectFilter.value.trim().toLowerCase();
    return PROJECTS.filter((p) => {
      const statusOk = status === "all" || p.status === status;
      const qOk =
        !q ||
        p.name.toLowerCase().includes(q) ||
        p.id.toLowerCase().includes(q);
      return statusOk && qOk;
    });
  }

  function renderRows(list) {
    rowsEl.innerHTML = list
      .map(
        (p) => `
      <tr>
        <td>
          <div class="project-cell">
            <span class="project-cell__mark" aria-hidden="true">${p.mark}</span>
            <div>
              <div class="project-cell__name">${p.name}</div>
              <div class="project-cell__id">${p.id}</div>
            </div>
          </div>
        </td>
        <td><span class="${badgeClass(p.status)}">${p.status}</span></td>
        <td class="col-hide-sm">${p.owner}</td>
        <td class="col-hide-sm mono">${p.requests}</td>
        <td>${p.updated}</td>
      </tr>`
      )
      .join("");
  }

  function setViewState(state) {
    viewState = state;
    const ready = state === "ready";
    const loading = state === "loading";
    const empty = state === "empty";
    const error = state === "error";

    loadingEl.classList.toggle("is-visible", loading);
    loadingEl.setAttribute("aria-busy", String(loading));
    loadingEl.setAttribute("aria-hidden", String(!loading));
    emptyEl.classList.toggle("is-visible", empty);
    errorEl.classList.toggle("is-visible", error);
    tableWrap.hidden = !ready;
    statusFilter.disabled = loading || error;
    projectFilter.disabled = loading || error;
    if (loading || error) setStatusOpen(false);

    if (ready) {
      const list = filteredProjects();
      if (list.length === 0) {
        setViewState("empty");
        return;
      }
      renderRows(list);
    }
  }

  function switchSection(key) {
    const meta = SECTIONS[key] || SECTIONS.overview;
    pageTitle.textContent = meta.title;
    pageSub.textContent = meta.sub;
    document.title = `Northline — ${meta.title}`;
    document.querySelectorAll(".nav-item").forEach((btn) => {
      btn.classList.toggle("is-active", btn.dataset.section === key);
    });
    main.style.animation = "none";
    void main.offsetWidth;
    main.style.animation = "";
    if (isMobile() && drawerOpen) setDrawer(false);
  }

  function applyTheme() {
    const dark = document.documentElement.classList.contains("dark");
    themeToggle.setAttribute(
      "aria-label",
      dark ? "Switch to light mode" : "Switch to dark mode"
    );
    themeToggle.setAttribute("aria-pressed", String(dark));
    if (themeIcon) themeIcon.setAttribute("icon", dark ? "sun" : "moon");
  }

  function enableDemoBarIfRequested() {
    const params = new URLSearchParams(window.location.search);
    if (params.get("demo") === "1" && demoBar) {
      demoBar.hidden = false;
    }
  }

  menuToggle.addEventListener("click", () => setDrawer(!drawerOpen));
  backdrop.addEventListener("click", () => setDrawer(false));
  collapseToggle.addEventListener("click", () => setCollapsed(!collapsed));

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
      if (accountOpen) {
        setAccountOpen(false);
        accountTrigger?.focus();
        return;
      }
      if (statusOpen) {
        setStatusOpen(false);
        statusFilter.focus();
        return;
      }
      if (drawerOpen) setDrawer(false);
      return;
    }

    if (statusOpen) {
      const options = getStatusOptions();
      if (e.key === "ArrowDown") {
        e.preventDefault();
        setStatusActiveIndex(statusActiveIndex + 1);
        return;
      }
      if (e.key === "ArrowUp") {
        e.preventDefault();
        setStatusActiveIndex(statusActiveIndex - 1);
        return;
      }
      if (e.key === "Home") {
        e.preventDefault();
        setStatusActiveIndex(0);
        return;
      }
      if (e.key === "End") {
        e.preventDefault();
        setStatusActiveIndex(options.length - 1);
        return;
      }
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        commitStatusOption(options[statusActiveIndex]);
        return;
      }
    }

    if (accountOpen && accountMenu) {
      const items = Array.from(accountMenu.querySelectorAll('[role="menuitem"]'));
      const idx = items.indexOf(document.activeElement);
      if (e.key === "ArrowDown") {
        e.preventDefault();
        items[(idx + 1) % items.length]?.focus();
      } else if (e.key === "ArrowUp") {
        e.preventDefault();
        items[(idx - 1 + items.length) % items.length]?.focus();
      }
    }
  });

  window.addEventListener("resize", () => {
    if (!isMobile() && drawerOpen) setDrawer(false, { restoreFocus: false });
    if (
      window.matchMedia("(min-width: 768px) and (max-width: 1023px)").matches &&
      !app.classList.contains("is-collapsed")
    ) {
      setCollapsed(true);
    }
  });

  document.querySelectorAll(".nav-item").forEach((btn) => {
    btn.addEventListener("click", () => switchSection(btn.dataset.section));
  });

  statusFilter.addEventListener("click", () => {
    if (statusFilter.disabled) return;
    setStatusOpen(!statusOpen);
  });

  statusFilter.addEventListener("keydown", (e) => {
    if (statusFilter.disabled) return;
    if (e.key === "ArrowDown" || e.key === "Enter" || e.key === " ") {
      e.preventDefault();
      if (!statusOpen) setStatusOpen(true);
      else if (e.key === "ArrowDown") setStatusActiveIndex(statusActiveIndex + 1);
    }
  });

  getStatusOptions().forEach((opt, i) => {
    opt.addEventListener("click", () => commitStatusOption(opt));
    opt.addEventListener("mouseenter", () => setStatusActiveIndex(i, { scroll: false }));
  });

  document.addEventListener("click", (e) => {
    if (statusOpen && !e.target.closest("#status-select")) setStatusOpen(false);
    if (accountOpen && !e.target.closest("#account-menu")) setAccountOpen(false);
  });

  accountTrigger?.addEventListener("click", (e) => {
    e.stopPropagation();
    if (statusOpen) setStatusOpen(false);
    setAccountOpen(!accountOpen);
  });

  document.querySelectorAll("#account-dropdown [data-section]").forEach((btn) => {
    btn.addEventListener("click", () => {
      switchSection(btn.dataset.section);
      setAccountOpen(false);
    });
  });

  projectFilter.addEventListener("input", () => {
    if (viewState === "error") return;
    setViewState("ready");
  });

  document.getElementById("retry-load").addEventListener("click", () => {
    setViewState("loading");
    setTimeout(() => setViewState("ready"), 600);
  });

  ["btn-new-project", "empty-new"].forEach((id) => {
    document.getElementById(id)?.addEventListener("click", () => {
      window.alert("New project — wire to your create flow.");
    });
  });

  document.querySelectorAll("[data-demo]").forEach((btn) => {
    btn.addEventListener("click", () => setViewState(btn.dataset.demo));
  });

  themeToggle.addEventListener("click", () => {
    document.documentElement.classList.toggle("dark");
    applyTheme();
  });

  enableDemoBarIfRequested();
  setCollapsed(collapsed);
  applyTheme();
  setViewState("ready");
})();
