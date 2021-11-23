push!(LOAD_PATH, "../src/")

using Documenter, AnimatedDistributions

makedocs(
    sitename = "AnimatedDistributions",
    format = Documenter.HTML(),
    modules = [AnimatedDistributions],
    pages = [
        "index.md",
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/gongcastro/AnimatedDistributions.jl",
    push_preview=true,
)
