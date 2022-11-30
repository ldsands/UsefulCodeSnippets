# Zotero Windows Setup

Zotero is a reference manager for Windows, MacOS and Linux.

Note: These instructions should work for Linux and Mac too.

I have also created a tutorial on how to use some aspects of Zotero that can be accessed [here](https://ldsands.github.io/Slides/main_slides/one_offs/2020_09_Levi_Sands_Ref_Man_Zotero.html#/).

[This blog post](https://www.jdavidstark.com/3-ways-to-increase-your-zotero-cloud-storage/?fbclid=IwAR0HGGW_WcSWFs2VbXQWf3sp58YSA2iNbZIxp7Yikzjq6Gx-TWILjuWFgc4) has some more detail about different ways to set up attachment syncing. I have personally found WebDAV to be more reliable overall (despite the occasional downtime of pCloud's WebDAV service).

- [Zotero Windows Setup](#zotero-windows-setup)
    - [Default Zotero Preferences I Change](#default-zotero-preferences-i-change)
    - [Main Screen Columns](#main-screen-columns)
    - [Zotero Add-ons](#zotero-add-ons)
    - [Links and Account Information](#links-and-account-information)
    - [Zotero Related External Applications and Integrations](#zotero-related-external-applications-and-integrations)

## Default Zotero Preferences I Change

- Don't download website snapshots to save a lot space
    1. Under edit, then preferences select the general tab
    1. In the "file handling" section uncheck the "automatically take snapshots when creating items from web pages"
- Don't share the child notes, links and tags with shared libraries
    1. Under edit, then preferences select the general tab
    1. In the "Groups" section uncheck the "child notes", "tags" and "child links" options
- Change the default citation style to ASA 6th edition
    1. Under edit, then preferences select the cite tab
    1. In the styles section find the "American Sociological Association 6th Edition"
    1. If this option is missing you can download the CSL file from [here](https://github.com/citation-style-language/styles/blob/master/american-sociological-association.csl)
- Sometimes I like to see all of the citations within a folder and all subfolders, the show items from subcollections setting allows for this.
    - Under View select "Show Items from Subcollections"

## Main Screen Columns

- I prefer to have the columns organized in the following order:
    - Creator
    - Year
    - Attachments
    - Title
    - Extra

## Zotero Add-ons

- To install a plugin do the following:
    1. Select "Tools"
    1. Select "Add-ons", then click on the gear in the upper right
    1. Select "Install Add-on From File"
    1. Browse to the downloaded `.xpi` file
    1. Select "Open"
    1. Restart Zotero
- [Better BibTeX](https://github.com/retorquere/zotero-better-bibtex)
    - I use this because I write mostly in markdown with pandoc and citeproc, Zotero's default exporting format sometimes causes issues with cite keys. Better BibTeX solves that issue. It can also auto update citation files. Below are the instructions for installation and configuration:
        1. After the restart I selected these options in the dialogue box: "Use the BBT default citekey format"
        1. I then deselect the "Enable drag-and-drop citations"
        1. I don't change anything on the next screen
        1. You will need to restart Zotero again
        1. Better BibTeX will then create a new key for all of the citations in your library
        1. When exporting select better BibTeX and that should help with citations using BibTeX or BibLaTeX
    - [You download the `.xpi` file for installation here:](https://github.com/retorquere/zotero-better-bibtex/releases/latest)
- [Zotero Citation Counts](https://github.com/eschnett/zotero-citationcounts)
    - To configure I do the following:
        1. Select "Tools"
        1. Select "Citation Counts Manager Preferences..."
        1. Under the "Get citation counts for the new items"
            1. Select "Semantic Scholar citation counts"
        1. Select "Tools"
        1. Mouse over "Get citation counts for the new items"
            1. Select "Semantic Scholar citation counts"
    - To use:
        1. Right click on any item in the main window
        1. Mouse over "Manage Citation Counts"
            1. Select "Get Semantic Scholar citation counts"
- [Zutilo](https://github.com/wshanks/Zutilo) - "Zotero plugin providing some additional editing features"
    - I install this mostly for editing tags for many entries at once
    - This does a lot of other things that I haven't explored yet
    - [You download the `.xpi` file for installation here:](https://github.com/wshanks/Zutilo/releases/lastest)
- [Mdnotes](https://github.com/argenos/zotero-mdnotes)
    - You must have Better BibTeX and Zotfile installed to use this
    - A Zotero plugin to export item metadata and notes as markdown files
    - [You download the `.xpi` file for installation here:](https://github.com/argenos/zotero-mdnotes/releases/)

## Links and Account Information

Note: It may not be a bad idea to configure all settings and Add-ons before you set up syncing

1. To complete the instructions to install Zotero and setup the WebDAV file syncing, you will have to follow the instructions listed below:
    1. Download Zotero from [the Zotero website](https://www.zotero.org/download/)
    1. Create a Zotero account [here](https://www.zotero.org/user/register/)
    1. Create a pCloud account [here](https://www.pcloud.com/)
        - Alternatives to pCloud can be found [here](https://www.zotero.org/support/kb/webdav_services)
1. Setup WebDAV Syncing Instructions
    1. Download and install Zotero
    1. Select the edit menu and then select preferences
    1. Select the sync tab
    1. Sign into into your Zotero account
    1. In the file syncing section, select WebDAV in the dropdown menu
    1. Make sure https is selected
    1. In the text box add "webdav.pcloud.com:443"
    1. Enter your pCloud username (this should be your pCloud email account) and password
    1. Mostly to save space I also select "as needed" in the dropdown boxes that are labeled as "Downloaded files"
        - This makes it so that attachments will only be downloaded when you try to open the attached file rather than trying to download all of the file attachments for your entire library every time you sync.
    1. Press OK at the bottom of the settings dialogue box
    1. Click on the Green sync arrow in the upper right hand part of the Zotero window
        - Note for Windows: Syncing will fail on the first try that is normal (probably a bug) to fix this do the following:
            1. Select the edit menu and then the sync tab
            1. Reenter your pCloud password
            1. Press OK at the bottom of the dialogue box
            1. Click again on the green sync arrow
            1. Zotero should now sync correctly

## Zotero Related External Applications and Integrations

- [Citation Picker for Zotero (for VSCode)](https://marketplace.visualstudio.com/items?itemName=mblode.zotero)
    - You must have Better BibTeX installed to use this
    - This allows you to use the same citation selector that you can use in MS Word or LibreOffice Word in VSCode
