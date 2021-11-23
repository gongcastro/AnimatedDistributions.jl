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