# dotnet Installation and Overview

Note that I will only be using dotnet standard and I will never be using dotnet framework

## Installation

For now just see the [chocolatey](../../other_software/windows_program_instructions/chocolatey.md) page for more details.

## Use Cases

c# on dotnet can do pretty much anything you can imagine. I is usually a bit slower than c or c++ but not by much at all. I use it at the moment for doing things that I would do in python but they take too long there.

## Docker installation

`docker pull mcr.microsoft.com/dotnet/core/sdk` (for preview `docker pull mcr.microsoft.com/dotnet/core-nightly/sdk`)

## dotnet Tools

- There are many different tools that you can use in dotnet to get various things done. For example instead of downloading and installing [powershell independently it can be installed from the dotnetcore-sdk as a global tool](https://www.hanselman.com/blog/InstallingPowerShellWithOneLineAsANETCoreGlobalTool.aspx). Below is the code needed to do this.

```PowerShell
dotnet tool install --global PowerShell
# you can use -g rather than --global if you want
```

- Another global tool that is very useful is the paket package. It is like conda in python in that it manages dependencies much better than nuget. [It can also be deployed in just scripts](https://fsprojects.github.io/Paket/reference-from-repl.html) for minimal project setup.
    - IMPORTANT NOTE: they have some bugs with this so you should install this using chocolatey instead of dotnet tools for now

```PowerShell
dotnet tool install --global Paket
```

- This is a different compiler for fsx scripts. It works well but is a bit complicated to implement at first. First you must enter the following code into PowerShell. The third line will create all of the files needed to execute your script file.

    ```PowerShell
    dotnet tool install fake-cli -g
    dotnet new -i "fake-template::*"

    dotnet new fake
    ```


- This is similar to paket but much simpler and only uses nuget. This is very useful for scipts as well. (Note: this is very new and not ready for primetime yet)

    ```PowerShell
    dotnet tool install -g dotnet-grab
    ```

- Here are all of the global tools that I usually install put into one code block:

```PowerShell
dotnet tool install --global Paket
dotnet tool install -g fantomas-tool
dotnet tool install --global PowerShell
dotnet tool install -g Microsoft.dotnet-interactive # for working with dotnet interactive which is jupyter for dotnet
dotnet interactive jupyter install # for working with dotnet interactive which is jupyter for dotnet
dotnet tool install -g dotnet-grab # allows for getting packages without setting up a project file
```

## Creating a simple console application

Creating a console app is very simple but it gets pretty complicated thereafter. First you navigate to the folder you want to 

## [Using c# as a script](https://github.com/filipw/dotnet-script/blob/master/README.md)

### Installation and running first script

-To allow for use of a simple c# file as a script run the following command in the dotnet CLI (this is needed because without it c# projects have to be compiled).
    - you can also install through chocolatey for windows

```PowerShell
dotnet tool install -g dotnet-script
```

-Then you have to navigate to whatever folder in which you want to contain your project and enter the following lines code
    - the first line of code create a script project which is very barebones
        - if you want to change the name of the script to something else use this code instead `dotnet script init custom.csx` this will make the script name custom.csx not main .csx
    - the second line will run the script

```PowerShell
dotnet script init
dotnet script main.csx
```

## Packages

dotnet uses nuget as its package manager below is an example of downloading a nuget package. This is very easy in [Visual Studio](https://visualstudio.microsoft.com/vs/) however I have no desire to leave VSCode so it is a bit more complicated.

to see all of the packages that are installed

```PowerShell

```

## Publishing executables

There are several options that you can use to try and get the number of your files down. Most of this is taken from [this blog](https://www.hanselman.com/blog/MakingATinyNETCore30EntirelySelfcontainedSingleExecutable.aspx) and [this blog](https://blog.magnusmontindotnet/2019/09/22/single-file-exes-in-net-core/).

Once you have created a console application and you're happy with it you can publish it into a executable. This is something that you can double click and it'll run the code in there. This is the way that you can easily give you code to anyone and have them run it. I've added additional options to try and cut down on both the size of the executable and the number of files that accompany it. If you follow these instructions you should be able to create a console app that only takes about 26 megabytes of space and will only consist of one file.

First you have to have the following code in the .csproj file

```PowerShell
<Project Sdk="Microsoftdotnet.Sdk">
    <PropertyGroup>
        <OutputType>Exe</OutputType>
        <TargetFramework>netcoreapp3.1</TargetFramework>
        <PublishTrimmed>true</PublishTrimmed>
        <PublishReadyToRun>true</PublishReadyToRun>
        <PublishSingleFile>true</PublishSingleFile>
        <RuntimeIdentifier>win-x64</RuntimeIdentifier>
        <DebugType>None</DebugType>
    </PropertyGroup>

    <ItemGroup>
      <TrimmerRootAssembly Include="System.IO.FileSystem" />
    </ItemGroup>
</Project>
```

This does a few things but most of them is to remove files that will have to accompany the executable.

For reference here is the application I'm publishing here. All it does is print out the file location for the executable you can move this around and it will always print out its current location you then have to press a key for the console to close.

```c#
using System;
using System.Runtime.CompilerServices;
using System.Threading;
using System.IO;

namespace file_management
{
    class Program
    {
        static void Main(string[] args)
        {
            string file_loc = System.Reflection.Assembly.GetExecutingAssembly().Location;
            string home_dir = Path.GetDirectoryName(file_loc);
            Console.WriteLine($"Location - {home_dir}");
            Console.ReadKey();
        }
    }
}
```

You then run this code (again when your terminal is in the desired folder)

```PowerShell
dotnet publish -r win-x64 --self-contained true
```

You can then delete a lot of the extra files needed for debugging and creating the executable by entering the code below:

```PowerShell
dotnet clean
```
