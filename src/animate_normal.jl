"""
    animate_normal(x, μ, σ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Normal distribution, as implemented in Distributions.jl.

```julia
x = collect(-4:0.01:4);
μ = collect(-4:0.5:4);
σ = collect(1:0.1:8);
animate_normal(x, μ, σ)
```

"""


function animate_normal(x, μ, σ) 

    y = zeros(length(x), length(μ), length(σ), 2);

    for i = 1:length(μ), j = 1:length(σ)
        y[:, i, j, 1] .= pdf.(Normal(μ[i], σ[j]), x);
        y[:, i, j, 2] .= cdf.(Normal(μ[i], σ[j]), x);
    end

    ## animation
    theme(:vibrant)
    indices = vcat(1:length(μ), reverse(1:length(μ)));
    
    anim = Animation()
    
    for i=indices
        p1 = plot(
            x, y[:, i, :, 1],
            legend=false,
            lw=3, ylims=(0, 6), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Density",
            title="Normal(μ, σ) - Probability density"
        )
        annotate!(median(x), 6-6/4, text(string.("μ = ", μ[i]), :black, :center, 12))
    
        p2 = plot(
            x, y[:, i, :, 2],
            legend=:outertopright, label = σ', legendtitle="σ",
            lw=3, ylims=(0, 1), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Probability",
            title="Beta(μ, σ) - Cumulative distribution"
        )

        plt = plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    return(anim)

end