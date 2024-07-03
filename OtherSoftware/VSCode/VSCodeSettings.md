# VS Code Settings

There are many settings that I would like to remember and may be useful to others. There are two main types there are user settings, and keyboard settings. Both of these types of settings can be that can be workspace specific and override the global settings.

I will document some of these settings here.

## Keyboard Settings (with Their Explanations)

- This shortcut uses the search editor but only searches the local file searched. [Here](https://github.com/microsoft/vscode/issues/92298#issuecomment-625555240) is some context

```JSON
    {
        "key": "ctrl+shift+f+g",
        "command": "search.action.openNewEditor",
        "args": {
            "filesToInclude": "${relativeFile}"
        },
        "when": "editorTextFocus"
    }
```

## My Settings (with Their Explanations)

Some of the settings I use in VS Code with short explanations

- These are the settings that i use when I use the minimap (which isn't very often to be honest). I do enable it for markdown documents however. I've found the minimap to be very useful in very long documents but I don't use it terribly often in other documents or when I'm programming. There is a toggle minimap command that you can add a keyboard shortcut to if you want to turn it on and off often. also contained here are the rest of my markdown language settings.

    ```JSON
    {
        "[markdown]": {
            "editor.defaultFormatter": "yzhang.markdown-all-in-one",
            "editor.formatOnSave": false,
            "editor.minimap.enabled": true,
            "editor.quickSuggestions": {
                "comments": true,
                "other": true,
                "strings": true
            },
            "editor.wordWrap": "on"
        },
    }
    ```

- Font settings: I use these two fonts. I usually use Fira code but occasionally I like to mix it up so I switch to Cascadia Code. I install both of these using Chocolatey the command to install both is as follows: `choco install firacodenf cascadia-code-nerd-font -y`

    ```JSON
    {
        "editor.fontFamily": "FiraCode NF",
        "editor.fontFamily": "CaskaydiaCove NF",
        "editor.fontFamily": "Cascadia Code NF",
    }
    ```
