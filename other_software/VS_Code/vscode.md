# Visual Studio Code

All of my VS Code information that I use

- [Visual Studio Code](#visual-studio-code)
    - [Resources](#resources)
    - [Code Snippets](#code-snippets)
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
- [Default Windows Keybindings](https://github.com/smcpeak/vscode-default-keys-windows/blob/master/package.json)

## Code Snippets

Code snippets are, "templates that make it easier to enter repeating code patterns [...]" in other words they allow you to quickly enter chunks of text that are repeated frequently. Note that snippets in VS Code are written in JavaScript.

- Below are some links to useful resources for understanding and making snippets:
    - [link 01](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
    - [link 02](https://code.visualstudio.com/api/language-extensions/snippet-guide)
    - [link 03](https://vscode-docs.readthedocs.io/en/latest/customization/userdefinedsnippets/)
    - [link 04](https://snippet-generator.app/?description=&tabtrigger=&snippet=&mode=vscode)
- Also here is a list of several of the special variables made for snippets at the location of the code the comprehensive list is located [here](https://github.com/microsoft/vscode/blob/master/src/vs/editor/contrib/snippet/snippetVariables.ts)
    - `${LINE_COMMENT}` this will put a line comment character(s) in for whatever language the file is classified
    - `${TM_FILENAME:default}` this will 
    - `${TM_DIRECTORY}` this will insert the name of the directory in which the file is located
    - `${BLOCK_COMMENT_START}` this will insert the start of a block comment
    - `${BLOCK_COMMENT_END}` this will insert the end of a block comment
    - `${TM_SELECTED_TEXT}` this will do something to the text that is selected
    - `${RELATIVE_FILEPATH }` this will get the relative filepath from the parent workspace until the location of the file targeted
    - `${CLIPBOARD}` this will do something with whatever is in the clipboard
- Here is a simple snippet example that I use for creating class notes (I write all of my class notes in markdown in VS Code). I just inserts the code contained in the `body` section after I type in the text contained in the `prefix` section

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

- Useful snippet patterns
    - Tab stops
        - You can navigate the snippet by adding tab stops, they are in this format `$1` they go in order however the last tab stop is always `$0`
    - Tab stops with text that is pre highlighted (this makes it easy to remove that text if needed)
        - To have a predefined text that is pre-highlighted allows you to easily delete a chunk of text in case it needs to be changed you can achieve this by using this code format `${1:Predefined text}`
    - Giving options to choose from at tab stop
        - If you want options at a tab stop you must surround the options in `|` also do not use a `:` after the number like normal `${1|Class Imports,Module Declaration|}"`
- Snippets I use regularly that may be useful to others
    - This next snippet replaces all spaces with underscores `_`
        - Funny sidenote on this I literally created a VS Code extension to do this kind of stuff and just a few weeks later I found [this stackoverflow answer](https://stackoverflow.com/questions/1596052/replace-text-in-a-visual-studio-code-snippet-literal)

        ```javascript
        "Replace Whitespaces With UnderScores": {
            "prefix": "ReplaceUnderscore",
            "body": [
                "${TM_SELECTED_TEXT/[' ']/_/gi}",
            ],
            "description": "Replace All Whitespaces of Highlighted Text With Underscores"
        }
        // Below you can do this through a keyboard shortcut if you want to as well
        {
            "key": "ctrl+shift+y",
            "command": "editor.action.insertSnippet",
            "when": "editorTextFocus",
            "args": {
                "snippet": "${TM_SELECTED_TEXT/[' ']/_/gi}"
            }
        }
        ```

## Extension Authoring

You can create your own extensions in VS Code and put almost any functionality you can think of. To get started you should go to [this site](https://vscode-docs.readthedocs.io/en/latest/extensions/example-hello-world/). There is also a [GitHub repository](https://github.com/microsoft/vscode-extension-samples) that has several example extensions for you to look at for help. These following sites are also meant to help you get your extension started, tested, published, bundled and setup continuous integration (CI). You can also use the [API documentation](https://code.visualstudio.com/api/references/vscode-api) to find all of the ways that you can interface with VS Code to create your extension.

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
