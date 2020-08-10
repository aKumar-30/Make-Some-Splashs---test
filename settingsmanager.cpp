#include "settingsmanager.h"

SettingsManager::SettingsManager(QObject *parent) : QObject(parent)
{

}

double SettingsManager::loadSettings()
{
    // .ini format example
    QSettings settings(thing(), QSettings::NativeFormat);
    return settings.value("volume0100",0).toDouble();
}

 void SettingsManager::writeSettings(const QString &key, const QVariant &variant)
{
    QSettings settings (thing(), QSettings::NativeFormat);
    settings.setValue(key, variant);
}

QString SettingsManager::thing(){
    QSettings settings;
    return settings.fileName();
}
