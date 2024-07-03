# PDF-XChange Editor

This is my preferred PDF reading and editing program. I have searched for years and finally found this program. Nothing else has come close for me.

The changelog is located [here](https://www.tracker-software.com/product/pdf-xchange-editor/history)

## My Preferred Settings

- Under preferences
    - Documents tab:
        - Enable: "Restore Last Session when application starts"
        - Disable: "Back/Forward commands navigate through all opened documents"
    - Page Display:
        - Select: Default View - "Bookmarks Pane and Page"
        - Select: Default Page Layout - "Single Page"
        - Enable: Default Page Zoom - "Fit Page"
        - Enable: Page Display - "Use logical page numbers"
        - Enable: Page Display - "Forbid the change of current Zoom factor, during execution of [...]"
    - Registration:
        - Select: "Add New License Key..." paste in the serial key which can be found [here](https://www.tracker-software.com/myaccount) (after logging in)
    - Speech:
        - Disable: "Use Default Voice"
        - Select: "Vocalizer Expressive serena [...]" (if installed I purchased this from [this location](https://sites.fastspring.com/nextup/product/nuance?store=parameters))
        - Disable: "Use Default Speech Attributes"
        - Select 10: "Rate"
    - Tools tab:
        - Default Tool: "Select Tool"
- Customize Toolbars
    - Remove the commands already on the "Document Options" toolbar (in the lower left corner)
    - Open the "Commands" tab in the Customize Toolbars dialogue box
    - For all of the following commands search for the command, then drag the command down to the "Document Options" toolbar, then right click on that command and deselect "Show Text"
        - cmd.tool.selectText (Select Text)
        - cmd.tool.annot.highlight (Highlight Text Tool)
        - cmd.tool.cropPage (Crop Page Tool)
        - cmd.document.cropPages (Crop Pages)
        - cmd.document.removeCroppedContent (Remove Cropped Content)
        - cmd.document.deletePages (Delete Pages)
        - cmd.bp.generate (Generate Bookmarks From Page Text)
        - cmd.tool.editContent (Edit Content)
        - cmd.tool.editContent.text (Text)
    - In the Commands tab:
        - Search for cmd.openSrcFolder (Open Containing Folder)
            - Select the command and Select the "Properties..." button
            - Click in the text box under "Keys:" and then use the keyboard keys `ctrl+E` twice
            - Select the green check mark to assign the shortcut
- Once all of this is done you should copy the "Settings.dat" file just in case something happens.

## Usage Tips and Tricks

### Searching Tips

- Find can be brought up using `ctrl+f` this will search for the characters/words within the current document
    - There are several options, sometimes I will use the highlight option so that all of the results are highlighted
- Search can be brought up using `ctrl+shift+f` this will do a search for the characters/words but it has many additional options
    - Under "WHERE would you like to search" you can select "In All Open Documents"
    - Under "Options..." you can specify the "Proximity" which I use to find two words that may be with in the same paragraph or the same page, I use this a lot
    - Under the "Advanced Criteria" there are several other useful options
        - In the second text box that says "any of these words" when the box is empty you can search for two separate combination of words by using quotes and a " " (space character) in between multiple search strings. Here is an example: `"cultural code" "semiotic code"` this will search the document(s) for both cultural code and semiotic code they will each be highlighted in different colors if "Colored Search Results" is enabled
- Under "Options" you can select "Colored Search Results" to highlight all of the different words from the most recent search in different colors

### PDF Conversion and Enhancement

- When using the OCR function I set these preferences:
    - Under the "Recognition Options" section:
        - Set "Accuracy" to "High"
        - I enable all of the other options in this section
    - Under the "Output Options" section:
        - Set "Type" to "Searchable Image"
        - Enable "Fix content skew and incorrect page rotation"
        - Disable "Create a New Document"

### Random Tips

- Using the `alt+left` will take you to the last place you clicked or searched in the document and the `alt+right` will then take you forward again

### Conversion Tips

- When converting other formats to PDF the best I've found is [Calibre](https://calibre-ebook.com/).
    - To get the best TTS output select `txt` and use the applicable options below (most will apply)
    - Some of the settings I find helpful for converting (especially from epub) are below:
        - Under the "Look & Feel" tab
            - Under the "Fonts" tab
                - Make sure you unselect "Keep ligatures"
            - Under the "Text" tab
                - Select "Unsmarten punctuation"
                - Select Transliterate Unicode characters to ASCII
        - Under the "Heuristic processing"
            - Select "Enable heuristic processing"
                - Under "Unwap lines" you may want to increase the "Line un-wrap factor:" number to 1.00 if you're having issues having line breaks within paragraphs
                    - A helpful post about this can be found [here](https://www.reddit.com/r/ebooks/comments/1hst5i/comment/caxrrqu/?utm_source=share&utm_medium=web2x&context=3).
