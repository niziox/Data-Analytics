data {
    int<lower=0> N;
    real heights[N];
    real weights[N];
}

parameters {
    real<lower=0> alpha;
    real<lower=0> sigma;
    real<lower=0> beta;
}

transformed parameters {
    real<lower=0> u[N];
    for (i in 1:N) {
      u[i] = alpha + beta * weights[i];
  }
}

model {
    alpha ~ normal(155, 8);
    sigma ~ normal(15, 1);
    beta ~ lognormal(0, 1);
    
    for (i in 1:N) {
      heights[i] ~ normal(u[i], sigma);
    }
}

generated quantities {
    real<lower=0> height_pred[N];

    for (i in 1:N) {
      height_pred[i] = normal_rng(u[i], sigma);
    }
}