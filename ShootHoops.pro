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
PRODUCT_VERSION_NAME = 10.0.0
PRODUCT_VERSION_CODE = 10

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "F306B7452CC258BD72D5D66E3BC53B0F95F687B1D83B43298EE2CCD38523C4F7799970D20DD203B9636C4190E62148BD4C64101738E10CEAF3EC149AAD460E8A49473CB5119DB1E55F5A4E9781632B8A702635C4D2910918D0C188F1F7C417962F7DF4516E4EFBBF9E5CDD01CCCBE856412A38D8E15604B5C86182BEA06B070488B8608D9379F8DCADB2A4B8948948E14454ACB26864DFE3AB4352B7288814F04707E64BC5BA2039DEB43031C58040D14C57FC09D9DD44D47D44EA7D949DC00AD9E1EC68D643E5D43C42E40FF843F1A513CD6E8E309B1F44F7988CA54EE5B4B53F0097A1B82AEEC458A1A07193DD134AF82DC801D15D9994CCC49229A01E38E2C7CAD0D982DEB75188A6427BB76B363FAD72F2145D175FD0C842BD937B02688486F93DE6B9ED90F4B4FE510FB4C5A0540BB8D01C50669162FD3191A94BE8F8C3"

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
