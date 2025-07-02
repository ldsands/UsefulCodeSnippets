# KDE Configurations

KDE is largely the same across distros so I'm putting my KDE configurations and preferences here rather than in each Distro's instruction file

## KDE Plasma Setup

System Settings to change. Open "System Settings" then you can search or find the categories listed (in the left sidebar) below to edit settings. I try to follow the order they appear in the System Settings Application.

- "Appearance & Style"
    - "Global Theme"
        - Select "Breeze Dark"
- Under the "Apps & Windows" category
    - Go to "Default Applications";
        - "Web Browser": select "Vivaldi"
        - "Terminal emulator": select "Ghostty"
    - Go to "Notifications"
        - Next to "Low priority notifications" enable "Show in history"
    - Go to "Window Management"
        - "Desktop Effects"
            - Search for "Desktop Grid"
                - Select the "Configure..." button
                - Set "Border width:" to 5
                - For "Desktop name alignment:" select "Top"
                - Deselect "Show buttons to alter count of virtual desktops"
                - Click on the "OK" button
        - "Task Switcher"
            - In the "Visualization" column select "Thumbnail Grid" from the dropdown menu
            - Do this for both the "Main" and the "Alternate" tabs (at the top of the sub-window that contains the settings above)
            - Click on the "Apply" button in the lower right corner
        - "Virtual Desktops"
            - "Workspace Behavior"; "Virtual Desktops"
                - I create 12 Virtual Desktops with three desktops in each of 4 rows
                - Row 1: `Random 01`, `Random 02` and `Random 03`
                - Row 2: `School 01`, `School 02` and `School 03`
                - Row 3: `Python 01`, `Python 02` and `Python 03`
                - Row 4: `Email`, `CommsMusic` and `Todo`
            - Enable "Navigation wraps around"
            - Enable "Show on-screen display when switching" and change the value to 500 ms
                - Enable "Show desktop layout indicators"
- Under the "Input & Output" category
    - Go to "Mouse & Touchpad"
        - "Screen Edges"
            - For all corners select "No Action" except:
                - The upper right corner select "Present Windows - Current Desktops"
                - The lower right corner select "Present Windows - All Desktops"
                - The lower left select "Grid"
    - Go to "Keyboard"
        - "Shortcuts" (these are in alphabetical order since scrolling through them isn't as useful as searching for each individually)
            - "KRunner": `meta+space`
            - "Maximize Window": `meta+home`
            - "Toggle Grid View": `meta+tab`
            - "Spectacle"; "Capture Rectangular Region": `meta+shift+s`
            - "Switch One Desktop Down": `meta+ctrl+down`
            - "Switch One Desktop Up": `meta+ctrl+up`
            - "Switch One Desktop to the Left": `meta+ctrl+left`
            - "Switch One Desktop to the Right": `meta+ctrl+right`
            - Click the button "Add Application" select Ghostty; Click "Add custom shortcut" `meta+shift+t`
- Under the "Workspace" category
    - "Search"; "Plasma Search": (to modify results that appear in KRunner)
        - Click on "Configure KRunner..."
            - Next to "History:" select "Enabled auto-complete"
        - Deselect "Browser History"
        - Deselect "Browser Tabs"
        - Deselect "Kate Sessions"
        - Deselect "Konsole Profiles"
        - Click on "Get New Plugins"; search for "VSCodeProjectsRunner" then install that plugin
            - This may not work so instead go tho the projects GitHub pages and follow the instructions found there
        - Click on "Get New Plugins"; search for "VSCode Workspaces Runner" then install that plugin
            - This may not work so instead go tho the projects GitHub pages and follow the instructions found there'
    - "Workspace Behavior"
        - "General Behavior"
            - Clicking files or folders; change to "Selects them"
- Under the "Security & Privacy" category
    - "Screen Locking"
        - Lock screen automatically: uncheck
- Next to the search box in the upper left click on the hamburger menu
    - Select "Highlight Changed Settings" button to easily see which settings have been changed from their defaults

Next there are several changes I make to the panel(s) (taskbar(s)) and the desktop.

- Panel (in Windows Terminology the taskbar)
    - Right click on the battery icon and select "Show Battery Percentage on Icon" (on computers with a battery like a laptop)
    - Right click on the clock and select "Configure Digital Clock ..." Then next to "Date format:" select "ISO Date"
    - Right click on the panel (called taskbar on Windows) and select "Edit Panel..."
        - Mouse over the "Icons-Only Task Manager"; Mouse over "Configure"
        - Select the "Behavior" tab in the sidebar;
            - For "Groups" select "Do not group"
            - For "Show Only Tasks" select "From current screen" (make sure both "From current desktop" and "From current activity" are also selected)
    - Right Click on the down arrow in the system tray and click on "Configure System Tray..."
        - "General" Tab
            - From the "Panel icon spacing:" drop down box select "Small"
        - "Keyboard Shortcuts" Tab
            - Click on the button that says "None" and enter the keyboard shortcut `meta+a`
        - "Entries" Tab
            - Search for "notifications"
                - next to "Notifications" in the column "Keyboard Shortcut" click on the button then enter the keyboard shortcut `meta+n`
    - Right Click on the panel and click "Add Widgets..."
        - Find and drag the "Window List" Widget to the panel next to the System Tray
    - If there are two monitors
        - Do the following for whichever monitor that is not the "Primary" monitor (as indicated in the "Display Configuration" in the System Settings application)
            - Right click on a blank spot of the desktop, mouse over "Add Panel" then click on "Default Panel"
            - Repeat the above panel settings for the new panel
            - Remove the system tray from one monitor (I usually choose the non primary monitor to keep the system tray)
            - Remove the "Window List" Widget from one monitor (I usually choose the non-primary monitor to keep this widget)
- Desktop
    - Right click on a blank section of the desktop and select "Enter Edit Mode"
        - Select the "Add Widgets..." (assuming there are two monitors, if not I put the locations used below will all work with each other on one monitor)
            - On the right screen in the upper left hand corner I add the widget "Pager" onto the Desktop
                - I make it big enough to see all nine desktops well
                - Right click on the widget and select "Configure Pager"
                    - In the "General" tab I select "Show applications icons on window outlines"
                    - Also in the "General" tab I select "Text Display"; "Desktop Name"
            - On the right screen in the upper right corner I add the "Weather Report" widget
            - On the left screen in the lower left I add the "Window List" widget

## Other Important Notes

- The Baloo file extractor will cache all files for searches however that is not a good idea for pCloud or Zotero local storage. More information can be found [here](https://community.kde.org/Baloo/Configuration#Exclude_Folders). If you want to see what is being indexed you can use the command `balooctl6 monitor`. You can get some basic status using the `balooctl6 status` command. The command `balooctl6 purge` will delete the indexed files and restart indexing. To disable baloo use `balooctl6 disable`. To see more command options use the `balooctl6` command. To stop this use the command below:

    ```sh
    echo 'exclude folders[$e]=$HOME/pCloudDrive/,$HOME/Zotero/,$HOME/yay/,$HOME/,$HOME/.*,$HOME/*.*,$HOME/*.**
    ' >> ~/.config/baloofilerc
    ```

- I usually dual boot Windows and Linux. The default for bootctl (systemd) to select an OS to boot is 5 seconds.
    - To increase the systemd timeout to select an OS to boot into you can use the command `bootctl set-timeout ""` in linux (this example sets the timeout to 10 seconds).
    - You can also press `shift+t` then hit `+` or `-` to increase or decease the time until boot automatically happens
