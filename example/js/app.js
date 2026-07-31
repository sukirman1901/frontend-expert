(() => {
  const PROJECTS = [
    { id: "prj_8k2m", name: "Checkout API", mark: "CA", status: "live", owner: "Maya Chen", requests: "482k", updated: "2h ago" },
    { id: "prj_1n9q", name: "Pulse Analytics", mark: "PA", status: "live", owner: "Ayla Kim", requests: "1.1M", updated: "5h ago" },
    { id: "prj_4rt7", name: "Atlas Mobile", mark: "AM", status: "paused", owner: "Jon Hale", requests: "96k", updated: "Yesterday" },
    { id: "prj_0vx3", name: "Edge Auth", mark: "EA", status: "live", owner: "Rina Park", requests: "210k", updated: "2d ago" },
    { id: "prj_6wp1", name: "Billing Webhooks", mark: "BW", status: "draft", owner: "Ayla Kim", requests: "—", updated: "4d ago" },
    { id: "prj_2hz8", name: "Support Inbox", mark: "SI", status: "live", owner: "Maya Chen", requests: "64k", updated: "1w ago" },
  ];

  const ALL_PROJECTS = [
    { id: "prj_8k2m", name: "Checkout API", mark: "CA", status: "live", endpoint: "api.northline.app/checkout", requests: "482k", deployed: "2h ago" },
    { id: "prj_1n9q", name: "Pulse Analytics", mark: "PA", status: "live", endpoint: "api.northline.app/pulse", requests: "1.1M", deployed: "5h ago" },
    { id: "prj_4rt7", name: "Atlas Mobile", mark: "AM", status: "paused", endpoint: "api.northline.app/atlas", requests: "96k", deployed: "3d ago" },
    { id: "prj_0vx3", name: "Edge Auth", mark: "EA", status: "live", endpoint: "api.northline.app/auth", requests: "210k", deployed: "2d ago" },
    { id: "prj_6wp1", name: "Billing Webhooks", mark: "BW", status: "draft", endpoint: "api.northline.app/billing", requests: "—", deployed: "4d ago" },
    { id: "prj_2hz8", name: "Support Inbox", mark: "SI", status: "live", endpoint: "api.northline.app/support", requests: "64k", deployed: "1w ago" },
    { id: "prj_3kf9", name: "Data Pipeline", mark: "DP", status: "live", endpoint: "api.northline.app/data", requests: "2.3M", deployed: "6h ago" },
    { id: "prj_7mn2", name: "Notification Service", mark: "NS", status: "paused", endpoint: "api.northline.app/notify", requests: "18k", deployed: "2w ago" },
  ];

  const CUSTOMERS = [
    { name: "Acme Corp", plan: "Enterprise", seats: "12 / 15", requests: "820k", status: "active", lastActive: "12 min ago" },
    { name: "Globex Inc", plan: "Pro", seats: "8 / 10", requests: "410k", status: "active", lastActive: "1h ago" },
    { name: "Initech", plan: "Pro", seats: "6 / 10", requests: "195k", status: "active", lastActive: "3h ago" },
    { name: "Umbrella Labs", plan: "Free", seats: "2 / 3", requests: "24k", status: "active", lastActive: "1d ago" },
    { name: "Stark Industries", plan: "Enterprise", seats: "10 / 20", requests: "1.2M", status: "active", lastActive: "30 min ago" },
    { name: "Wayne Enterprises", plan: "Pro", seats: "4 / 10", requests: "88k", status: "trial", lastActive: "5h ago" },
    { name: "Cyberdyne Systems", plan: "Free", seats: "1 / 3", requests: "6.2k", status: "active", lastActive: "3d ago" },
    { name: "Soylent Corp", plan: "Pro", seats: "3 / 10", requests: "52k", status: "active", lastActive: "2d ago" },
  ];

  const INVOICES = [
    { date: "Jul 17, 2026", description: "Northline Pro — Monthly", amount: "$49.00", status: "paid" },
    { date: "Jun 17, 2026", description: "Northline Pro — Monthly", amount: "$49.00", status: "paid" },
    { date: "May 17, 2026", description: "Northline Pro — Monthly", amount: "$49.00", status: "paid" },
    { date: "Apr 17, 2026", description: "Northline Pro — Monthly", amount: "$49.00", status: "paid" },
    { date: "Mar 17, 2026", description: "Northline Pro — Monthly", amount: "$49.00", status: "paid" },
  ];

  const MEMBERS = [
    { name: "Ayla Kim", email: "ayla@northline.app", role: "Owner", avatar: "AK", joined: "Jan 2025" },
    { name: "Maya Chen", email: "maya@northline.app", role: "Admin", avatar: "MC", joined: "Mar 2025" },
    { name: "Jon Hale", email: "jon@northline.app", role: "Developer", avatar: "JH", joined: "Jun 2025" },
    { name: "Rina Park", email: "rina@northline.app", role: "Developer", avatar: "RP", joined: "Sep 2025" },
    { name: "Sam Torres", email: "sam@northline.app", role: "Viewer", avatar: "ST", joined: "Feb 2026" },
  ];

  const API_KEYS = [
    { name: "Production", prefix: "nl_prod_8k2m…", created: "Jan 15, 2026", lastUsed: "2 min ago" },
    { name: "Staging", prefix: "nl_stg_1n9q…", created: "Mar 8, 2026", lastUsed: "1h ago" },
    { name: "CI/CD Pipeline", prefix: "nl_ci_4rt7…", created: "Jun 22, 2026", lastUsed: "6h ago" },
    { name: "Local dev", prefix: "nl_dev_0vx3…", created: "Jul 10, 2026", lastUsed: "3d ago" },
  ];

  const SECTIONS = {
    overview: { title: "Overview", sub: "Workspace pulse for the last 30 days — ship velocity, usage, and open work." },
    projects: { title: "Projects", sub: "Manage your API projects, endpoints, and webhooks." },
    customers: { title: "Customers", sub: "Organizations with active API keys and usage this billing cycle." },
    billing: { title: "Billing", sub: "Plan, invoices, and payment for Northline Pro." },
    settings: { title: "Settings", sub: "Org profile, members, and security defaults." },
  };

  const FOCUSABLE = 'a[href], button:not([disabled]), input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])';

  const app = document.getElementById("app");
  const sidebar = document.getElementById("sidebar");
  const backdrop = document.getElementById("backdrop");
  const menuToggle = document.getElementById("menu-toggle");
  const menuIcon = document.getElementById("menu-icon");
  const collapseToggle = document.getElementById("collapse-toggle");
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
  let collapsed = window.matchMedia("(min-width: 768px) and (max-width: 1023px)").matches;
  let viewState = "ready";
  let drawerKeyHandler = null;
  let currentPage = "overview";

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
    collapseToggle.setAttribute("aria-label", next ? "Expand sidebar" : "Collapse sidebar");
  }

  function badgeClass(status) {
    if (status === "live" || status === "active") return "badge badge--live";
    if (status === "paused" || status === "trial") return "badge badge--paused";
    return "badge badge--draft";
  }

  function filteredProjects() {
    const status = getStatusValue();
    const q = projectFilter.value.trim().toLowerCase();
    return PROJECTS.filter((p) => {
      const statusOk = status === "all" || p.status === status;
      const qOk = !q || p.name.toLowerCase().includes(q) || p.id.toLowerCase().includes(q);
      return statusOk && qOk;
    });
  }

  function renderRows(list) {
    rowsEl.innerHTML = list.map((p) => `
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
      </tr>`).join("");
  }

  function renderProjectsPage(list) {
    const el = document.getElementById("projects-rows");
    if (!el) return;
    el.innerHTML = list.map((p) => `
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
        <td class="col-hide-sm"><code class="mono">${p.endpoint}</code></td>
        <td class="col-hide-sm mono">${p.requests}</td>
        <td>${p.deployed}</td>
        <td>
          <button type="button" class="icon-btn" aria-label="Actions for ${p.name}">
            <re-icon icon="more-horizontal" size="16"></re-icon>
          </button>
        </td>
      </tr>`).join("");
  }

  function renderCustomersPage(list) {
    const el = document.getElementById("customers-rows");
    if (!el) return;
    el.innerHTML = list.map((c) => `
      <tr>
        <td>
          <div class="project-cell">
            <span class="project-cell__mark" aria-hidden="true">${c.name.split(" ").map(w => w[0]).join("")}</span>
            <div class="project-cell__name">${c.name}</div>
          </div>
        </td>
        <td><span class="badge">${c.plan}</span></td>
        <td class="col-hide-sm mono">${c.seats}</td>
        <td class="col-hide-sm mono">${c.requests}</td>
        <td><span class="${badgeClass(c.status)}">${c.status}</span></td>
        <td class="col-hide-sm">${c.lastActive}</td>
      </tr>`).join("");
  }

  function renderInvoicesPage() {
    const el = document.getElementById("invoices-rows");
    if (!el) return;
    el.innerHTML = INVOICES.map((inv) => `
      <tr>
        <td>${inv.date}</td>
        <td class="col-hide-billing">${inv.description}</td>
        <td class="mono">${inv.amount}</td>
        <td><span class="badge badge--live">${inv.status}</span></td>
        <td>
          <button type="button" class="icon-btn" aria-label="Download invoice">
            <re-icon icon="download" size="16"></re-icon>
          </button>
        </td>
      </tr>`).join("");
  }

  function renderMembersPage() {
    const el = document.getElementById("members-rows");
    if (!el) return;
    el.innerHTML = MEMBERS.map((m) => `
      <tr>
        <td>
          <div class="project-cell">
            <span class="avatar" aria-hidden="true">${m.avatar}</span>
            <div>
              <div class="project-cell__name">${m.name}</div>
              <div class="project-cell__id">${m.email}</div>
            </div>
          </div>
        </td>
        <td><span class="badge">${m.role}</span></td>
        <td class="col-hide-sm">${m.joined}</td>
        <td>
          <button type="button" class="icon-btn" aria-label="Actions for ${m.name}">
            <re-icon icon="more-horizontal" size="16"></re-icon>
          </button>
        </td>
      </tr>`).join("");
  }

  function renderApiKeysPage() {
    const el = document.getElementById("api-keys-rows");
    if (!el) return;
    el.innerHTML = API_KEYS.map((k) => `
      <tr>
        <td class="project-cell__name">${k.name}</td>
        <td><code class="mono">${k.prefix}</code></td>
        <td class="col-hide-sm">${k.created}</td>
        <td class="col-hide-sm">${k.lastUsed}</td>
        <td>
          <button type="button" class="icon-btn" aria-label="Revoke key ${k.name}">
            <re-icon icon="trash" size="16"></re-icon>
          </button>
        </td>
      </tr>`).join("");
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
    currentPage = key;
    const meta = SECTIONS[key] || SECTIONS.overview;
    document.title = `Northline — ${meta.title}`;
    document.querySelectorAll(".page").forEach((page) => {
      const isTarget = page.dataset.page === key;
      page.hidden = !isTarget;
    });
    document.querySelectorAll(".nav-item").forEach((btn) => {
      btn.classList.toggle("is-active", btn.dataset.section === key);
    });
    main.style.animation = "none";
    void main.offsetWidth;
    main.style.animation = "";
    if (isMobile() && drawerOpen) setDrawer(false);
    if (key === "overview") setViewState("ready");
    if (key === "projects") renderProjectsPage(ALL_PROJECTS);
    if (key === "customers") renderCustomersPage(CUSTOMERS);
    if (key === "billing") renderInvoicesPage();
    if (key === "settings") {
      renderMembersPage();
      renderApiKeysPage();
    }
  }

  function initSettingsTabs() {
    document.querySelectorAll(".settings-tab").forEach((tab) => {
      tab.addEventListener("click", () => {
        const target = tab.dataset.settingsTab;
        document.querySelectorAll(".settings-tab").forEach((t) => t.classList.toggle("is-active", t === tab));
        document.querySelectorAll(".settings-section").forEach((s) => {
          s.hidden = s.dataset.settingsPanel !== target;
        });
      });
    });
  }

  function initToggles() {
    document.querySelectorAll(".toggle").forEach((btn) => {
      btn.addEventListener("click", () => {
        const next = btn.getAttribute("aria-checked") !== "true";
        btn.setAttribute("aria-checked", String(next));
      });
    });
  }

  function applyTheme() {
    const dark = document.documentElement.classList.contains("dark");
    themeToggle.setAttribute("aria-label", dark ? "Switch to light mode" : "Switch to dark mode");
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
      if (accountOpen) { setAccountOpen(false); accountTrigger?.focus(); return; }
      if (statusOpen) { setStatusOpen(false); statusFilter.focus(); return; }
      if (drawerOpen) setDrawer(false);
      return;
    }
    if (statusOpen) {
      const options = getStatusOptions();
      if (e.key === "ArrowDown") { e.preventDefault(); setStatusActiveIndex(statusActiveIndex + 1); return; }
      if (e.key === "ArrowUp") { e.preventDefault(); setStatusActiveIndex(statusActiveIndex - 1); return; }
      if (e.key === "Home") { e.preventDefault(); setStatusActiveIndex(0); return; }
      if (e.key === "End") { e.preventDefault(); setStatusActiveIndex(options.length - 1); return; }
      if (e.key === "Enter" || e.key === " ") { e.preventDefault(); commitStatusOption(options[statusActiveIndex]); return; }
    }
    if (accountOpen && accountMenu) {
      const items = Array.from(accountMenu.querySelectorAll('[role="menuitem"]'));
      const idx = items.indexOf(document.activeElement);
      if (e.key === "ArrowDown") { e.preventDefault(); items[(idx + 1) % items.length]?.focus(); }
      else if (e.key === "ArrowUp") { e.preventDefault(); items[(idx - 1 + items.length) % items.length]?.focus(); }
    }
  });

  window.addEventListener("resize", () => {
    if (!isMobile() && drawerOpen) setDrawer(false, { restoreFocus: false });
    if (window.matchMedia("(min-width: 768px) and (max-width: 1023px)").matches && !app.classList.contains("is-collapsed")) {
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

  document.getElementById("retry-load")?.addEventListener("click", () => {
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

  initSettingsTabs();
  initToggles();
  enableDemoBarIfRequested();
  setCollapsed(collapsed);
  applyTheme();
  setViewState("ready");
})();
