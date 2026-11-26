# Shared R helpers for NeoPMx presentations

library(ggplot2)
library(dplyr)

#' Clean ggplot2 theme matching the NeoPMx Reveal.js palette
theme_neopmx <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", color = "#0f172a"),
      plot.subtitle = element_text(color = "#475569"),
      axis.title = element_text(face = "bold", color = "#1e293b"),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(color = "#e2e8f0"),
      legend.position = "top",
      legend.title = element_text(face = "bold")
    )
}

#' Closed-form 1-compartment oral PK simulation (single dose)
#' Replace or extend with mrgsolve / rxode2 for complex ODE or IIV models.
sim_1cmt_oral <- function(time = seq(0, 24, by = 0.25),
                          dose = 100,
                          cl = 5,
                          v = 50,
                          ka = 1.2,
                          f = 1) {
  ke <- cl / v
  if (abs(ka - ke) < 1e-6) {
    conc <- (f * dose / v) * ka * time * exp(-ke * time)
  } else {
    conc <- (f * dose * ka) / (v * (ka - ke)) * (exp(-ke * time) - exp(-ka * time))
  }
  tibble::tibble(time = time, conc = pmax(conc, 0))
}
