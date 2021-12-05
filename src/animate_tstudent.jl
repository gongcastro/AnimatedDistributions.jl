"""
    animate_tstudent(x, ν) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Student's t distribution, as implemented in Distributions.jl.

```julia
x = collect(-4:0.01:4);
ν = collect(0.5:0.1:5); # letter "nu", not "v"
animate_tstudent(x, ν)
```

"""


function animate_tstudent(x, ν, path = nothing) 

    y = zeros(length(x), length(ν), 2);

    for i = 1:length(ν) 
        y[:, i, 1] .= pdf.(TDist(ν[i]), x);
        y[:, i, 2] .= cdf.(TDist(ν[i]), x);
    end

    ## animation
    indices = vcat(1:length(ν), reverse(1:length(ν)));
    
    anim = Animation()
    
    for i=indices
        p1 = Plots.plot(
            x, y[:, i, 1],
            legend=false,
            lw=3, ylims=(0, 0.6),
            xlabel="Sampling space", ylabel="Density",
            title="Student's t(ν) - Probability density"
        )

        annotate!(median(x), 6-6/4, Plots.text(string.("ν = ", ν[i]), :black, :center, 12))

        p2 = Plots.plot(
            x, y[:, i, 2],
            legend=:outertopright, label = ν', legendtitle="ν",
            lw=3, ylims=(0, 1),
            xlabel="Sampling space", ylabel="Probability",
            title="Student's (ν) - Cumulative distribution"
        )

        plt = Plots.plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    println("Saving GIF...")
    gif(anim, path)

end