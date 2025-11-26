/**
 * Timeline Animation Script
 * Handles scroll-triggered animations for timeline items
 */

document.addEventListener("DOMContentLoaded", function () {
  // Check if we're on the timeline page
  const timelineContainer = document.querySelector(".timeline-container");
  if (!timelineContainer) return;

  // Initialize GSAP ScrollTrigger if available
  if (typeof gsap !== "undefined" && typeof ScrollTrigger !== "undefined") {
    gsap.registerPlugin(ScrollTrigger);

    // Animate timeline cards on scroll
    const timelineItems = document.querySelectorAll(".timeline-item");
    timelineItems.forEach((item, index) => {
      gsap.from(item, {
        scrollTrigger: {
          trigger: item,
          start: "top 85%",
          end: "top 60%",
          scrub: 1,
          toggleActions: "play none none reverse",
        },
        opacity: 0,
        x: -50,
        duration: 0.8,
      });

      // Animate the marker separately
      const marker = item.querySelector(".timeline-marker");
      if (marker) {
        gsap.from(marker, {
          scrollTrigger: {
            trigger: item,
            start: "top 80%",
            toggleActions: "play none none reverse",
          },
          scale: 0,
          duration: 0.4,
          ease: "back.out(1.7)",
        });
      }
    });

    console.log("Timeline initialized with", timelineItems.length, "items");
  } else {
    console.log("Timeline loaded (GSAP not available)");
  }

  // Add hover effects to timeline cards
  const timelineCards = document.querySelectorAll(".timeline-card");
  timelineCards.forEach((card) => {
    card.addEventListener("mouseenter", function () {
      this.style.transform = "translateY(-5px)";
      this.style.transition = "transform 0.3s ease, box-shadow 0.3s ease";
    });

    card.addEventListener("mouseleave", function () {
      this.style.transform = "translateY(0)";
    });
  });
});
