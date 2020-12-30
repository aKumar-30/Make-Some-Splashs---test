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
PRODUCT_VERSION_NAME = 17.0.0
PRODUCT_VERSION_CODE = 17

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "9D300260B5208C490E08196ED18F9F036A2EB50DE8F930B4DC68455EAEB703945F92EC8F386AF50FF3E617352658BF741954EEA4126E86EE5DCF3EF38D22B116A4F3C3896A07D3240A8FA1D8D7262F7F7365DDC9066F73D9DEF3E1461B46BB8CFE3F60A3AC03498E35114F2537F6F97E696B60D401F0159EFAEC136E3AA6BCC84E36501C9FA11F4DAC3C5B40CC835EAF8277DDC7B66E0BFD47623CE5E1543A7387AF1E8E46B57535C350DE3ABCED9B8DB2D187C89BF7016EACF37CE00D4ABFA7BA1EF7F5F94E42B7C7BEAC3A53AE155B6E343F5DF4C97E655BB730E04804B494B9A2A6FE11FD2CDEA0951F812CFC94CC5568AFE7D48F0C29B3650E0129D4FC1C5083C01FF9A464E271DE1359192DA1E5937B27757ABE43013ECE7A53962F4677837D0BE5C32C2E5BFF128459016500DE401AFDDD5F6870B7265C769FAA1DE57001C782BC57F4693BBDBF0624C7E20546"

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
    qml/CircularProgress.qml \
    qml/CompetitiveMode.qml \
    qml/CustomCDialog.qml \
    qml/CustomHDialog.qml \
    qml/CustomSDialog.qml \
    qml/CustomWDialog.qml \
    qml/GameStore.qml \
    qml/HalftimeBall.qml \
    qml/HalftimeMode.qml \
    qml/Main.qml \
    qml/MissionsDelegate.qml \
    qml/MyAnimation.qml \
    qml/NoShowDelegate.qml \
    qml/test.js
