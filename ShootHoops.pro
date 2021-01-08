# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
QT += quick quickcontrols2
CONFIG += felgo
CONFIG += c++11
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
#CONFIG += felgo-live
#CONFIG += resources_big
# FELGO_PLUGINS += admob

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = us.satishkumar.arjun.ShootHoops
PRODUCT_VERSION_NAME = 3.0.0
PRODUCT_VERSION_CODE = 3

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "4A362270AEC1DA2DB0ACCC66E7FC41B4BE529C519299B0E4364E611F78C7EEE82769A0F73165B56D75B3B6C947161F8A0E0A05944FAE8DB3C65F9E48A6384F06A89DB08348995BD8CD0DCF10F7E4773605FC32A0B57FCC3A0091E6A0024DCD2BFCA36F8981B8FF1FBF60B521DC4E07B5B7E0D32F53C4B264A81EC4A391A1D6FDC9BDC4BE73A4B79AC8229A4C34A0422513ABC521696C8A08CF0B942232016A42DE0C5C464BF75CE2FAB978093286B8D03D61F1A0DCA2D328FC4D30037CAB5760EAC1D7893756E15A19ABB99EB9291A596B833F13F5561A57FCFAB3F7201952985341D18D4A96192D973964F64F4F720F4A82F9186209A7AE537CC643FEE44A46CCEA21764DB66C9DD2297A8582C84E5B8040E6A4F55F2D53F762828E8E098C2AD851370BBD059BE1EC39681E1345FB54340A164D06E93BF5E69E3C535C27CEDB"

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
