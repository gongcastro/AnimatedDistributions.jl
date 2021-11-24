"""
    animate_frechet(x, α, θ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Frechet distribution, as implemented in Distributions.jl.

```jldoctest
x=collect(0:0.01:5);
α=collect(0.1:0.1:10);
θ=collect(0.5:0.25:5);
animate_frechet(x, α, θ)
```

"""


function animate_frechet(x, α, θ) 

    y = zeros(length(x), length(α), length(θ), 2);

    for i = 1:length(α), j = 1:length(θ)
        y[:, i, j, 1] .= pdf.(Frechet(α[i], θ[j]), x);
        y[:, i, j, 2] .= cdf.(Frechet(α[i], θ[j]), x);
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
            title="Frechet(α, θ) - Probability density"
        )
        annotate!(median(x), 6-6/4, text(string.("α = ", α[i]), :black, :center, 12))
    
        p2 = plot(
            x, y[:, i, :, 2],
            legend=:outertopright, label = θ', legendtitle="θ",
            lw=3, ylims=(0, 1), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Probability",
            title="Frechet(α, θ) - Cumulative distribution"
        )

        plt = plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    return(anim)

end