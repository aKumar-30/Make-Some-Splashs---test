#include "extras.h"

Extras::Extras(QObject *parent) : QObject(parent), m_volume(0.0), m_isOpen(false)
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
