cls
ECHO OFF
color 02
:: This program automatically installs the python requirements for the Houdini DICOM Toolset
:: This program must be executed from the terminal and DOES NOT require admin priviledges
::
::	Comments:
::		- Working with wildcards to disregard Houdini's versioning
::		- Working with variable names for paths
ECHO ----------------------------------------------------
ECHO Installing Houdini DICOM Toolset Python Requirements
ECHO ----------------------------------------------------
:: This version of the application has a hard-coded Houdini version, needs to be improved...

:: [0] Set variables
set origin_path=%cd%
cd C:\Apps\Side Effects Software\Houdini*\python27\
set target_path=%cd%
ECHO The origin path is = %origin_path% 
ECHO The target path is = %target_path%
cd %origin_path%

:: [1] The program copies copies the list of requirements to the houdini-python directory
copy requirements.txt "%target_path%\requirements.txt"

:: [2] The program navigates to the houdini-python directory
cd %target_path%

:: [2] The program installs pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

:: [3] The program installs the requirements
python -m pip install -r requirements.txt

:: [4] Clean-up
del requirements.txt
cd %origin_path%

:: DONE!
ECHO ----------------------------------------------------
ECHO Installation Completed!
ECHO ----------------------------------------------------