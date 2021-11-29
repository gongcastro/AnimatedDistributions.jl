# Animating probability distributions

## Beta distribution

```julia
x = collect(0.01:0.01:0.99);
α = collect(0.1:0.2:10);
β = collect(0.1:0.5:10);
animate_beta(x, α, β)
```

## Normal distribution

```julia
x = collect(-4:0.01:4);
μ = collect(-4:0.5:4);
σ = collect(1:0.1:8);
animate_normal(x, μ, σ)
```

## Gamma distribution

```julia
x = collect(0.1:0.01:4);
α = collect(0.1:0.1:5);
θ = collect(0.5:0.1:2);
animate_gamma(x, α, θ)
```

## Cauchy distribution

```julia
x = collect(-4:0.01:4);
μ = collect(-4:1:4);
σ = collect(1:0.1:8);
animate_cauchy(x, μ, σ)
```

## Weibull distribution

```julia
x=collect(0:0.01:6);
α=collect(0.1:0.1:5);
θ=collect(1:0.25:10);
animate_weibull(x, α, θ)
```

## Inverse-Gamma distribution

```julia
x = collect(0.1:0.01:4);
α = collect(0.1:0.1:5);
θ = collect(0.5:0.1:2);
animate_invgamma(x, α, θ)
```

## Frechet distribution

```julia
x=collect(0:0.01:5);
α=collect(0.1:0.1:10);
θ=collect(0.5:0.25:5);
animate_frechet(x, α, θ)
```


## Rayleigh distribution

```julia
x=collect(0:0.01:5);
σ=collect(0.1:0.1:10);
animate_rayleigh(x, σ)
```

## Exponential distribution

```julia
x=collect(0:0.01:10);
θ=collect(0.5:0.1:8);
animate_exponential(x, θ)
```

## Pareto distribution
```julia
x=collect(0:0.01:6);
α = collect(0.1:0.1:5);
θ = collect(0.5:0.2:2);
animate_pareto(x, α, θ)
```

## Semicircle distribution

```julia
x=collect(-10:0.05:10);
R=collect(0.1:0.1:10);
animate_semicircle(x, R)
```

## Tri-weight distribution

```julia
x = collect(-5:0.01:5);
μ = collect(-4:0.5:4);
σ = collect(0.5:0.1:10);
animate_triweight(x, μ, σ)
```

## Student's *t* distribution

```julia
x=collect(-4:0.01:4);
ν=collect(0.5:0.1:5); # letter "nu", not "v"
animate_tstudent(x, ν)
```
