push!(LOAD_PATH, "../src/")

using Documenter, AnimatedDistributions

makedocs(
    sitename = "AnimatedDistributions.jl",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true"
    ),
    modules = [AnimatedDistributions],
    pages = [
       "index.md",
        "animations.md",
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(;
    repo = "github.com/gongcastro/AnimatedDistributions.jl.git",
    target = "build"
)
