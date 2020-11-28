# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
QT += quick quickcontrols2
CONFIG += felgo
CONFIG += c++11
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live
CONFIG += resources_big
# FELGO_PLUGINS += admob

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.ShootHoops.wizardEVP.ShootHoops
PRODUCT_VERSION_NAME = 9.0.0
PRODUCT_VERSION_CODE = 9

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "B5C609EF98786E8F0D6D407E9C7EE85ACFE2ACAE87222A7A98B46D78C12C7026F7D9C5BF802FD970AB605D8C59D587E40F1ACAEBEF8C0D7C5A2415B9901AB2CA8663184F57F79F0963AD313290555BDCF71F7A7B10C4BD26D16E0DAC1A3289B419EBDE08BE0C8EC5523115607437D1F701ED486B8C239B411777D33B82A364195C73C2EED872D69B7B1DFAB5512189A601344B198CF815C531979E0DCE27816A5C501D7EDAE7549CB047BA0C6E540E17222E7D4A995985161933C1C7EBA3E1D6ED70A45DF07ADD79559B229BFE62D56A54BC7784F06B746236D1FB1307695BDE77B921601E3711F239BBB87BC45281B71C3B6D06A40803EEAAA63F4DA9875180007D4FB5AC1BAA52F09D6DEAE74F6A00416CFE785DDC14CAA01519EC5244FEEF57F00AE0EBB397D06BD89BB736A1BFA2728E08EEE6393113CEA64AC9AA799C3B"

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
