data {
    int N;
    int accidents[N];
    real miles[N];
}

parameters {
    real alpha;
    real theta;
}

transformed parameters {
    real lambda[N];
    for (i in 1:N) {
        lambda[i] = exp(alpha + theta * miles[i]);
    }
}

model {
    alpha ~ normal(3, 1);
    theta ~ normal(0.5, 0.15);
    for (i in 1:N) {
        accidents[i] ~ poisson(lambda[i]);
    }
}

generated quantities {
    int accidents_pred[N];
    for (i in 1:N) {
        accidents_pred[i] = poisson_rng(lambda[i]);
    }
}

