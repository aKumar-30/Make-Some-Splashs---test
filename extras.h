#ifndef EXTRAS_H
#define EXTRAS_H

#include <QObject>

class Extras : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    Q_PROPERTY(int numCoins READ numCoins WRITE setNumCoins NOTIFY numCoinsChanged)
public:
    explicit Extras(QObject *parent = nullptr);
    double volume() const;
    void setVolume(double volume);
    bool isOpen() const;
    void setIsOpen(bool isOpen);

    int numCoins() const;
    void setNumCoins(int numCoins);

signals:
    void volumeChanged(double volume);
    void isOpenChanged(bool isOpen);
    void numCoinsChanged(int numCoins);

private:
    double m_volume;
    bool m_isOpen;
    int m_numCoins;
};

#endif // EXTRAS_H
