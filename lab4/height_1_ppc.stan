generated quantities {
  real<lower=0> u = normal_rng(155, 8);
  real<lower=0> sigma = normal_rng(15, 1);
  real<lower=0> height = normal_rng(u, sigma);
}