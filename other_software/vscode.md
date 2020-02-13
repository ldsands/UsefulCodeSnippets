# Visual Studio Code

All of my VSCode information that I use

- [Visual Studio Code](#visual-studio-code)
    - [Useful shortcuts (Windows)](#useful-shortcuts-windows)
    - [Installed packages](#installed-packages)
    - [Resources](#resources)

## Useful shortcuts (Windows)

Some of these shortcuts have been modified by me and I use them with settings sync to make them consistent across computers

| Shortcut I Use         | Description                                 | Original Shortcut (where applicable)        |
| ---------------------- | ------------------------------------------- | ------------------------------------------- |
| `Alt`+`Z`              | Toggle word wrap                            | N/A                                         |
| `Ctrl`+`,`             | User Settings                               | N/A                                         |
| `Ctrl`+`/`             | Comment line or selection                   | N/A                                         |
| `Ctrl`+`K` `Ctrl`+`S`  | Keyboard Shortcuts                          | N/A                                         |
| `Ctrl`+`R`             | Switch workspace                            | N/A                                         |
| `Alt`+`Z`              | Toggle word wrap                            | N/A                                         |
| `Ctrl`+`T`             | Show all Symbols                            | N/A                                         |
| `Ctrl`+`G`             | Go to Line...                               | N/A                                         |
| `Ctrl`+`P`             | Go to File...                               | N/A                                         |
| `F8`                   | Go to next error or warning                 | N/A                                         |
| `Shift`+`F8`           | Go to previous error or warning             | N/A                                         |
| `Ctrl`+`Shift`+`Tab`   | Navigate editor group history               | N/A                                         |
| `Alt`+ `←`/`→`         | Go back / forward                           | N/A                                         |
| `Shift`+`Alt`+`I`      | Insert cursor at end of each line selected  | N/A                                         |
| `Ctrl`+`I`             | Select current line                         | N/A                                         |
| `Ctrl`+`Shift`+`L`     | Select all occurrences of current selection | N/A                                         |
| `Ctrl`+`F2`            | Select all occurrences of current word      | N/A                                         |
| `Ctrl`+`Shift`+`Space` | Trigger parameter hints                     | N/A                                         |
| `Shift`+`Alt`+`F`      | Format document                             | N/A                                         |
| `Ctrl`+`K` `Ctrl`+`F`  | Format selection                            | N/A                                         |
| `F12`                  | Go to Definition                            | N/A                                         |
| `Alt`+`F12`            | Peek Definition                             | N/A                                         |
| `F2`                   | Rename Symbol                               | N/A                                         |
| `Ctrl`+`K` `Ctrl`+`X`  | Trim trailing whitespace                    | N/A                                         |
| `Ctrl`+`K` `R`         | Reveal active file in Explorer              | N/A                                         |
| `Ctrl`+`Shift`+`H`     | Replace in files                            | N/A                                         |
| `Ctrl`+`K` `Z`         | Zen Mode (`Esc` `Esc` to exit)              | N/A                                         |
| `Ctrl`+`Shift`+`V`     | Open Markdown preview to the side           | N/A                                         |
| `Ctrl`+`Shift`+`F`     | Open search sidebar                         | N/A                                         |
| `Ctrl`+`R`             | Switch workspace                            | N/A                                         |
| `Ctrl`+`Tab`           | Switch tabs                                 | N/A                                         |
| `Shift`+`Alt`+`I`      | Insert cursor at end of each line selected  | N/A                                         |
| `Ctrl`+`L`             | Select current line                         | N/A                                         |
| `Ctrl`+`Shift`+`L`     | Select all occurrences of current selection | N/A                                         |
| `Ctrl`+`K`+`R`         | Reveal active file in Explorer              | N/A                                         |
| `Ctrl`+`Shift`+`H`     | Replace in files                            | N/A                                         |
| `Ctrl`+`K`+`V`         | Open Markdown preview to the side           | N/A                                         |
| `Shift`+`Alt`+`R`      | Reveal in file explorer                     | N/A                                         |

## Installed packages

These extensions are the ones that I use on my installation of VSCode

to get the list type this into powershell

```powershell
code --list-extensions | % { "code --install-extension $_" }
```

- aaron-bond.better-comments
- adrianwilczynski.asp-net-core-switcher 
- akamud.vscode-theme-onelight
- AlanWalk.markdown-navigation
- alefragnani.Bookmarks
- arcticicestudio.nord-visual-studio-code
- Asuka.insertnumbers
- azemoh.one-monokai
- bierner.markdown-preview-github-styles 
- cduruk.thrift
- christian-kohler.path-intellisense     
- codezombiech.gitignore
- CoenraadS.bracket-pair-colorizer-2     
- craigthomas.supersharp
- DavidAnson.vscode-markdownlint
- doggy8088.netcore-extension-pack       
- doggy8088.netcore-snippets
- donjayamanne.python-extension-pack     
- DougFinke.vscode-pandoc
- Equinusocio.vsc-community-material-theme
- Equinusocio.vsc-material-theme
- equinusocio.vsc-material-theme-icons
- formulahendry.dotnet
- formulahendry.dotnet-test-explorer
- frhtylcn.pythonsnippets
- Gruntfuggly.todo-tree
- Hridoy.r-development
- Ikuyadeu.r
- Ionide.Ionide-fsharp
- James-Yu.latex-workshop
- jchannon.csharpextensions
- jmrog.vscode-nuget-package-manager
- joffreykern.markdown-toc
- jolaleye.horizon-theme-vscode
- jorgeserrano.vscode-csharp-snippets
- julialang.language-julia
- k--kato.docomment
- kirozen.wordcounter
- KishoreIthadi.dotnet-core-essentials
- KnisterPeter.vscode-github
- kylebarron.stata-enhanced
- Leopotam.csharpfixformat
- magicstack.MagicPython
- ms-python.anaconda-extension-pack
- ms-python.python
- ms-vscode-remote.remote-wsl
- ms-vscode.csharp
- ms-vscode.powershell
- ms-vscode.wordcount
- notZaki.pandocciter
- oderwat.indent-rainbow
- pflannery.vscode-versionlens
- PKief.material-icon-theme
- quicktype.quicktype
- RandomFractalsInc.vscode-data-preview
- redhat.vscode-yaml
- REditorSupport.r-lsp
- schneiderpat.aspnet-helper
- shakram02.bash-beautify
- Shan.code-settings-sync
- singularitti.vscode-julia-formatter
- streetsidesoftware.code-spell-checker
- streetsidesoftware.code-spell-checker-medical-terms
- thenikso.github-plus-theme
- tintoy.msbuild-project-tools
- tomoki1207.pdf
- tomoki1207.selectline-statusbar
- VisualStudioExptTeam.vscodeintellicode
- wayou.vscode-todo-highlight
- wesbos.theme-cobalt2
- wmaurer.change-case
- wmaurer.vscode-jumpy
- yuenm18.ooxml-viewer
- yzane.markdown-pdf
- yzhang.markdown-all-in-one
- zhuangtongfa.material-theme

## Resources

- [Windows Cheat-Sheet](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf) [PDF]