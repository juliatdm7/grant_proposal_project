## Predator-Prey Model ###
library(ggplot2)

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

# Time steps
nsteps <- 15

# Storage for population sizes
pop.df <- data.frame(time=1:nsteps,N=numeric(nsteps),H=numeric(nsteps))
pop.df <- within(pop.df,{
  N[1] <- 20  # Population of R. okamurae initially considered to be relatively low
  H[1] <- 50
})

# Discrete model simulation with functional response
for (t in 2:nsteps) {
  pop.df <- within(pop.df,{
    # Type II Functional Response (herbivory pressure)
    G <- (params$a * N[t-1] * H[t-1]) / (1 + params$a * N[t-1] * params$h)
    
    # Prey population (logistic growth with functional response of herbivorous grazing)
    N[t] <- max(0, N[t-1] + params$r * N[t-1]*(1-N[t-1]/params$K) - G) 
    
    # Predator population (growth, baseline mortality and toxicity-driven mortality)
    H[t] <- max(0, H[t-1] + params$f_h * G - params$d  * H[t-1] * (params$d + params$k * N[t-1])) 
  })
}

# Plot results

ggplot(pop.df, aes(x = time)) +
  geom_line(aes(y = N, color = "Prey (R. okamurae)")) +
  geom_line(aes(y = H, color = "Herbivores (P. lividus etc.)")) +
  labs(title = "Discrete Predator-Prey Model with Type II Functional Response",
       x = "Time", y = "Population Size") +
  scale_color_manual(name = "Legend", 
                     values = c("blue", "red")) +
  theme_minimal()
