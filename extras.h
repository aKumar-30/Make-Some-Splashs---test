#ifndef EXTRAS_H
#define EXTRAS_H

#include <QObject>
#include <array>
class Extras : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    Q_PROPERTY(QString endingPage READ endingPage WRITE setEndingPage NOTIFY endingPageChanged)
public:
    explicit Extras(QObject *parent = nullptr);

    bool isOpen() const;
    void setIsOpen(bool isOpen);

    QString endingPage() const;
    void setEndingPage(QString endingPage);

    //no uso
    Q_INVOKABLE void emittingSwitchFilesSignal();
    Q_INVOKABLE void emittingGoToHalftimeSignal();
    Q_INVOKABLE void emittingGoBackFromHalftimeSignal(int points1);

signals:
    void isOpenChanged(bool isOpen);

    void somethingCompetitiveChanged();
    
    void endingPageChanged(QString endingPage);

    void soundChanged(double sound);
    //no uso
    void goToHalftime();
    void goBackFromHalftime(int points1 = 0);


private:
    bool m_isOpen;
    QString m_endingPage;
};

#endif // EXTRAS_H
