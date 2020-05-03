# Visual Studio Code

All of my VSCode information that I use

- [Visual Studio Code](#visual-studio-code)
    - [Resources](#resources)
    - [Useful shortcuts (Windows)](#useful-shortcuts-windows)
        - [Useful VSCode shortcuts (Windows)](#useful-vscode-shortcuts-windows)
        - [Other Useful (Windows)](#other-useful-windows)
    - [Code Snippets](#code-snippets)
    - [Installed extensions](#installed-extensions)
        - [Categories of Extensions](#categories-of-extensions)
            - [C# and dotnet Extensions](#c-and-dotnet-extensions)
            - [General Extensions](#general-extensions)
                - [Editing Help Extensions](#editing-help-extensions)
                - [Navigation Extensions](#navigation-extensions)
                - [Utility Extensions](#utility-extensions)
                - [Visual Help Extensions](#visual-help-extensions)
            - [HTML Extensions](#html-extensions)
            - [Markdown Extensions](#markdown-extensions)
            - [Other Language Extensions](#other-language-extensions)
            - [Python Extensions](#python-extensions)
            - [R Extensions](#r-extensions)
            - [Themes](#themes)
        - [Full list](#full-list)
    - [Settings (with their explanations)](#settings-with-their-explanations)
    - [Extension Authoring](#extension-authoring)
        - [Publishing Instructions](#publishing-instructions)

## Resources

- [Windows Cheat-Sheet](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf) [PDF]
- [Official Documentation Site](https://code.visualstudio.com/docs)
- [Old Documentation Site](https://vscode-docs.readthedocs.io/en/latest/)
    - This site does have some items that are not on the official documentation site but overall the official documentation site is better
- [Updates Page](https://code.visualstudio.com/updates/)
- [Snippet Generator](https://snippet-generator.app/?description=&tabtrigger=&snippet=&mode=vscode)
- [Extension API Documentation](https://code.visualstudio.com/api/references/vscode-api)
- [Keybindings Page](https://code.visualstudio.com/docs/getstarted/keybindings)

## Useful shortcuts (Windows)

### Useful VSCode shortcuts (Windows)

VSCode shortcuts that are not associated with any extensions

Some of these shortcuts have been modified by me and I use them with settings sync to make them consistent across computers

| Shortcut I Use                  | Description                                 | Original Shortcut         | Command                                 |
| ------------------------------- | ------------------------------------------- | ------------------------- | --------------------------------------- |
| `Alt`+`Z`                       | Toggle word wrap                            | N/A                       | TODO:                                   |
| `Ctrl`+`,`                      | User Settings                               | N/A                       | TODO:                                   |
| `Ctrl`+`/`                      | Comment line or selection                   | N/A                       | TODO:                                   |
| `Ctrl`+`K` `Ctrl`+`S`           | Keyboard Shortcuts                          | N/A                       | TODO:                                   |
| `Ctrl`+`R`                      | Switch workspace                            | N/A                       | TODO:                                   |
| `Alt`+`Z`                       | Toggle word wrap                            | N/A                       | TODO:                                   |
| `Ctrl`+`T`                      | Show all Symbols                            | N/A                       | TODO:                                   |
| `Ctrl`+`G`                      | Go to Line...                               | N/A                       | TODO:                                   |
| `Ctrl`+`P`                      | Go to File...                               | N/A                       | TODO:                                   |
| `F8`                            | Go to next error or warning                 | N/A                       | TODO:                                   |
| `Shift`+`F8`                    | Go to previous error or warning             | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`Tab`            | Navigate editor group history               | N/A                       | TODO:                                   |
| `Alt`+ `←`/`→`                  | Go back / forward                           | N/A                       | TODO:                                   |
| `Shift`+`Alt`+`I`               | Insert cursor at end of each line selected  | N/A                       | TODO:                                   |
| `Ctrl`+`I`                      | Select current line                         | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`L`              | Select all occurrences of current selection | N/A                       | TODO:                                   |
| `Ctrl`+`F2`                     | Select all occurrences of current word      | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`Space`          | Trigger parameter hints                     | N/A                       | TODO:                                   |
| `Shift`+`Alt`+`F`               | Format document                             | N/A                       | TODO:                                   |
| `Ctrl`+`K` `Ctrl`+`F`           | Format selection                            | N/A                       | TODO:                                   |
| `F12`                           | Go to Definition                            | N/A                       | TODO:                                   |
| `Alt`+`F12`                     | Peek Definition                             | N/A                       | TODO:                                   |
| `F2`                            | Rename Symbol                               | N/A                       | TODO:                                   |
| `Ctrl`+`K` `Ctrl`+`X`           | Trim trailing whitespace                    | N/A                       | TODO:                                   |
| `Ctrl`+`K` `R`                  | Reveal active file in Explorer              | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`H`              | Replace in files                            | N/A                       | TODO:                                   |
| `Ctrl`+`K` `Z`                  | Zen Mode (`Esc` `Esc` to exit)              | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`V`              | Open Markdown preview to the side           | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`F`              | Open search sidebar                         | N/A                       | TODO:                                   |
| `Ctrl`+`R`                      | Switch workspace                            | N/A                       | TODO:                                   |
| `Ctrl`+`Tab`                    | Switch tabs                                 | N/A                       | TODO:                                   |
| `Shift`+`Alt`+`I`               | Insert cursor at end of each line selected  | N/A                       | TODO:                                   |
| `Ctrl`+`L`                      | Select current line                         | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`L`              | Select all occurrences of current selection | N/A                       | TODO:                                   |
| `Ctrl`+`K`+`R`                  | Reveal active file in Explorer              | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`H`              | Replace in files                            | N/A                       | TODO:                                   |
| `Ctrl`+`K`+`V`                  | Open Markdown preview to the side           | N/A                       | TODO:                                   |
| `Shift`+`Alt`+`R`               | Reveal in file explorer                     | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`E`              | View Show Explorer                          | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`C`              | Open external terminal                      | N/A                       | TODO:                                   |
| `Ctrl`+`Shift`+`O`              | Goes to the Outline View                    | None originally assigned  | TODO:                                   |
| `alt`+`space` `ctrl`+`up`       | changes focus to editor located up          | `ctrl`+`k` `ctrl`+`up`    | workbench.action.focusAboveGroup        |
| `alt`+`space` `ctrl`+`down`     | changes focus to editor located down        | `ctrl`+`k` `ctrl`+`down`  | workbench.action.focusBelowGroup        |
| `alt`+`space` `ctrl`+`left`     | changes focus to editor located left        | `ctrl`+`k` `ctrl`+`left`  | workbench.action.focusLeftGroup         |
| `alt`+`space` `ctrl`+`right`    | changes focus to editor located right       | `ctrl`+`k` `ctrl`+`right` | workbench.action.focusRightGroup        |
| `shift`+`space` `shift`+`up`    | move current editor to editor group up      | None originally assigned  | workbench.action.moveEditorToAboveGroup |
| `shift`+`space` `shift`+`down`  | move current editor to editor group down    | None originally assigned  | workbench.action.moveEditorToBelowGroup |
| `shift`+`space` `shift`+`left`  | move current editor to editor group left    | None originally assigned  | workbench.action.moveEditorToLeftGroup  |
| `shift`+`space` `shift`+`right` | move current editor to editor group right   | None originally assigned  | workbench.action.moveEditorToRightGroup |
| `ctrl`+`space` `ctrl`+`down`    | split current editor up                     | None originally assigned  | workbench.action.splitEditorDown        |
| `ctrl`+`space` `ctrl`+`left`    | split current editor down                   | None originally assigned  | workbench.action.splitEditorLeft        |
| `ctrl`+`space` `ctrl`+`right`   | split current editor left                   | None originally assigned  | workbench.action.splitEditorRight       |
| `ctrl`+`space` `ctrl`+`up`      | split current editor right                  | None originally assigned  | workbench.action.splitEditorUp          |

### Other Useful (Windows)

VSCode shortcuts that are not associated with any extensions. Some of these shortcuts have been modified by me and I use them with settings sync to make them consistent across computers.

| Shortcut I Use     | Description                 | Original Shortcut (where applicable) | Extension Name       |
| ------------------ | --------------------------- | ------------------------------------ | -------------------- |
| `Alt`+`B`          | Open In Default Application | None originally assigned             | open-in-external-app |
| `Ctrl`+`Shift`+`T` | TODOs Focus on TODO view    | None originally assigned             | todo-tree            |

## Code Snippets

Code snippets are, "templates that make it easier to enter repeating code patterns [...]" in other words they allow you to quickly enter chunks of text that are repeated frequently. Note that snippets in VSCode are written in JavaScript.

Below are some links to useful resources for understanding and making snippets:

[link 01](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
[link 02](https://code.visualstudio.com/api/language-extensions/snippet-guide)
[link 03](https://vscode-docs.readthedocs.io/en/latest/customization/userdefinedsnippets/)
[link 04](https://snippet-generator.app/?description=&tabtrigger=&snippet=&mode=vscode)

- Here is a simple snippet example that I use for creating class notes (I write all of my class notes in markdown in VSCode). I just inserts the code contained in the `body` section after I type in the text contained in the `prefix` section

    ```javascript
    "Class Notes Template": {
        "prefix": "Class_Notes",
        "body": [
            "# DATE HERE",
            "",
            "## Research Ideas",
            "",
            "1. ",
            "",
            "## Class Notes",
            "",
            "1. ",
            "",
            "## Reading Notes",
            "",
            "1. ",
            ""
        ],
        "description": "Reading Notes and Highlight guide"
    }
    ```

- useful snippet patterns
    - tab stops
        - you can navigate the snippet by adding tab stops, they are in this format `$1` they go in order however the last tab stop is always `$0`
    - tab stops with text that is pre highlighted (this makes it easy to remove that text if needed)
        - to have a predefined text that is pre-highlighted allows you to easily delete a chunk of text in case it needs to be changed you can achieve this by using this code format `${1:Predefined text}`
    - giving options to choose from at tab stop
        - if you want options at a tab stop you must surround the options in `|` also do not use a `:` after the number like normal `${1|Class Imports,Module Declaration|}"`

## Installed extensions

### Categories of Extensions

Below is my extensions that are grouped by purpose with many having a small explanation (last updated 2020-02-19)

#### C# and dotnet Extensions

- asp-net-core-switcher
- aspnet-helper
- csharp
- csharpextensions
- csharpfixformat
- docomment
- dotnet
- dotnet-core-essentials
- dotnet-test-explorer
- Ionide-fsharp
- msbuild-project-tools
- netcore-extension-pack
- netcore-snippets
- supersharp
- vscode-csharp-snippets
- vscode-nuget-package-manager

#### General Extensions

##### Editing Help Extensions

- change-case
- code-spell-checker
- code-spell-checker-medical-terms
- insertnumbers
- lorem-ipsum
- path-intellisense
- quicktype
- vscode-versionlens
- vscodeintellicode

##### Navigation Extensions

- Bookmarks
- vscode-jumpy
- vscode-position

##### Utility Extensions

- code-settings-sync
- open-in-external-app
- remote-wsl
- vscode-data-preview
- vscode-github

##### Visual Help Extensions

- better-comments
- bracket-pair-colorizer-2
- indent-rainbow
- selectline-statusbar
- todo-tree
- vscode-todo-highlight
- wordcounter

#### HTML Extensions

- auto-rename-tag

#### Markdown Extensions

- markdown-all-in-one
- markdown-navigation
- markdown-preview-github-styles
- markdown-toc
- pandocciter
- vscode-markdownlint
- vscode-pandoc

#### Other Language Extensions

- bash-beautify
- gitignore
- language-julia
- latex-workshop
- powershell
- stata-enhanced
- thrift
- vscode-autohotkey
- vscode-julia-formatter
- vscode-yaml

#### Python Extensions

- anaconda-extension-pack
- MagicPython
- python
- python-extension-pack
- pythonsnippets

#### R Extensions

- r
- r-development
- r-lsp

#### Themes

- github-plus-theme
- horizon-theme-vscode
- material-icon-theme
- material-theme
- nord-visual-studio-code
- one-monokai
- theme-cobalt2
- vsc-community-material-theme
- vsc-material-theme
- vsc-material-theme-icons
- vscode-theme-onelight

### Full list

These are all of the extensions that I use on my installation of VSCode

to get the list type this into PowerShell

```PowerShell
code --list-extensions | % { "code --install-extension $_" }
```

or you can upload settings using settings sync extension and copy the output from that action (this is what I did)

- anaconda-extension-pack
- asp-net-core-switcher
- aspnet-helper
- auto-rename-tag
- bash-beautify
- better-comments
- Bookmarks
- bracket-pair-colorizer-2
- change-case
- code-settings-sync
- code-spell-checker
- code-spell-checker-medical-terms
- csharp
- csharpextensions
- csharpfixformat
- docomment
- dotnet
- dotnet-core-essentials
- dotnet-test-explorer
- github-plus-theme
- gitignore
- horizon-theme-vscode
- indent-rainbow
- insertnumbers
- Ionide-fsharp
- language-julia
- latex-workshop
- lorem-ipsum
- MagicPython
- markdown-all-in-one
- markdown-navigation
- markdown-preview-github-styles
- markdown-toc
- material-icon-theme
- material-theme
- msbuild-project-tools
- netcore-extension-pack
- netcore-snippets
- nord-visual-studio-code
- one-monokai
- open-in-external-app
- pandocciter
- path-intellisense
- powershell
- python
- python-extension-pack
- pythonsnippets
- quicktype
- r
- r-development
- r-lsp
- remote-wsl
- selectline-statusbar
- stata-enhanced
- supersharp
- theme-cobalt2
- thrift
- todo-tree
- vsc-community-material-theme
- vsc-material-theme
- vsc-material-theme-icons
- vscode-autohotkey
- vscode-csharp-snippets
- vscode-data-preview
- vscode-github
- vscode-julia-formatter
- vscode-jumpy
- vscode-markdownlint
- vscode-nuget-package-manager
- vscode-pandoc
- vscode-position
- vscode-theme-onelight
- vscode-todo-highlight
- vscode-versionlens
- vscode-yaml
- vscodeintellicode
- wordcounter

## Settings (with their explanations)

Some of the settings I use in VSCode with short explanations

- these are the settings that i use when I use the minimap (which isn't very often to be honest). The minimap I've found to be very useful in very long documents but I don't use it terribly often in other documents or when I'm programming. There is a toggle minimap command that you can add a keyboard shortcut to if you want to turn it on and off often.

    ```JSON
    "editor.minimap.enabled": true,
    "editor.minimap.renderCharacters": false,
    "editor.minimap.size": "fit",
    "workbench.colorCustomizations": {
        "minimap.background": "#ffffff33"
    }
    ```

## Extension Authoring

You can create your own extensions in VSCode and put almost any functionality you can think of. To get started you should go to [this site](https://vscode-docs.readthedocs.io/en/latest/extensions/example-hello-world/). There is also a [GitHub repository](https://github.com/microsoft/vscode-extension-samples) that has several example extensions for you to look at for help. These following sites are also meant to help you get your extension started, tested, published, bundled and setup continuous integration (CI). You can also use the [API documentation](https://code.visualstudio.com/api/references/vscode-api) to find all of hte ways that you can interface with VSCode to create your extension.

- [Testing instructions](https://code.visualstudio.com/api/working-with-extensions/testing-extension)
- [Publishing instructions](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)
- [Bundling instructions](https://code.visualstudio.com/api/working-with-extensions/bundling-extension)
- [CI instructions](https://code.visualstudio.com/api/working-with-extensions/continuous-integration)

[I have created a simple extension myself](https://github.com/ldsands/PasteRegEx) that you can look through for more ideas.

### Publishing Instructions

To publish your extension you should follow the instructions posted on [this website](https://code.visualstudio.com/api/working-with-extensions/publishing-extension).

- Below is pretty much all you need to do everything for publishing your extension with a few notes of mine here to explain the variables that need to be entered to use this code
    - `$publisher_name` is the name of the publisher ID that must be created to publish an extension and is contained in the extension's `package.json` file
    - `$token` is the token that you get from your Azure DevOps site in Power

```PowerShell
# if you have not yet setup vsce then enter the following code
npm install -g vsce
vsce login $publisher_name
# to publish a patch (increment the version number automatically)
vsce publish patch -p $token
# to publish a minor (increment the version number automatically)
vsce publish minor -p $token
# to publish a major (increment the version number automatically)
vsce publish major -p $token
# to unpublish an extension
vsce unpublish (publisher name).(extension name)
```
