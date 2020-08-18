#include "extras.h"

Extras::Extras(QObject *parent) : QObject(parent), m_volume(0.0), m_isOpen(false), m_numCoins(64),
    m_ballSource("file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/basket_ball.png"),m_personalBest(1243), m_datastore(""), m_miniStore("")
{

}

double Extras::volume() const
{
    return m_volume;
}

void Extras::setVolume(double volume)
{
    if (m_volume == volume)
        return;

    m_volume = volume;

    emit volumeChanged(m_volume);
}

bool Extras::isOpen() const
{
    return m_isOpen;
}

void Extras::setIsOpen(bool isOpen)
{
    if (m_isOpen == isOpen)
        return;

    m_isOpen = isOpen;
    emit isOpenChanged(m_isOpen);
}

int Extras::numCoins() const
{
    return m_numCoins;
}

void Extras::setNumCoins(int numCoins)
{
    if (m_numCoins == numCoins)
        return;

    m_numCoins = numCoins;
    emit numCoinsChanged(m_numCoins);
}

QString Extras::ballSource() const
{
    return m_ballSource;
}

void Extras::setBallSource(QString ballSource)
{
    if (m_ballSource == ballSource)
        return;

    m_ballSource = ballSource;
    emit ballSourceChanged(m_ballSource);
}

int Extras::personalBest() const
{
    return m_personalBest;
}

void Extras::setPersonalBest(int personalBest)
{
    if (m_personalBest == personalBest)
        return;

    m_personalBest = personalBest;
    emit personalBestChanged(m_personalBest);
}

QString Extras::datastore() const
{
    return m_datastore;
}

void Extras::setDatastore(QString datastore)
{
    if (m_datastore == datastore)
        return;

    m_datastore = datastore;
    emit datastoreChanged(m_datastore);
}

QString Extras::miniStore() const
{
    return m_miniStore;
}

void Extras::setMiniStore(QString miniStore)
{
    if (m_miniStore == miniStore)
        return;

    m_miniStore = miniStore;
    emit miniStoreChanged(m_miniStore);
}
