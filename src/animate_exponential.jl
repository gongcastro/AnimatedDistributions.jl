"""
animate_exponential(x, θ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Exponential distribution, as implemented in Distributions.jl.

```jldoctest
x = collect(0:0.01:10);
θ = collect(0.5:0.1:8);
animate_exponential(x, θ)
```

"""


function animate_exponential(x, θ, path = nothing) 

    y = zeros(length(x), length(θ), 2);

    for i = 1:length(θ)
        y[:, i, 1] .= pdf.(Exponential(θ[i]), x);
        y[:, i, 2] .= cdf.(Exponential(θ[i]), x);
    end

    ## animation
    indices = vcat(1:length(θ), reverse(1:length(θ)));
    
    anim = Animation()
    
    for i=indices
        p1 = Plots.plot(
            x, y[:, i, 1],
            legend=false,
            lw=3, ylims=(0, 3),
            xlabel="Sampling space", ylabel="Density",
            title="Exponential(θ) - Probability density"
        )
        annotate!(median(x), 6-6/4, Plots.text(string.("θ = ", θ[i]), :black, :center, 12))
    
        p2 = Plots.plot(
            x, y[:, i, 2],
            legend=:outertopright, label = θ', legendtitle="θ",
            lw=3, ylims=(0, 1),
            xlabel="Sampling space", ylabel="Probability",
            title="Exponential(θ) - Cumulative distribution"
        )

        plt = Plots.plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    println("Saving GIF...")
    gif(anim, path)

end