"""
    animate_triweight(x, μ, σ) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Normal distribution, as implemented in Distributions.jl.

```julia
x = collect(-5:0.01:5);
μ = collect(-4:0.5:4);
σ = collect(0.5:0.1:10);
animate_triweight(x, μ, σ)
```

"""


function animate_triweight(x, μ, σ, path = nothing) 

    y = zeros(length(x), length(μ), length(σ), 2);

    for i = 1:length(μ), j = 1:length(σ)
        y[:, i, j, 1] .= pdf.(Triweight(μ[i], σ[j]), x);
        y[:, i, j, 2] .= cdf.(Triweight(μ[i], σ[j]), x);
    end

    ## animation
    indices = vcat(1:length(μ), reverse(1:length(μ)));
    
    anim = Animation()
    
    for i=indices
        p1 = Plots.plot(
            x, y[:, i, :, 1],
            legend=false,
            lw=3, ylims=(0, 2),
            xlabel="Sampling space", ylabel="Density",
            title="Tri-weight(μ, σ) - Probability density"
        )
        annotate!(median(x), 6-6/4, Plots.text(string.("μ = ", μ[i]), :black, :center, 12))
    
        p2 = Plots.plot(
            x, y[:, i, :, 2],
            legend=:outertopright, label = σ', legendtitle="σ",
            lw=3, ylims=(0, 1),
            xlabel="Sampling space", ylabel="Probability",
            title="Tri-weight(μ, σ) - Cumulative distribution"
        )

        plt = Plots.plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    println("Saving GIF...")
    gif(anim, path)

end