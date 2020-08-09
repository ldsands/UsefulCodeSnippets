# Useful Julia Packages

Just a list of packages with some basic descriptions and some code for packages that I use or have used in my Julia scripts.

[Here](https://github.com/JuliaRegistries/General) is where all of the packages are registered officially with the Julia organization. Also, there are other sites that can be used for looking at Julia packages some are curated and some are not. [JuliaPackages](https://juliapackages.com/), [Julia.jl](https://svaksha.github.io/Julia.jl/)

## Package List with Brief Description

- [Appveyor.jl](https://github.com/JuliaCI/Appveyor.jl) this is useful for testing especially if you're building packages
- [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) meant to make it easy to profile the time and memory usage of your Julia code overkill in most cases
- [CSV](https://github.com/JuliaData/CSV.jl) a package for dealing with csv files which I often use with DataFrames.jl
- [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl) the most popular data frame package in Julia
- [DataFramesMeta.jl](https://github.com/JuliaData/DataFramesMeta.jl) this is a collection of macros that make dealing with data frames easier
- [DataFramesMeta](https://github.com/JuliaData/DataFramesMeta.jl) a package for dealing with DataFrames created by DataFrames.jl
- [Distances.jl](https://github.com/JuliaStats/Distances.jl) a highly optimized vector distance evaluation package
- [FilePaths.jl](https://github.com/rofinn/FilePaths.jl) The package meant to help when dealing with files, directories and paths with other packages it uses [FilePathsBase.jl](https://github.com/rofinn/FilePathsBase.jl) for most of its code and there is where you can find the documentation.
- [FilePathsBase.jl](https://github.com/rofinn/FilePathsBase.jl) The package meant to help when dealing with files, directories and paths in an object oriented way
- [Franklin.jl](https://franklinjl.org/) a static site generator for Julia (the kind of website that blogs usually run on)
- [GLM.jl](https://github.com/JuliaStats/GLM.jl) this is the largest collection of linear models for Julia
- [Glob.jl](https://github.com/vtjnash/Glob.jl) a package used for globbing files or directories
- [IJulia.jl](https://github.com/JuliaLang/IJulia.jl) an interactive environment using the jupyter kernel
- [JuliaFormatter.jl](https://domluna.github.io/JuliaFormatter.jl/stable/) "An opinionated code formatter for Julia."
- [LightGraphs.jl](https://juliagraphs.org/LightGraphs.jl/stable/) "The project goal is to mirror the functionality of robust network and graph analysis libraries such as NetworkX while being simple" it has several extensions to help add other functionality
- [MultivariateStats.jl](https://github.com/JuliaStats/MultivariateStats.jl) this includes several stats models for processing, of note is PCA and factor analysis
- [NPZ.jl](https://github.com/fhs/NPZ.jl) this package enables the loading of numpy files (.npy and npz)
- [OhMyREPL.jl](https://github.com/KristofferC/OhMyREPL.jl) adds REPL syntax highlighting
- [Playground.jl](https://github.com/rofinn/Playground.jl) the virtual environment manager for Julia (right now it does not support Windows)
- [PyCall.jl](https://github.com/JuliaPy/PyCall.jl) used for calling python inside of Julia, this is very useful for things that have not yet been implemented in Julia (e.g. parquet writing)
- [Queryverse.jl](https://github.com/queryverse/Queryverse.jl) this is a collection of packages that help you handle data

## Package Examples and Detailed Descriptions

### Network Packages

Network analysis in Julia is pretty good as of Summer 2020. It is all done through LightGraphs.jl see below for more details about packages and commands. Also, LightGraphs [has been shown to be very fast too](https://www.timlrx.com/2020/05/10/benchmark-of-popular-graph-network-packages-v2/).

#### LightGraphs.jl Extension Packages

- For networking [LightGraphs.jl](https://juliagraphs.org/LightGraphs.jl/stable/) is the de facto Julia networking package standard. It also has several other packages that extend its functionality they are listed below.
    - [LightGraphsExtras.jl](https://github.com/JuliaGraphs/LightGraphsExtras.jl): extra functions for graph analysis.
    - [MetaGraphs.jl](https://github.com/JuliaGraphs/MetaGraphs.jl): graphs with associated meta-data.
    - [SimpleWeightedGraphs.jl](https://github.com/JuliaGraphs/SimpleWeightedGraphs.jl): weighted graphs.
    - [GraphIO.jl](https://github.com/JuliaGraphs/GraphIO.jl): tools for importing and exporting graph objects using common file types like edgelists, GraphML, Pajek NET, and more.
    - [GraphDataFrameBridge.jl](https://github.com/JuliaGraphs/GraphDataFrameBridge.jl): Tools for interoperability between DataFrame objects and LightGraphs and MetaGraphs objects
    - [GraphPlot.jl](https://github.com/JuliaGraphs/GraphPlot.jl) "Plotting and visualization of graphs (networks)"

#### Loading and Saving Graphs

- I use the [DOT (graph description language)](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) because it is usable by LightGraphs, igraph (in r), NetworkX (in python) and [gephi](https://gephi.org/). Note that the DOT format uses `.gv` as the default file extension.
- Here is an example of loading weighted undirected or directed graph from a csv and then saving it into a DOT file

    ```Julia
    # load the packages needed
    using CSV, DataFrames, GraphDataFrameBridge, GraphIO, MetaGraphs: savegraph, ParserCombinator
    # load csv file into DataFrame
    dta = DataFrame(CSV.File(edgelist_file))
    # create a undirected weighted graph usable by LightGraphs
    graph = MetaGraph(dta, :start, :end, weight = :Freq)
    # create a directed weighted graph usable by LightGraphs
    graph = MetaDiGraph(dta, :start, :end, weight = :Freq)
    # save to the Pajek NET Format
    savegraph(string(filename), graph, GraphIO.DOT.DOTFormat())
    ```

### Progress Monitoring

- I personally use ProgressMeter.jl for showing progression tracking on my for loops. I have an example below:

    ```Julia
    using ProgressMeter
    @showprogress "processing ..." for i in 1:50
        simple_function(i)
    end
    # example output
    processing ... 88%|█████████████████████████████████████████████████████████████████████████▏         |  ETA: 0:00:28
    ```

- Another option is [ProgressBars.jl](https://github.com/cloud-oak/ProgressBars.jl) but I couldn't get it to work with some kinds of arrays

### Multithreading/Processing

- To parallelize a for loop the easiest way is to use `Threads.@threads` it will use the number of threads that the Julia instance started with.
- If you need to add to an array or something similar than you need to make the array thread safe. [Here](https://discourse.julialang.org/t/safe-loop-with-push-multi-threading/41892) and [here](https://discourse.julialang.org/t/thread-safe-array-building/3275) are discussions of how to do that.
