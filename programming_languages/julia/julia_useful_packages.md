# Useful Julia Packages

Just a list of packages with some basic descriptions and some code for packages that I frequently use while writing in Julia.

- [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl)
    - this package is meant to make it easy to profile the time and memory usage of your Julia code.
    - it really is overkill for most things but given how much Julia focuses on speed they needed something that is overkill for most people
- [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl) the most popular data frame package in Julia
- [Appveyor.jl](https://github.com/JuliaCI/Appveyor.jl) this is useful for testing especially if you're building packages
- [Queryverse.jl](https://github.com/queryverse/Queryverse.jl) this is a collection of packages that help you handle data
- [DataFramesMeta.jl](https://github.com/JuliaData/DataFramesMeta.jl) this is a collection of macros that make dealing with data frames easier
- [PyCall.jl](https://github.com/JuliaPy/PyCall.jl) used for calling python inside of Julia, this is very useful for things that have not yet been implemented in Julia (e.g. parquet writing)
- [GLM.jl](https://github.com/JuliaStats/GLM.jl) this is the largest collection of linear models for Julia
- [MultivariateStats.jl](https://github.com/JuliaStats/MultivariateStats.jl) this includes several stats models for processing, of note is PCA and factor analysis
- [Playgorund.jl](https://github.com/rofinn/Playground.jl) the virtual environment manager for Julia (right now it does not support Windows)