"""
    animate_weibull(x, α, θ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Weibull distribution, as implemented in Distributions.jl.

```julia
x=collect(0:0.01:6);
α=collect(0.1:0.1:5);
θ=collect(1:0.25:10);
animate_weibull(x, α, θ)
```

"""


function animate_weibull(x, α, θ) 

    y = zeros(length(x), length(α), length(θ), 2);

    for i = 1:length(α), j = 1:length(θ)
        y[:, i, j, 1] .= pdf.(Weibull(α[i], θ[j]), x);
        y[:, i, j, 2] .= cdf.(Weibull(α[i], θ[j]), x);
    end

    ## animation
    theme(:vibrant)
    indices = vcat(1:length(α), reverse(1:length(α)));
    
    anim = Animation()
    
    for i=indices
        p1 = plot(
            x, y[:, i, :, 1],
            legend=false,
            lw=3, ylims=(0, 4), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Density",
            title="Weibull(α, θ) - Probability density"
        )
        annotate!(median(x), 6-6/4, text(string.("α = ", α[i]), :black, :center, 12))
    
        p2 = plot(
            x, y[:, i, :, 2],
            legend=:outertopright, label = θ', legendtitle="θ",
            lw=3, ylims=(0, 2), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Probability",
            title="Weibull(α, θ) - Cumulative distribution"
        )

        plt = plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    return(anim)

end