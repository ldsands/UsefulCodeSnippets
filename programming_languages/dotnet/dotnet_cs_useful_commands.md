# dotnet Useful Commands

## Timing Code

Although this isn't super accurate this is more than enough to get a good estimate of how fast your code it. The output is in a hour minute second format (00:00:10).

```c#
var watch = System.Diagnostics.Stopwatch.StartNew();
// Place code to execute here
watch.Stop();
TimeSpan et = watch.Elapsed;
string elapsed_time = String.Format("{0:00}:{1:00}:{2:00}",
et.Hours, et.Minutes, et.Seconds);
Console.WriteLine("All Done " + elapsed_time);
```

## Get script file location

If you're using a c# script file (.csx) then adding these lines will allow you to call either the folder (second line) or the script (third line) path for use in later code. The fourth and fifth lines print out the folder and script paths respectively. Note: the first line compiles the methods in a script file so it will work

```c#
using System.Runtime.CompilerServices;
public static string GetScriptFolder([CallerFilePath] string path = null) => Path.GetDirectoryName(path);
public static string GetScriptPath([CallerFilePath] string path = null) => path;

Console.WriteLine($"Full path to .csx source folder using the other method {GetScriptFolder()}");
Console.WriteLine($"Full path to .csx source file using the other method {GetScriptPath()}");
```