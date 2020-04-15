# Useful Julia Packages

Just a list of packages with some basic descriptions and some code for packages that I frequently use while writing in Julia.

[Here](https://github.com/JuliaRegistries/General) is where all of the packages are registered officially with the Julia organization

- [Appveyor.jl](https://github.com/JuliaCI/Appveyor.jl) this is useful for testing especially if you're building packages
- [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl)
    - this package is meant to make it easy to profile the time and memory usage of your Julia code.
    - it really is overkill for most things but given how much Julia focuses on speed they needed something that is overkill for most people
- [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl) the most popular data frame package in Julia
- [DataFramesMeta.jl](https://github.com/JuliaData/DataFramesMeta.jl) this is a collection of macros that make dealing with data frames easier
- [Franklin.jl](https://franklinjl.org/) a static site generator for Julia (the kind of website that blogs usually run on)
- [FilePaths.jl](https://github.com/rofinn/FilePaths.jl) The package meant to help when dealing with files, directories and paths
- [GLM.jl](https://github.com/JuliaStats/GLM.jl) this is the largest collection of linear models for Julia
- [Glob.jl](https://github.com/vtjnash/Glob.jl) a package used for globbing files or directories
- [IJulia.jl](https://github.com/JuliaLang/IJulia.jl) an interactive environment using the jupyter kernel
- [MultivariateStats.jl](https://github.com/JuliaStats/MultivariateStats.jl) this includes several stats models for processing, of note is PCA and factor analysis
- [OhMyREPL.jl](https://github.com/KristofferC/OhMyREPL.jl) adds REPL syntax highlighting
- [Playground.jl](https://github.com/rofinn/Playground.jl) the virtual environment manager for Julia (right now it does not support Windows)
- [PyCall.jl](https://github.com/JuliaPy/PyCall.jl) used for calling python inside of Julia, this is very useful for things that have not yet been implemented in Julia (e.g. parquet writing)
- [Queryverse.jl](https://github.com/queryverse/Queryverse.jl) this is a collection of packages that help you handle data
