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
#include <FelgoApplication>
#include <QApplication>
#include <FelgoLiveClient>
FlashingTimer allTheTimeStuff();

int main(int argc, char *argv[])
{
    //Prob only need this or...
    QGuiApplication::setApplicationName("Shoot Hoops");
    QGuiApplication::setOrganizationName("shootHoops");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication appy(argc, argv);

    //App information
    appy.setOrganizationName("shootHoops");
    appy.setOrganizationDomain("shootHoops.com");
    appy.setApplicationName("Shoot Hoops");

    QApplication app(argc, argv);
    FelgoApplication felgo;
//    felgo.setPreservePlatformFonts(true);
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
    qmlRegisterType<SettingsManager>("Lebron2", 1,0, "SettingsManager");
    //one thing to note is that is you want to change something in c++ (say with a timer) and want to automatically have it update in QML use setContextObject with the object instead of setObjectProperty
    engine.rootContext()->setContextObject(&joe);
    engine.rootContext()->setContextProperty("FlashingTimer",&joe);
    engine.rootContext()->setContextProperty("Extra", &extra);
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());

    //save volume
    double volume1 = extra.volume();
    if(!settings.contains("VolumE"))
        dude.writeSettings("VolumE", volume1);
    else
        extra.setVolume(SettingsManager::loadSettings("VolumE").toDouble());

    //save sound
    double sound1 = extra.sound();
    if(!settings.contains("SounD"))
        dude.writeSettings("SounD", sound1);
    else
        extra.setSound(SettingsManager::loadSettings("SounD").toDouble());
    //save coins
    double numCoins1 = extra.numCoins();
    if(!settings.contains("CoinS"))
        dude.writeSettings("CoinS", numCoins1);
    else
        extra.setNumCoins(SettingsManager::loadSettings("CoinS").toInt());

    //save ball source
    QString ballSource1 = extra.ballSource();
    if(!settings.contains("BallSourcE"))
        dude.writeSettings("BallSourcE", ballSource1);
    else
        extra.setBallSource(SettingsManager::loadSettings("BallSourcE").toString());

    //save personal best
    int personalBest1 = extra.personalBest();
    if(!settings.contains("PersonalBesT")){
        dude.writeSettings("PersonalBesT",personalBest1);
    }
    else
        extra.setPersonalBest(SettingsManager::loadSettings("PersonalBesT").toInt());

    //set datastore
    QString datastore1 = extra.datastore();
    if(!settings.contains("DatastorEEEEEE")){
        dude.writeSettings("DatastorEEEEEE",datastore1);
    }
    else
        extra.setDatastore(SettingsManager::loadSettings("DatastorEEEEEE").toString());

    //set myMissionsRn
    QString myMissionsRn1{};
    if(!settings.contains("MissionSSSSSS")){
        dude.writeSettings("MissionSSSSSS",myMissionsRn1);
    }
    else{
        extra.setMyMissionsRn(SettingsManager::loadSettings("MissionSSSSSS").toString());
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
    if(!settings.contains("TimE"))
        dude.writeSettings("TimE", tomorrow);
    else{
        tomorrow = SettingsManager::loadSettings("TimE").toDateTime();
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


FlashingTimer allTheTimeStuff();

int main(int argc, char *argv[])
{
    //Prob only need this or...
    QGuiApplication::setApplicationName("Shoot Hoops");
    QGuiApplication::setOrganizationName("shootHoops");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        QGuiApplication appy(argc, argv);

        //App information
        appy.setOrganizationName("someOrganization");
        appy.setOrganizationDomain("someOrganization.com");
        appy.setApplicationName("Make some splashs!");

    QApplication app(argc, argv);
    //App information
    appy.setOrganizationName("shootHoops");
    appy.setOrganizationDomain("shootHoops.com");
    appy.setApplicationName("Shoot Hoops");

    FelgoApplication felgo;
//    felgo.setPreservePlatformFonts(true);
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
    qmlRegisterType<SettingsManager>("Lebron2", 1,0, "SettingsManager");
    //one thing to note is that is you want to change something in c++ (say with a timer) and want to automatically have it update in QML use setContextObject with the object instead of setObjectProperty
    engine.rootContext()->setContextObject(&joe);
    engine.rootContext()->setContextProperty("FlashingTimer",&joe);
    engine.rootContext()->setContextProperty("Extra", &extra);
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());

    //save volume
    double volume1 = extra.volume();
    if(!settings.contains("VolumEE"))
        dude.writeSettings("VolumEE", volume1);
    else
        extra.setVolume(SettingsManager::loadSettings("VolumEE").toDouble());

    //save sound
    double sound1 = extra.sound();
    if(!settings.contains("SounDD"))
        dude.writeSettings("SounDD", sound1);
    else
        extra.setSound(SettingsManager::loadSettings("SounDD").toDouble());
    //save coins
    double numCoins1 = extra.numCoins();
    if(!settings.contains("CoinSS"))
        dude.writeSettings("CoinSS", numCoins1);
    else
        extra.setNumCoins(SettingsManager::loadSettings("CoinSS").toInt());

    //save ball source
    QString ballSource1 = extra.ballSource();
    if(!settings.contains("BallSourcEE"))
        dude.writeSettings("BallSourcEE", ballSource1);
    else
        extra.setBallSource(SettingsManager::loadSettings("BallSourcEE").toString());

    //save personal best
    int personalBest1 = extra.personalBest();
    if(!settings.contains("PersonalBesTT")){
        dude.writeSettings("PersonalBesTT",personalBest1);
    }
    else
        extra.setPersonalBest(SettingsManager::loadSettings("PersonalBesTT").toInt());

    //set datastore
    QString datastore1 = extra.datastore();
    if(!settings.contains("Datastory")){
        dude.writeSettings("Datastory",datastore1);
    }
    else
        extra.setDatastore(SettingsManager::loadSettings("Datastory").toString());

    //set myMissionsRn
    QString myMissionsRn1{};
    if(!settings.contains("Missionsy")){
        dude.writeSettings("Missionsy",myMissionsRn1);
    }
    else{
        extra.setMyMissionsRn(SettingsManager::loadSettings("Missionsy").toString());
    }

    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));
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

