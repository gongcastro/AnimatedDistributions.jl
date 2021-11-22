module AnimatedDistributions

using Random, Distributions, Plots, GR, ColorSchemes, PlotThemes

export animate_beta

include("animate_beta.jl")
include("save_animation.jl")

end # module
