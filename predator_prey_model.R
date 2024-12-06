## Predator-Prey Model ###

# Defining parameters
params <- list(
  r = 1.06,      # Prey growth rate just above 1
  K = 100,      # Carrying capacity
  a = 2,     # Attack rate (searching efficiency)
  h = 3,      # Handling time (in days)
  k = 0.095,
  f_h = 0.6,      # Predator efficiency
  d = 0.1      # Baseline predator death rate
)
