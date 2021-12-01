push!(LOAD_PATH, "../src/")

using Documenter, AnimatedDistributions

makedocs(
    sitename = "AnimatedDistributions",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true"
    ),
    modules = [AnimatedDistributions],
    pages = [
       "index.md",
       "animations.md",
       "animate_beta.md",
       "animate_normal.md",
       "animate_cauchy.md",
       "animate_tstudent.md",
       "animate_exponential.md",
       "animate_frechet.md",
       "animate_gamma.md",
       "animate_invgamma.md",
       "animate_weibull.md",
       "animate_semicircle.md",
       "animate_rayleigh.md",
       "animate_pareto.md",
       "animate_triweight.md",
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/gongcastro/AnimatedDistributions.jl.git",
    devbranch = "main"
)
