"""
animate_semicircle(x, R) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Semi-circle distribution, as implemented in Distributions.jl.

```julia
x=collect(-10:0.05:10);
R=collect(0.1:0.1:10);
animate_semicircle(x, R)
```

"""


function animate_semicircle(x, R) 

    y = zeros(length(x), length(R), 2);

    for i = 1:length(R)
        y[:, i, 1] .= pdf.(Semicircle(R[i]), x);
        y[:, i, 2] .= cdf.(Semicircle(R[i]), x);
    end

    ## animation
    theme(:vibrant)
    indices = vcat(1:length(R), reverse(1:length(R)));
    
    anim = Animation()
    
    for i=indices
        p1 = plot(
            x, y[:, i, 1],
            legend=false,
            lw=3, ylims=(0, 3), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Density",
            title="Semi-circle(R) - Probability density"
        )
        annotate!(median(x), 6-6/4, text(string.("R = ", R[i]), :black, :center, 12))
    
        p2 = plot(
            x, y[:, i, 2],
            legend=:outertopright, label = R', legendtitle="R",
            lw=3, ylims=(0, 1), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Probability",
            title="Semi-circle(R) - Cumulative distribution"
        )

        plt = plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    return(anim)

end