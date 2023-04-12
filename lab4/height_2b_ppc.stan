data {
    int<lower=0> N;
    real<lower=0> weight[N];
}

generated quantities {
    real u = normal_rng(155, 8);
    real alpha = normal_rng(155, 8);
    real sigma = normal_rng(15,1);
    real beta = lognormal_rng(0, 1);

    real<lower=20, upper=270> heights[N];

    for (i in 1:N) {
      heights[i] = normal_rng(alpha + beta * weight[i], sigma);
    }
}