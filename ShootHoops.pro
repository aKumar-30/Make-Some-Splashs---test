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
PRODUCT_VERSION_NAME = 13.0.0
PRODUCT_VERSION_CODE = 13

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "2304E8C0A0DB3176F3B9A636B9E5C60EFE8912389B4D8DB6436CF7643F90115CC7BEA68516E43DFEF3ECA398315873E804681A6D86D5A91C08EC0C8D800CBACD396335BB6138A290F3D49848ADE7726E4D08171AEDEB01DBA55FF850F4D335DD7A39A52910343814A9652F6CCC0B04E7ECF6A899A6341F6949156CE68E240106CDC1B686F58F6B97667556BA71E625E1F48665BD4EFD198F0EA98C521A3CA00C62A4A1BDEF1E2D4FBE0963DB138A5C7CA7F5CCF50729B05D222AEFB3EAADD4E8EC5037C004A4A7679F1EB7F1E9DB1BC0AC533FEBF77FF24C48E69E79AE77FE1EEF5BD2129E1E26E8B078659BEFCDD58281AA16B70FA57C31DE0BF2D5053F2A89FCC20AF6475FA2DCE07D6053EAB7BFE18E325C60D3D964372AFEFE5210BA1B971D0D1D8D852975B1424C3CBE4AAB26BBD8F5132021389A95FDD999451A375E5E35158C6C7F2FDB0930D5736F8F95715D"

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
