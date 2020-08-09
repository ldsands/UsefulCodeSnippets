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

- I find it very common to put a script in a folder and want to have the program "search" for a folder in parent folders until that folder is found. This is how I do that in a function.

    ```Julia
    using FilePathsBase
    using Glob

    function find_edgelist_files(target_folder)
        """finds the directory with all of the edgelist files"""
        path = Path(dirname(@__FILE__))
        n = 0
        while true
            listDirs = [path_1 for path_1 in readdir(path) if isdir(path)]
            listDirsStem = [string(basename(path_1)) for path_1 in readdir(path) if isdir(path)]
            if target_folder in listDirsStem
                path = path / target_folder
                files = glob("*.csv", string(path))
                # break
                return files, path
            else
                path = parent(path)
            end
        end
    end

    target_folder = "author_subreddit_edgelists"
    find_edgelist_files(target_folder)
    ```

## Dataframe related code

- similar to the isin function in pandas where you filter a dataframe based on what is in another array or list of items

    ```Julia
    df[ [x in [3,4] for x in df[:A]] ,:]
    ```

## Random bits of useful code

- an easy way to time some function is to use the `@elapsed` macro, this will print the output in seconds that it took to run whatever you're evaluating

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