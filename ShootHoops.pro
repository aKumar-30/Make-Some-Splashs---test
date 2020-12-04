# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
QT += quick quickcontrols2
CONFIG += felgo
CONFIG += c++11
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
#CONFIG += felgo-live
CONFIG += resources_big
# FELGO_PLUGINS += admob

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.ShootHoops.wizardEVP.FelgoCompetitiveBallTryOne
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "3921371E5ED8D6EFBA3502F02EE5BFB36CE3BA998659F3658D7F689F76F165C36568CB821B7BF38D1D8883B5B5BBCB42F0093D897A101EBE67C5EFC7F8CD503D13273675E1EC050F3723BBFF13E0A17EEBFBDABB5416A97B54EA2848449CFA4DEDE6397FD1EC77FF393660CBC5FB8026B15E6A3B94B99DF13FE8D25306ACD6DF0141AAD44C0B55A6EB083F0204C2A43C511746E5EC19C27B2553FD3ECB3E5953C09A8B66DFED53FDE0B8E9E3BB6E4F9FE4E249ADE762344822F47FD9D1CF21819114EBB7A4BA201D3B22F3B275EA25F1DA7B9ADBA7FAD86C25C3C70C805577B789E57AC7B09D69399ECC5542BC17E0D88282D67832FF05172FAEC3E3DE6F42E13D4DD64720F2E0D90F0E1E950F5B2B752D0AD0A74740FC43F51529FBCB244D8D888DD84A3EE5F8CD02224B843E8892F698536D1A4BCE38C154498B471664A229CA43091613E7BD42A77E4C0AF9327B3E"

qmlFolder.source = qml
#DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

 RESOURCES += resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    extras.cpp \
    flashingtimer.cpp \
    mytimer.cpp \
    settingsmanager.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

HEADERS += \
    extras.h \
    flashingtimer.h \
    mytimer.h \
    settingsmanager.h

DISTFILES += \
    CustomWDialog.qml \
    qml/BallImage.qml \
    qml/CircularProgress.qml \
    qml/CompetitiveMode.qml \
    qml/CustomCDialog.qml \
    qml/CustomHDialog.qml \
    qml/CustomSDialog.qml \
    qml/CustomSettingsDialog.qml \
    qml/CustomWDialog.qml \
    qml/CustomizationMode.qml \
    qml/GameStore.qml \
    qml/HalftimeBall.qml \
    qml/HalftimeMode.qml \
    qml/Main.qml \
    qml/MyAnimation.qml \
    qml/MyAnimationCustom.qml \
    qml/SliderCustomChaos.qml \
    qml/test.js
