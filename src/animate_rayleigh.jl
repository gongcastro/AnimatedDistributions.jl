"""
animate_rayleigh(x, σ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Rayleigh distribution, as implemented in Distributions.jl.

```julia
x = collect(0:0.01:5);
σ = collect(0.1:0.1:10);
animate_rayleigh(x, σ)
```

"""


function animate_rayleigh(x, σ, path = nothing) 

    y = zeros(length(x), length(σ), 2);

    for i = 1:length(σ)
        y[:, i, 1] .= pdf.(Rayleigh(σ[i]), x);
        y[:, i, 2] .= cdf.(Rayleigh(σ[i]), x);
    end

    ## animation
    indices = vcat(1:length(σ), reverse(1:length(σ)));
    
    anim = Animation()
    
    for i=indices
        p1 = Plots.plot(
            x, y[:, i, 1],
            legend=false,
            lw=3, ylims=(0, 3),
            xlabel="Sampling space", ylabel="Density",
            title="Rayleigh(σ, θ) - Probability density"
        )
        annotate!(median(x), 6-6/4, Plots.text(string.("σ = ", σ[i]), :black, :center, 12))
    
        p2 = Plots.plot(
            x, y[:, i, 2],
            legend=:outertopright, label = θ', legendtitle="θ",
            lw=3, ylims=(0, 1),
            xlabel="Sampling space", ylabel="Probability",
            title="Rayleigh(σ, θ) - Cumulative distribution"
        )

        plt = Plots.plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    println("Saving GIF...")
    gif(anim, path)

end