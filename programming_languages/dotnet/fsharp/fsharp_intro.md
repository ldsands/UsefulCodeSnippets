# Fsharp Overview and Installation

## Resources

- [Getting started with a fsharp project in VS Code](https://atlemann.github.io/fsharp/2018/02/28/fsharp-solutions-from-scratch.html) has several instructions about how to get a F# project started in VS Code
- [F# for fun and profit](https://fsharpforfunandprofit.com/) is kind of the defacto staring place for most people picking up F#

## Installation

- You should install paket if you want to download any nuget packages, to do so enter the following code:

    ```PowerShell
    dotnet tool install --global Paket
    ```

- For code formatting you should also install the following (it is included in Ionide though so I don't download it myself):

    ```PowerShell
    dotnet tool install -g fantomas-tool
    ```

## Getting a script going

I'm not going to lie this was a major pain in the ass to figure out. It will all be much easier when dotnet 5.0 comes out in Nov of 2020. Below are the steps I used to get workable scripts in Fsharp working on Windows.

- I have been trying to figure out what I need to get packages into a fsharp script. These are the steps I took to get it working like I wanted.
    - First you have to initialize all of the files you'll need to enter the code below into PowerShell once you've navigated to your desired folder in your terminal
        - This code first creates a new console application in fsharp in the src folder
        - It then adds a ".paket" folder which will be used by paket for storing files important for package management
        - It then adds a gitignore file to the home folder
        - It then navigates to the src folder where the code is located
        - It then creates a script file and adds a few lines to it as a starting point
        - The next 4 lines install the rest of the paket package management files needed to handle packages
    - Then to add packages to the dependency file so that you can install packages you want to use in your script or project
        - Inside the `@"` code block adds to the end of hte dependency file the packages you want to install
            - Note: the framework: auto-detect will make it so that only your current dotnet version is supported
            - You can specify the version number by doing one of the following instead of what is below
                - `nuget FSharp.Data ~> 3.3.3`
                - `nuget FSharp.Data >= 3.0`
            - If you want to add a file from github add the following (substituting your target file):
                - `github forki/FsUnit FsUnit.fs`
            - If you want to add a file from a github gist add the following (substituting your target file):
                - `gist Thorium/1972349 timestamp.fs`
            - If you want to add a file from a website (must only be that file displayed) add the following (substituting your target file):
                - `http http://www.fssnip.net/1n decrypt.fs`
    - Next is some code that installs packages and puts the final touches on the paket setup
        - The first line installs all of the dependencies needed for your packages (if it worked you should see a paket.lock file show up)
        - The next line will see if you have any outdated packages
        - The next line will update all outdated packages

        ```PowerShell
        paket install
        paket outdated
        paket update
        paket restore
        ```

    - Finally i'm including a few commands that will rebuild all of the package files if you use `dotnet clean` or clone a repository since so many of those files do not need to be synced
        - The restore command will also call the `paket restore` command and download all of the package files that you need
    - There are a few additional options that I'm also including here as well
        - The fist is another option to add another package without having to manually modify the paket.dependencies file (`--version` is not needed)
            - SIDE: you might need to explicitly add this to your project

        ```PowerShell
        dotnet paket add Sylvester.DataFrame --version 0.1.7
        ```

    - Here is all of that code discussed above in one place (except the optional stuff)

    ```PowerShell
    dotnet new console -lang f# -o src
    New-Item -Path ".paket"  -ItemType Directory
    dotnet new gitignore
    cd src
    New-Item FSharpScript.fsx -ItemType file

    $FSharpInteractiveHeader = @"
    open Microsoft.Data.Analysis

    let dateTimes = PrimitiveDataFrameColumn<DateTime>("DateTimes") // Default length is 0.
    let ints = PrimitiveDataFrameColumn<int>("Ints", int64 3) // Makes a column of Length 3. Filles with nulls initially.
    let strings = StringDataFrameColumn("Strings", int64 3)

    dateTimes.Append(Nullable<DateTime>(DateTime.Parse("2019/01/01")))
    dateTimes.Append(Nullable<DateTime>(DateTime.Parse("2019/01/01")))
    dateTimes.Append(Nullable<DateTime>(DateTime.Parse("2019/01/02")))

    let cols = [dateTimes :> DataFrameColumn; ints :> DataFrameColumn; strings :> DataFrameColumn]
    let df = DataFrame(cols)

    df
    "@

    Set-Content -Path FSharpScript.fsx -Value $FSharpInteractiveHeader

    paket.exe init

    .paket/paket.exe add FSharp.Data --project src
    .paket/paket.exe add FSharp.Charting --project src
    .paket/paket.exe add Microsoft.data.Analysis --project src

    .paket/paket.exe install
    .paket/paket.exe update

    dotnet restore
    ```