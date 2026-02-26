document.addEventListener("DOMContentLoaded", () => {
  const header = document.getElementById("siteHeader");
  const toTop = document.getElementById("toTop");
  const navCollapse = document.getElementById("mainNav");

  // Header solid + scroll-to-top visibility
  const onScroll = () => {
    const y = window.scrollY || 0;
    if (header) header.classList.toggle("is-solid", y > 12);
    if (toTop) toTop.style.display = y > 450 ? "inline-flex" : "none";
  };

  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  // Scroll to top
  if (toTop) {
    toTop.addEventListener("click", () =>
      window.scrollTo({ top: 0, behavior: "smooth" })
    );
  }

  // Auto-close mobile nav when a link is clicked (Bootstrap 5)
  if (navCollapse) {
    navCollapse.querySelectorAll(".nav-link").forEach((link) => {
      link.addEventListener("click", () => {
        const isShown = navCollapse.classList.contains("show");
        if (isShown && window.bootstrap?.Collapse) {
          const collapse = bootstrap.Collapse.getOrCreateInstance(navCollapse);
          collapse.hide();
        }
      });
    });
  }

  // Counter animation
  const ids = ["projects-counter", "pubs-counter", "team-counter", "collab-counter"];
  const els = ids.map((id) => document.getElementById(id)).filter(Boolean);
  if (!els.length) return;

  const animate = (el) => {
    const target = parseInt(el.getAttribute("data-target") || "0", 10);
    let current = 0;
    const step = Math.max(1, Math.round(target / 60));

    el.textContent = "0";

    const tick = () => {
      current = Math.min(target, current + step);
      el.textContent = String(current);
      if (current < target) requestAnimationFrame(tick);
    };

    requestAnimationFrame(tick);
  };

  const obs = new IntersectionObserver(
    (entries, o) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          animate(e.target);
          o.unobserve(e.target);
        }
      });
    },
    { threshold: 0.35 }
  );

  els.forEach((el) => obs.observe(el));
});