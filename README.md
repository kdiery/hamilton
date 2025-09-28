## Description
Healing Device for humans, that changes healing procedure based on age and gender of patient.

## Supplmenetaries
In the end I decided to add a minimal backend to simulate how the data would actually be handled.
This was outside the time range. However, all visible aspects could be implemented using only Qt/QML and no C++.
There is still room to improve the transitions, especially those that remove the patient-data buttons and move the healing button.
Also, the proper way to implement a color theme remains to be done.

## Feedback
-I enjoyed
  - Working on the layout based on the Figma mock-up. It provided an opportunity to use a wide range of features.
  - Using Qt 6’s animation system and creating smooth state transitions.
- I found challenging
  - Assessing safety-critical components since it was a very minimal, abstract example.
  - Deciding where to start and which parts to implement first.
  - Finding the best way to implement a custom color theme.


## Installation instructions
- Download Qt Creator and Qt 6.8 or later.
- On Windows, install the MinGW compiler (or MSVC).
- Open the project by opening the CMakeLists.txt file in Qt Creator.
- Ensure all dependencies are configured (Qt Quick, Qt Quick Controls, Qt SVG).
- Build and run the project using the green Play button in Qt Creator.
- Alternative: Use the command line with
- cmake --build . in the build directory.
For deployment, build a release version and run:
``windeployqt.exe --qmldir C:/path/to/your/source --release C:/path/to/your/build-release/apphamilton.exe``
- You can use Enigma Virtual Box to package everything into one .exe file.
- The deployed version should run on Windows without problems.
