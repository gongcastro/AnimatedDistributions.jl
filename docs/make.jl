push!(LOAD_PATH, "../src/")

using Documenter, AnimatedDistributions

makedocs(
    sitename = "AnimatedDistributions",
    format = Documenter.HTML(),
    modules = [AnimatedDistributions],
    pages = Any[
        "Introduction"     => "index.md",
        "Animations"       => "animations.md",
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/gongcastro/AnimatedDistributions.jl",
    target = "build",
    push_preview=true,
)
