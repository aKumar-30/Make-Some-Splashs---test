# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
QT += quick quickcontrols2
CONFIG += felgo
CONFIG += c++11
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
CONFIG += felgo-live
CONFIG += resources_big
# FELGO_PLUGINS += admob

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.ShootHoops.wizardEVP.FelgoCompetitiveBallTryOne
PRODUCT_VERSION_NAME = 24.0.0
PRODUCT_VERSION_CODE = 24

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "03AC10505F7B57CD05AFEAF295FB82709E09FB2D67AF811CFB4F4685BA59F28ED5D995B64F4B10D1F8E29719AEBE730E1AAFC4A6C8F422EEA64E4D730227F9CA8F7BCA305799113CE178CCDBDF56DABBD3F311E87C5AA1A047F44D55706EDEA3642DD164297D8DCF1621C39215EF4451653B594F86D3AF5CEC09C82CD5951D9E2D61E526223225A9FD74D29D87F8672EFAF458866729ADCF9AA82C89F08CDEB2777A0B87E22BFA31D8F61A4851AA59D5B0E8AD0156253AFF4FD55593CB96FBB759950A900DCF2A7F6CB012DEEC3DDEFFE748410822CD76710468882A97301EC4A6C47DE3430A134D3AE0428D0CB43E5D0897734484BE6AE95EFA065B2827CF84A4C5FE7D687E50D7C5454EC5079D38392EF65E559D7BAB1A8A96256D218DABE050B63D04EA22E9C76ECC1FCDAC08F717C10C9E2AEA8C62C74D8EBB642DE069F1DF47F5B81FF91F8B903DD916266BC182"

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
    qml/MyAnimation.qml \
    qml/test.js
