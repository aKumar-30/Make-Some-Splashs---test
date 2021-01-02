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
PRODUCT_VERSION_NAME = 23.0.0
PRODUCT_VERSION_CODE = 23

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
<<<<<<< HEAD
PRODUCT_LICENSE_KEY = "03E053C7C8F7A7A1D7129C2B8130AC3A38A0213F4BA7848FD134AF1D8346057CD8816B8EDBEE6A9088AF58E0F5F4212D46D8A7E53DBD2348F0185167FC56D2C128C41B02CC8795C87A994CF1B630EB3E516C421724EF7E1C1A29607B10A67A5B31ED34E250EB90FB0DBEAF66F7A216F5B2548C10D5C2FFF0CF08FC2212FEF0FFC131CE2FA817206E00CD2A78CBDE699B897ADF1D67FCABAE4493296340412CEFBEFDA9E48019BB04D53615DB6A9C506EDAF024F719F23C8D2BF9E9FF9C471952AA397BC808B6FB4EB9953DBF09A6E5A620269DB28CE11476D906924896D1009D63EACFEFFFFC612F8FABDA371C9BB7D8E17DB7D56D54F28BB88BBB7E7764FD1AB4C96405C6C56497F0D7BFCC38EE23D8D64022F5F5773E4C3D93684EDB42AEE0AB3074B3D74657D2E5CE320C7D3CE89784BA65AC1DA5B140F80469B9CFE70F15F71C002381A494E7E7C8A44F60485A66"
=======
PRODUCT_LICENSE_KEY = "2BCA7E684C35BBB4EAB46869CEE51BF6CADC0D6662A78B9223522B20B2D98C4D05BADF51A7E9A258C70F8B800E278FD8F4AFEA611015B2C684FB78C4BE5648A99CD75A8F318F334CDD73AA2FD5178AB294D5A9363B8DA38ADE027DAC0993C0D1F82D26102A9C1F785FDBDC6C3D8977AA6A5AF72EC405FBC91D0B06195517701C599C37AE8E343F5E3D29A49A8E329045C7519F29FB0626F9F05863484247DEC2A9E19BD9B21514E89C3D021037C0D33E0A11463E076E98346FF289BF5B39586B7FC5BAED925A74A3EB19E25D848AC1E616E990712052FED0A60D3E5254EDA7CD1DADE78A4B46C76F2BDBF441CDE0709B458D517A5C1C355ED0B47E1D7B69DD121A7764F5EC768D98A3B6DF12C96CCBBE8D125123A9D50D8B9E466BA3F0664835BA13565202EA2B137CE929EE53B389B38BC19FB9940D32FC745C0AFE201FD4A067DFCA10C2782D972EE155A77948BDDA"
>>>>>>> parent of eea02f1... still trying

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
