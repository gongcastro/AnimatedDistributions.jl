module AnimatedDistributions

using Random, Distributions, Plots, ColorSchemes, PlotThemes
import GR, Base.test

include("animate_beta.jl")
include("save_animation.jl")

end # module
