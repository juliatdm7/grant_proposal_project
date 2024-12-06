## Predator-Prey Model ###

# Defining parameters
params <- list(
  r = 1.06,      # Prey growth rate just above 1
  K = 100,      # Carrying capacity (no particular interest in setting a specific value)
  a = 2,     # H erbivores’ pressure on R. okamurae (attack rate or searching efficiency; relatively high as R. okamurae is quite abundant now. However, it would be interesting to make it so that it varies according to how N changes)
  h = 3,      # Time (in days) that takes for an herbivore to consume a whole R. okamurae individual (high due to deterrent effects of SM)
  k = 0.095,   # Additional predator mortality due to toxic effects, proportional to prey abundance.
  f_h = 0.6,      # Predator fertility (proportion of offspring that thrives; intermediate value)
  d = 0.1      # Baseline predator death rate
)
