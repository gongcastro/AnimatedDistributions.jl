"""
    function animate_beta(x, α, β) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Beta dsitribution, as implemented in Distributions.jl.

```math
x = collect(0.01:0.01:0.99);
α = collect(0.1:0.2:10);
β = collect(0.1:0.5:10);
animate_beta(x, α, β)
```

"""


function animate_beta(x, α, β) 

    y = zeros(length(x), length(α), length(β), 2);

    for i = 1:length(α), j = 1:length(β)
        y[:, i, j, 1] .= pdf.(Beta(α[i], β[j]), x);
        y[:, i, j, 2] .= cdf.(Beta(α[i], β[j]), x);
    end

    ## animation
    theme(:vibrant)
    indices = vcat(1:length(α), reverse(1:length(α)));
    
    anim = Animation()
    
    for i=indices
        p1 = plot(
            x, y[:, i, :, 1],
            legend=false,
            lw=3, ylims=(0, 6), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Density",
            title="Beta(α, β) - Probability density"
        )
        annotate!(median(x), 6-6/4, text(string.("α = ", α[i]), :black, :center, 12))
    
        p2 = plot(
            x, y[:, i, :, 2],
            legend=:outertopright, label = β', legendtitle="β",
            lw=3, ylims=(0, 1), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Probability",
            title="Beta(α, β) - Cumulative distribution"
        )

        plt = plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    return(anim)

end