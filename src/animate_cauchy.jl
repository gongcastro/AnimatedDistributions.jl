"""
    animate_cauchy(x, μ, σ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Cauchy distribution, as implemented in Distributions.jl.

```julia
x = collect(-4:0.01:4);
μ = collect(-4:1:4);
σ = collect(1:0.1:8);
animate_cauchy(x, μ, σ)
```

"""


function animate_cauchy(x, μ, σ, path = nothing) 

    y = zeros(length(x), length(μ), length(σ), 2);

    for i = 1:length(μ), j = 1:length(σ)
        y[:, i, j, 1] .= pdf.(Cauchy(μ[i], σ[j]), x);
        y[:, i, j, 2] .= cdf.(Cauchy(μ[i], σ[j]), x);
    end

    ## animation
    indices = vcat(1:length(μ), reverse(1:length(μ)));
    
    anim = Animation()
    
    for i=indices
        p1 = Plots.plot(
            x, y[:, i, :, 1],
            lw=3, ylims=(0, 0.3),
            legend=false,
            xlabel="Sampling space", ylabel="Density",
            title="Cauchy(μ, σ) - Probability density"
        )
        annotate!(median(x), 6-6/4, Plots.text(string.("μ = ", μ[i]), :black, :center, 12))
    
        p2 = Plots.plot(
            x, y[:, :, i, 2],
            legend=:outertopright, label = μ', legendtitle="μ",
            lw=3, ylims=(0, 1),
            xlabel="Sampling space", ylabel="Probability",
            title="Cauchy(μ, σ) - Cumulative distribution"
        )

        plt = Plots.plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    println("Saving GIF...")
    gif(anim, path)

end
