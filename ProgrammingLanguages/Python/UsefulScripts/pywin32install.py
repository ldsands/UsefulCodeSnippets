import os
import sys
from pathlib import Path
import subprocess

if sys.platform == "win32":

    def string_before_target(string, sub_string):
        pos_a = string.find(sub_string)
        if pos_a == -1:
            return ""
        return string[0:pos_a]

    os.system("pip install pywin32")
    output = (
        subprocess.check_output("pip install pywin32", shell=True)
        .decode("utf-8")
        .strip("Requirement already satisfied: pywin32 in")
    )
    output = Path(string_before_target(output, "site-packages")) / "Scripts"
    output_mod = str(output.resolve()).replace("Lib\\", "")
    install_command = f"python {output_mod}\\pywin32_postinstall.py -install"
    print(f"\n{install_command}\n")
    print(f"The installation command is below:")
    print(f"{install_command}")
    print("You can copy the install command and try running it using PowerShell or cmd.exe.")
    continue_command = input(
        "You can also type 'yes' to run the command here and then press enter to continue:"
    )
    if continue_command == "yes":
        try:
            cmd_output = subprocess.check_output(install_command, shell=True).decode("utf-8")
            print(cmd_output)
        except ImportError:
            print(
                "It apears that you need to install additional files. Go to 'https://www.microsoft.com/en-us/download/details.aspx?id=48145' and install the package"
            )
            print("Once that has been installed you can hit 'enter' to try the installation again.")
            input("Press enter to continue")
        except subprocess.CalledProcessError:
            print(
                """There was an error in the installation. If you the error says 'ImportError: DLL load failed while importing pywintypes: The specified module could not be found.' then you need to install additional files. Go to 'https://www.microsoft.com/en-us/download/details.aspx?id=48145' and install the package"""
            )
            print("Once that has been installed you can hit 'enter' to try the installation again.")
            input("Press enter to continue")
    else:
        print(
            "If you see 'ImportError: DLL load failed while importing pywintypes: The specified module could not be found.' then you need to install additional files. Go to 'https://www.microsoft.com/en-us/download/details.aspx?id=48145' and install the package. You can then run the command again."
        )
        print(
            "If that doesn't work make sure that you're not using the version of python that is installed from the Windows store instead install python from https://www.python.org/ or use chocolatey https://chocolatey.org/packages/python/3.8.3 or winget with winget install --id=Python.Python -e"
        )
    # print(output)
    # output.strip("Requirement already satisfied: pywin32 in")
    # output
    # print(directories)
    # print(list(python_path.glob("Python*")))
    # print(python_path.resolve())
