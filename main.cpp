#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QIcon>
#include <QQmlContext>
#include <QDebug>
#include "extras.h"
#include <QQuickView>
#include "settingsmanager.h"
#include <QTime>
#include <QDateTime>
#include <array>
#include "flashingtimer.h"
#include <string>
#include "mytimer.h"
#include <FelgoLiveClient>
#include <FelgoApplication>

FlashingTimer allTheTimeStuff();

int main(int argc, char *argv[])
{
    //Prob only need this or...
    QGuiApplication::setApplicationName("Make some Splashs!");
    QGuiApplication::setOrganizationName("someOrganization");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication appy(argc, argv);

    //App information
    appy.setOrganizationName("someOrganization");
    appy.setOrganizationDomain("someOrganization.com");
    appy.setApplicationName("Make some splashs!");

    QApplication app(argc, argv);
    FelgoApplication felgo;
    felgo.setPreservePlatformFonts(true);
    QQmlApplicationEngine engine;
    felgo.initialize(&engine);
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

    //sends when i break a property binding
//    QLoggingCategory::setFilterRules(QStringLiteral("qt.qml.binding.removal.info=true"));
    //All the settings things
    QSettings settings;
    QString style = QQuickStyle::name();
    if (!style.isEmpty()){
        settings.setValue("style", style);
    }
    else{
        QQuickStyle::setStyle(settings.value("style").toString());
    }

    FlashingTimer joe = allTheTimeStuff();
    Extras extra;
    SettingsManager dude;
    qmlRegisterType<MyTimer>("otherArjun2", 1, 2, "MyTimer");
    qmlRegisterType<SettingsManager>("Lebron", 1, 0, "SettingsManager");
    //one thing to note is that is you want to change something in c++ (say with a timer) and want to automatically have it update in QML use setContextObject with the object instead of setObjectProperty
    engine.rootContext()->setContextObject(&joe);
    engine.rootContext()->setContextProperty("FlashingTimer",&joe);
    engine.rootContext()->setContextProperty("Extra", &extra);
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());

    //save volume
    double volume1 = extra.volume();
    if(!settings.contains("volume01001"))
        dude.writeSettings("volume01001", volume1);
    else
        extra.setVolume(SettingsManager::loadSettings("volume01001").toDouble());

    //save sound
    double sound1 = extra.sound();
    if(!settings.contains("sound01001"))
        dude.writeSettings("sound01001", sound1);
    else
        extra.setSound(SettingsManager::loadSettings("sound01001").toDouble());
    //save coins
    double numCoins1 = extra.numCoins();
    if(!settings.contains("numCoins211"))
        dude.writeSettings("numCoins211", numCoins1);
    else
        extra.setNumCoins(SettingsManager::loadSettings("numCoins211").toInt());

    //save ball source
    QString ballSource1 = extra.ballSource();
    if(!settings.contains("ballSource1"))
        dude.writeSettings("ballSource1", ballSource1);
    else
        extra.setBallSource(SettingsManager::loadSettings("ballSource1").toString());

    //save personal best
    int personalBest1 = extra.personalBest();
    if(!settings.contains("personalBest55551")){
        dude.writeSettings("personalBest55551",personalBest1);
    }
    else
        extra.setPersonalBest(SettingsManager::loadSettings("personalBest55551").toInt());

    //set datastore
    QString datastore1 = extra.datastore();
    if(!settings.contains("zzzz")){
        dude.writeSettings("zzzz",datastore1);
    }
    else
        extra.setDatastore(SettingsManager::loadSettings("zzzz").toString());

    //set myMissionsRn
    QString myMissionsRn1{};
    if(!settings.contains("aaaa")){
        dude.writeSettings("aaaa",myMissionsRn1);
    }
    else{
        extra.setMyMissionsRn(SettingsManager::loadSettings("aaaa").toString());
    }

    FelgoLiveClient client (&engine);

    return app.exec();
}


FlashingTimer allTheTimeStuff(){
    QDateTime now= QDateTime::currentDateTime();
    //Make and save tomorrow
    QSettings settings;
    SettingsManager dude;
    QDateTime tomorrow=now.addSecs(86399);
    if(!settings.contains("jamesHarden?1"))
        dude.writeSettings("jamesHarden?1", tomorrow);
    else{
        tomorrow = SettingsManager::loadSettings("jamesHarden?1").toDateTime();
    }
    FlashingTimer joe(tomorrow);
    return joe;
}

// Default message handler to be called to bypass all other warnings.
static const QtMessageHandler QT_DEFAULT_MESSAGE_HANDLER = qInstallMessageHandler(0);
// a custom message handler to intercept warnings
void customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString & msg)
{
    switch (type) {
    case QtWarningMsg: {
        if (!msg.contains("Unable to assign [undefined] to int")){ // suppress this warning
            (*QT_DEFAULT_MESSAGE_HANDLER)(type, context, msg); // bypass and display all other warnings
        }
    }
    break;
    default:    // Call the default handler.
        (*QT_DEFAULT_MESSAGE_HANDLER)(type, context, msg);
        break;
    }
}
