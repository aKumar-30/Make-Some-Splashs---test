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
#include <iostream>
#include "settingsmanager.h"
#include <iostream>
#include <ctime>
#include <QTime>
#include "flashingtimer.h"
QTime allTheTimeStuff();

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

    //All the timer things

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

    FlashingTimer joe(allTheTimeStuff());
    Extras extra;
    QQmlApplicationEngine engine;
    SettingsManager dude;
    qmlRegisterType<SettingsManager>("Arjun", 1, 0, "SettingsManager");
    //one thing to note is that is you want to change something in c++ (say with a timer) and want to automatically have it update in QML use setContextObject with the object instead of setObjectProperty
   engine.rootContext()->setContextObject(&joe);
    engine.rootContext()->setContextProperty("Extra", &extra);
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());

    double volume1 = extra.volume();
    if(!settings.contains("volume0100"))
        dude.writeSettings("volume0100", volume1);
    else
        extra.setVolume(SettingsManager::loadSettings("volume0100").toDouble());


    double numCoins1 = extra.numCoins();
    if(!settings.contains("numCoins21"))
        dude.writeSettings("numCoins21", numCoins1);
    else
        extra.setNumCoins(SettingsManager::loadSettings("numCoins21").toInt());

    QString ballSource1 = extra.ballSource();
    if(!settings.contains("ballSource"))
        dude.writeSettings("ballSource", ballSource1);
    else
        extra.setBallSource(SettingsManager::loadSettings("ballSource").toString());

    engine.load(QUrl("qrc:/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    qDebug()<<"Helloworld";

    return app.exec();
}


QTime allTheTimeStuff(){
  QTime now= QTime::currentTime();
  //Make and save tomorrow
  QSettings settings;
  SettingsManager dude;
  QTime tomorrow=now.addSecs(86399);
  if(!settings.contains("whatIsTomorrow"))
      dude.writeSettings("whatIsTomorrow", tomorrow);
  else{
      tomorrow = SettingsManager::loadSettings("whatIsTomorrow").toTime();
  }
  qDebug()<<(tomorrow);
  qDebug()<< now;
  return tomorrow;

}

