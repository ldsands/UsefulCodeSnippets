# Powershell and Cmd Prompt

Note that in almost every situation powershell is vastly superior to cmd prompt. Also, powershell core (or just powershell) is cross platform and can be used and linux mac or windows

If you're planning on executing powershell scripts you will probably want to run the following (otherwise nothing will run):

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Useful commands

### Powershell functions

Powershell functions can be very powerful and do pretty much anything you can think of a good place to start is to use them for the same type of functionality as doskey (see below for an example)

- Useful function of making getting to the home directory easier

    ```powershell
    function home {Set-Location -Path $Home}
    ```

- this will put powershell into admin mode by typing admin

    ```powershell
    function admin {Start-Process Powershell -Verb runAs}
    ```

- this will make it easy to activate python venv environments (you have to have changed the ExecutionPolicy as shown above)

    ```powershell
    function activate {
        param(
            [Parameter(Mandatory = $true)]
            [string]$env_name
        )
        cd "$Home\$env_name\Scripts"
        .\Activate.ps1
    }

    
    ```

### doskey macros (for cmd)

doskey is a macro system for command prompt. If you enter the correct code they can also be used in powershell (show below)

for example, on unix systems if you press `~` and enter then it brings you to the home directory. To replicate this on Windows enter the following (i use `home` instead of `~`):

    ```cmd
    doskey home=cd %homepath%
    ```
