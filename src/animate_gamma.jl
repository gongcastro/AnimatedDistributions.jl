"""
    animate_gamma(x, α, θ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Gamma distribution, as implemented in Distributions.jl.

```julia
x = collect(0.1:0.01:4);
α = collect(0.1:0.1:5);
θ = collect(0.5:0.1:2);
animate_gamma(x, α, θ)
```

"""


function animate_gamma(x, α, θ, path = nothing) 

    y = zeros(length(x), length(α), length(θ), 2);

    for i = 1:length(α), j = 1:length(θ)
        y[:, i, j, 1] .= pdf.(Gamma(α[i], θ[j]), x);
        y[:, i, j, 2] .= cdf.(Gamma(α[i], θ[j]), x);
    end

    ## animation
    indices = vcat(1:length(α), reverse(1:length(α)));
    
    anim = Animation()
    
    for i=indices
        p1 = Plots.plot(
            x, y[:, i, :, 1],
            legend=false,
            lw=3, ylims=(0, 2),
            xlabel="Sampling space", ylabel="Density",
            title="Gamma(α, θ) - Probability density"
        )
        annotate!(median(x), 6-6/4, Plots.text(string.("α = ", α[i]), :black, :center, 12))
    
        p2 = Plots.plot(
            x, y[:, i, :, 2],
            legend=:outertopright, label = θ', legendtitle="θ",
            lw=3, ylims=(0, 2),
            xlabel="Sampling space", ylabel="Probability",
            title="Gamma(α, θ) - Cumulative distribution"
        )

        plt = Plots.plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    println("Saving GIF...")
    gif(anim, path)

end