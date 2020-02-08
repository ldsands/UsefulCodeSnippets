# Zotero Windows Setup

Many of these instructions should work for Mac too.

## Setup webdav syncing instructions

1. After Zotero is downloaded and installed click on edit and then preferences
1. Click on the sync tab then after signing into your Zotero account under the file syncing section click on the dropdown and select WebDAV
1. Make sure Https is selected then in the text box add webdav.pcloud.com:443
1. Sign into your pcloud.com account and press OK at the bottom
1. Click on the Green sync arrow in the upper right hand part of the Zotero window.
1. For Windows: It will fail once on the first try that is normal (probably a bug) go back to the sync area again and sign into your box.com account again and press OK
1. Click again on the green sync arrow and it should sync correctly
1. Under preferences in the general tab uncheck the "automatically take snapshots when creating items from web pages in order to save on space
1. Under the preferences in the general tab uncheck the child notes and tags so that they don't get shared when sharing to a group
1. To use ASA style you need to look for a CSL file [can be downloaded from here](https://github.com/citation-style-language/styles/blob/master/american-sociological-association.csl)

## Setting up Pcloud account for Zotero

This tutorial taken from [UC Berkeley](http://guides.lib.berkeley.edu/c.php?g=4472&p=15932) (and modified a bit by me)

pCloud is one WebDAV option listed by Zotero that provides 10GB free storage.

1. Go to pcloud.com and create an account. It is not necessary to download the pCloud client, although you get additional free storage for doing so.
1. In Zotero, change the WebDAV url to: webdav.pcloud.com:443
1. Enter the username and password for the pCloud account you created
1. Verify the server. A pop-up window will say the folder does not exist. Click "Create."
1. Verify the server again.
1. If you have been using a different WebDAV server, go to Edit > Preferences > Sync > Reset and choose the "Reset File Sync History" option. Then click on Reset. Go to your Zotero application and click on the sync command and the files will be uploaded to pCloud.

## Zotero plug-ins

- [for getting google scholar counts in Zotero](https://github.com/beloglazov/zotero-scholar-citations/tree/master/builds)
