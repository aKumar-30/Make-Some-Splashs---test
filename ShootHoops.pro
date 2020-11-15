# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
QT += quick quickcontrols2
CONFIG += felgo
CONFIG += c++11
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live
# FELGO_PLUGINS += admob

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.ShootHoops.wizardEVP.ShootHoops
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
 PRODUCT_LICENSE_KEY = "91AC701AF99A93DD201D7DD57BB6F69C6DECFABA6E9FA8E8107328528216AA4C117B8A69CAFBCD9A858DC6F332D0619ABF4AB8D6C1CD5F1C881A6BF754F1A236E68F658D2807DCEF97A25C1E1FF39EBB75A715C2265A5AAA9B92409742FEE06DEFAA3F1FA1CB370CBA08064B74ADF906CD1B1DB53B6177CD8E99DA84107D66C73F588B4800CEF459640FB887264B9AD61E5C44FE629B3E3D47A11CF6FD5DBF1DDBF52638AAE0B2EA969E0DE98757088F81CE4F96BF8F9EA3199884515843557B0EFF45E32D74FD0BD9AFB25E7DC0AFC492BEB05171CB4A016355271F3203D68BBF455E3B7FD4D2D10469D99BC0A41AC89D65362631DD1EA8D71845F94B64AE83EA624DE1F51B1E7A5AED7EDABF3060676B2C505CFB778EE357A63C17AB87798D374823C37E8BF8FE434CD5C1A12FC0963948015BEE71614ACD7B5CC605AA881FE5C4E8D0C79DED9F0D0650EABA5BB2D9BB42B549685E7A0C37940FD6DB2AD5BD"

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
    qml/test.js
