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
int main(int argc, char *argv[])
{
    //Prob only need this or...
    QGuiApplication::setApplicationName("Make some Splashs!");
    QGuiApplication::setOrganizationName("someOrganization");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //App information
    app.setOrganizationName("someOrganization");
    app.setOrganizationDomain("someOrganization.com");
    app.setApplicationName("Make some splashs!");

    QSettings settings;
    QString style = QQuickStyle::name();
    if (!style.isEmpty()){
        qDebug()<<"Warriors";
        settings.setValue("style", style);
     }
    else{
        qDebug()<<"zaza";
        QQuickStyle::setStyle(settings.value("style").toString());
   }
    Extras extra;
    QQmlApplicationEngine engine;
    SettingsManager dude;
    qmlRegisterType<SettingsManager>("Arjun", 1, 0, "SettingsManager");
    engine.rootContext()->setContextProperty("Extra", &extra);
//    engine.rootContext()->setContextProperty("mSettings", &dude);
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());

//    double volume1 = extra.volume();
//    if (!settings.contains("volume1243")){
//        settings.setValue("volume1243", volume1);
//     }
//    else{
//        extra.setVolume(settings.value("volume1243").toDouble());
//   }
    double volume1 = extra.volume();
    if(!settings.contains("volume0100"))
        dude.writeSettings("volume0100", volume1);
    else
        extra.setVolume(SettingsManager::loadSettings());


    engine.load(QUrl("qrc:/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

     qDebug()<<"Helloworld";

    return app.exec();
}


