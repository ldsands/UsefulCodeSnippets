# Julia Useful Commands and Code

Here is a collection of useful code that I've either found or made myself

## Julia code quirks

Most of these quirks are very useful so it is good to know about them.

- when creating a function if you put a `!` after the function name but before [the inputs the function will be able to change the inputs](https://docs.julialang.org/en/v1.3/manual/style-guide/#Append-!-to-names-of-functions-that-modify-their-arguments-1) otherwise they will be treated as immutable

## Path management

Path management can be a pain to figure out so I'm adding everything I've learned about path management in Julia here.

- `@__DIR__` and `dirname(@__FILE__)` both return an `AbstractString`
- the following for loop is kind of like globbing for files that end in a certain extension:

    ```Julia
    for f in filter(x -> endswith(x, "jl"), readdir())
        println(f)
    end
    ```

## Dataframe related code

- similar to the isin function in pandas where you filter a dataframe based on what is in another array or list of items

    ```Julia
    df[ [x in [3,4] for x in df[:A]] ,:]
    ```

## Random bits of useful code

- an easy way to time some function is to use the `@elapsed` macro, this will print the output in seconds that it took to run whatever you're evaluating
- this is a function that that installs all scripts in a list. If the package is already installed it will move on.

    ```Julia
    # this script installs all required packages to run this script
    package_list = ["DataFrames", "Gadfly", "JuliaFormatter", "Glob", "CodecZstd", "FileIO", "Arrow", "Feather", "ParquetFiles", "CSV"]
    using Pkg

    function installPackages!(package_list)
        println("Installation of required packages to run this script")
        Pkg.update()
        for package in package_list
            if ! in(package, keys(Pkg.installed())) Pkg.add(package) end
        end
        @warn("Packages installed!")
    end

    installPackages(package_list)
    ```

<!-- 
```Julia
home = "/home/me/"
if ! (joinpath(home, "GitHub", "Julia") in LOAD_PATH)
	for lib in readdir(joinpath(home, "GitHub"))
		push!(LOAD_PATH, joinpath(home, "GitHub", lib))
	end
end
```
test -->