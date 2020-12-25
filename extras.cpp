#include "extras.h"
Extras::Extras(QObject *parent) : QObject(parent), m_endingPage(""), m_isOpen(false)
{}

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

//no uso
void Extras::emittingSwitchFilesSignal(){
    emit somethingCompetitiveChanged();
}
void Extras::emittingGoToHalftimeSignal(){
    emit goToHalftime();
}
void Extras::emittingGoBackFromHalftimeSignal(int points1=0){
    emit goBackFromHalftime(points1);
}

QString Extras::endingPage() const
{
    return m_endingPage;
}

void Extras::setEndingPage(QString endingPage)
{
    if (m_endingPage == endingPage)
        return;

    m_endingPage = endingPage;
    emit endingPageChanged(m_endingPage);
}
