# VS Code Keyboard Shortcuts

I do not keep this up do date very well since it requires quite a bit of effort. Instead I think of this more as a place to put some of the more useful shortcuts to reference on occasion.

- [VS Code Keyboard Shortcuts](#vs-code-keyboard-shortcuts)
    - [Useful Shortcuts](#useful-shortcuts)
        - [Useful Vscode Shortcuts](#useful-vscode-shortcuts)
        - [Extension Based Shortcuts](#extension-based-shortcuts)

## Useful Shortcuts

Note: Most of these will be taken from Windows because that is where I started using VS Code. However I now mostly use Linux. Most of the keyboard shortcuts are the same. For those that are different I will eventually update the table to indicate what shortcuts belong to which platform where applicable.

### Useful Vscode Shortcuts

(last updated 2021-11-18)

VS Code shortcuts that are not associated with any extensions

Some of these shortcuts have been modified by me and I use them with settings sync to make them consistent across computers

<!-- TODO: update the table to account for platform differences -->

| Shortcut I Use         | Description                                     | Original Shortcut        | Command                                                     | Further explanation                                                                                   |
| ---------------------- | ----------------------------------------------- | ------------------------ | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| "shift+alt+c"          | Copy Path of Active File                        | N/A                      | copyFilePath                                                |                                                                                                       |
| "ctrl+shift+/"         | Toggle Block Comment                            | "shift+alt+a"            | editor.action.blockComment                                  |                                                                                                       |
| "ctrl+/"               | Comment Line or Selection                       | N/A                      | editor.action.commentLine                                   |                                                                                                       |
| "ctrl+shift+k"         | Delete Current Line                             | N/A                      | editor.action.deleteLines                                   |                                                                                                       |
| "shift+alt+f"          | Format Document                                 | N/A                      | editor.action.formatDocument                                |                                                                                                       |
| "ctrl+k ctrl+f"        | Format Selection                                | N/A                      | editor.action.formatSelection                               |                                                                                                       |
| "ctrl+]"               | Indent Line(s)                                  | N/A                      | editor.action.indentLines                                   |                                                                                                       |
| "shift+alt+i"          | Insert Cursor at End of Each Line Selected      | N/A                      | editor.action.insertCursorAtEndOfEachLineSelected           |                                                                                                       |
| "shift+alt+i"          | Insert Cursor at End of Each Line Selected      | N/A                      | editor.action.insertCursorAtEndOfEachLineSelected           |                                                                                                       |
| "shift+alt+i"          | Add a Cursor to End of Each Line in Selected    | N/A                      | editor.action.insertCursorAtEndOfEachLineSelected           |                                                                                                       |
| "f8"                   | Go to Next Error or Warning                     | N/A                      | editor.action.marker.nextInFiles                            |                                                                                                       |
| "shift+f8"             | Go to Previous Error or Warning                 | N/A                      | editor.action.marker.prevInFiles                            |                                                                                                       |
| "f3"                   | Find next                                       | N/A                      | editor.action.nextMatchFindAction                           | This will find the next string that matches the string currently touching the curser (or highlighted) |
| "ctrl+["               | Outdent Line(s)                                 | N/A                      | editor.action.outdentLines                                  |                                                                                                       |
| "alt+f12"              | Peek Definition                                 | N/A                      | editor.action.peekDefinition                                |                                                                                                       |
| "f2"                   | Rename Symbol                                   | N/A                      | editor.action.rename                                        |                                                                                                       |
| "f12"                  | Go to Definition                                | N/A                      | editor.action.revealDefinition                              |                                                                                                       |
| "ctrl+shift+l"         | Select All Occurrences of Current Selection     | N/A                      | editor.action.selectHighlights                              |                                                                                                       |
| "ctrl+shift+Y"         | Show Snippets                                   | None Originally Assigned | editor.action.showSnippets                                  |                                                                                                       |
| "ctrl+space ctrl+c"    | Column Select Mode                              | None Originally Assigned | editor.action.toggleColumnSelection                         | [Link](https://code.visualstudio.com/updates/v1_43#_column-selection-mode)                            |
| "alt+z"                | Toggle Word Wrap                                | N/A                      | editor.action.toggleWordWrap                                |                                                                                                       |
| "ctrl+shift+space"     | Trigger Parameter Hints                         | N/A                      | editor.action.triggerParameterHints                         |                                                                                                       |
| "ctrl+k ctrl+x"        | Trim Trailing Whitespace                        | N/A                      | editor.action.trimTrailingWhitespace                        |                                                                                                       |
| "ctrl+i"               | Select Current Line                             | N/A                      | expandLineSelection                                         |                                                                                                       |
| "ctrl+shift+v"         | Open Markdown Preview                           | N/A                      | markdown.showPreview                                        |                                                                                                       |
| "ctrl+k+v"             | Open Markdown Preview to the Side               | N/A                      | markdown.showPreviewToSide                                  |                                                                                                       |
| "ctrl+shift+o"         | Goes to the Outline View                        | None Originally Assigned | outline.focus                                               |                                                                                                       |
| "ctrl+e ctrl+e"        | Reveal Active File in File Explorer             | "shift+alt+r"            | revealFileInOS                                              |                                                                                                       |
| "ctrl+shift+g"         | Opens a Search Editor for the Current File Only | None                     | search.action.openNewEditor                                 | see [this section](#keyboard-settings-with-their-explanations) for more detail                        |
| "ctrl+k o"             | Open Active File in New Window                  | N/A                      | workbench.action.files.showOpenedFileInNewWindow            |                                                                                                       |
| "ctrl+shift+f"         | Find in Files                                   | N/A                      | workbench.action.findInFiles                                |                                                                                                       |
| "ctrl+space ctrl+up"   | Changes Focus to Editor Located Up              | "ctrl+k ctrl+up"         | workbench.action.focusAboveGroup                            |                                                                                                       |
| "ctrl+space ctrl+down" | Changes Focus to Editor Located Down            | "ctrl+k ctrl+down"       | workbench.action.focusBelowGroup                            |                                                                                                       |
| "ctrl+e ctrl+n"        | Changes Focus to Editor Located Left            | "ctrl+k ctrl+left"       | workbench.action.focusLeftGroup                             |                                                                                                       |
| "ctrl+e ctrl+o"        | Changes Focus to Editor Located Right           | "ctrl+k ctrl+right"      | workbench.action.focusRightGroup                            |                                                                                                       |
| "ctrl+g"               | Go to Line                                      | N/A                      | workbench.action.gotoLine                                   |                                                                                                       |
| "ctrl+alt+shift+up"    | Move Current Editor to Editor Group Up          | None Originally Assigned | workbench.action.moveEditorToAboveGroup                     |                                                                                                       |
| "ctrl+alt+shift+down"  | Move Current Editor to Editor Group Down        | None Originally Assigned | workbench.action.moveEditorToBelowGroup                     |                                                                                                       |
| "ctrl+alt+shift+left"  | Move Current Editor to Editor Group Left        | None Originally Assigned | workbench.action.moveEditorToLeftGroup                      |                                                                                                       |
| "ctrl+alt+shift+right" | Move Current Editor to Editor Group Right       | None Originally Assigned | workbench.action.moveEditorToRightGroup                     |                                                                                                       |
| "alt+left"             | Go Backward in Your Cursor Location History     | N/A                      | workbench.action.navigateBack                               |                                                                                                       |
| "alt+right"            | Go Forward in Your Cursor Location History      | N/A                      | workbench.action.navigateForward                            |                                                                                                       |
| "ctrl+shift+n"         | Open New Window                                 | N/A                      | workbench.action.newWindow                                  |                                                                                                       |
| "ctrl+k ctrl+s"        | Keyboard Shortcuts                              | N/A                      | workbench.action.openGlobalKeybindings                      |                                                                                                       |
| "ctrl+,"               | User Settings                                   | N/A                      | workbench.action.openGlobalSettings                         |                                                                                                       |
| "ctrl+p"               | Go to File                                      | N/A                      | workbench.action.quickOpen                                  |                                                                                                       |
| "ctrl+tab"             | Quick Open Previous Recently Used Editor        | N/A                      | workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup |                                                                                                       |
| "ctrl+shift+h"         | Replace in Files                                | N/A                      | workbench.action.replaceInFiles                             |                                                                                                       |
| "ctrl+t"               | Show All Symbols (markdown Heading Navigation)  | N/A                      | workbench.action.showAllSymbols                             |                                                                                                       |
| "ctrl+r"               | Switch Window                                   | None Originally Assigned | workbench.action.switchWindow                               |                                                                                                       |
| "ctrl+shift+c"         | Open External Terminal                          | N/A                      | workbench.action.terminal.openNativeConsole                 |                                                                                                       |
| "ctrl+k z"             | Zen Mode (`esc` `esc` to Exit)                  | N/A                      | workbench.action.toggleZenMode                              |                                                                                                       |
| "ctrl+shift+e"         | View Show Explorer                              | N/A                      | workbench.view.explorer                                     |                                                                                                       |

### Extension Based Shortcuts

VS Code shortcuts that are not associated with any extensions. Some of these shortcuts have been modified by me and I use them with settings sync to make them consistent across computers.

| Shortcut I Use | Description                                    | Original Shortcut        | Extension Name    | Command                                | Further explanation                                               |
| -------------- | ---------------------------------------------- | ------------------------ | ----------------- | -------------------------------------- | ----------------------------------------------------------------- |
| "ctrl+shift+c" | Copy the selection without syntax highlighting | N/A                      | copy-text         | copy-text.copyTextOnly                 | [Repository](https://github.com/s-albert/copy-text)               |
| "ctrl+alt+n"   | Open Git Project in New Window                 | N/A                      | gitProjectManager | gitProjectManager.openProjectNewWindow | [Repository](https://github.com/felipecaputo/git-project-manager) |
| "ctrl+shift+t" | TODOs Focus on TODO view                       | None Originally Assigned | todo-tree         | todo-tree-view.focus                   | [Repository](https://github.com/Gruntfuggly/todo-tree)            |
