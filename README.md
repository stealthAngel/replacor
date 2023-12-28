# File and Directory Renamer Batch Script

## Description
This batch script is designed to rename files and directories within the **current directory** by replacing a specified string in their names with a new string.

## Usage
To use this script, run it from the command prompt with optional parameters for the old and new strings.

Syntax:
```
replacor [oldstring] [newstring]
```

Example:
```
replacor Job Work
```

To display help information, use:
```
scriptname --help
```
I might add in the future that it will also replace the strings within files, but right now visual studio code and visual studio can do this just fine with ctrl + shift + f
## Adding Script to Environment Variables
To run this script from any directory in the command prompt, add it to the Windows environment variables. Follow these steps:

1. **Locate the Script**: Place the script in a convenient and permanent location on your drive.

2. **Edit Environment Variables**:
   - Right-click on 'This PC' or 'My Computer' and select 'Properties'.
   - Click on 'Advanced system settings'.
   - In the 'System Properties' window, click on the 'Environment Variables' button.

3. **Update Path Variable**:
   - Under 'System variables', find and select the 'Path' variable.
   - Click 'Edit'.
   - Click 'New' and add the path to the directory where your script is located.
   - Click 'OK' to close all dialogs.

4. **Restart Command Prompt**: For the changes to take effect, restart your command prompt.
