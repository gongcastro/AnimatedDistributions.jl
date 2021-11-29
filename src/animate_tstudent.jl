"""
    animate_tstudent(x, ν) 

This function generates an animation depicting the probability density and the cumulative
    probability functions of the Student's t distribution, as implemented in Distributions.jl.

```jldoctest
x=collect(-4:0.01:4);
ν=collect(0.5:0.1:5); # letter "nu", not "v"
animate_tstudent(x, ν)
```

"""


function animate_tstudent(x, ν) 

    y = zeros(length(x), length(ν), 2);

    for i = 1:length(ν)
        y[:, i, 1] .= pdf.(TDist(ν[i]), x);
        y[:, i, 2] .= cdf.(TDist(ν[i]), x);
    end

    ## animation
    theme(:vibrant)
    indices = vcat(1:length(ν), reverse(1:length(ν)));
    
    anim = Animation()
    
    for i=indices
        p1 = plot(
            x, y[:, i, 1],
            legend=false,
            lw=3, ylims=(0, 0.6), palette=:RdYlBu_10,
            xlabel="Sampling space", ylabel="Density",
            title="Student's t(ν) - Probability density"
        )
    
        p2 = plot(
            x, y[:, i, 2],
            legend=:outeνropright, label = ν', legendtitle="ν",
            lw=3, ylims=(0, 1), palette=:νdYlBu_10,
            xlabel="Sampling space", ylabel="Probability",
            title="Student's (ν) - Cumulative distribution"
        )

        plt = plot(p1, p2, size=(1000, 500))
        
        frame(anim, plt)
    end

    return(anim)

end