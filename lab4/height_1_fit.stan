data {
    int<lower=0> N;
    real<lower=0> heights[N];
}

parameters {
    real<lower=0> u;
    real<lower=0> sigma;
}

model {
    u ~ normal(155, 8);
    sigma ~ normal(15, 1);
    heights ~ normal(u, sigma);
}

generated quantities {
    real<lower=0> height_pred = normal_rng(u, sigma);
}