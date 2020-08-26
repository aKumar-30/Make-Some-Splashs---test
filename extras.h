#ifndef EXTRAS_H
#define EXTRAS_H

#include <QObject>
#include <array>
class Extras : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    Q_PROPERTY(int numCoins READ numCoins WRITE setNumCoins NOTIFY numCoinsChanged)
    Q_PROPERTY(QString ballSource READ ballSource WRITE setBallSource NOTIFY ballSourceChanged)
    Q_PROPERTY(int personalBest READ personalBest WRITE setPersonalBest NOTIFY personalBestChanged)
    Q_PROPERTY(QString datastore READ datastore WRITE setDatastore NOTIFY datastoreChanged)
    Q_PROPERTY(QString miniStore READ miniStore WRITE setMiniStore NOTIFY miniStoreChanged)
    Q_PROPERTY(QString myMissionsRn READ myMissionsRn WRITE setmyMissionsRn NOTIFY myMissionsRnChanged)
public:
    explicit Extras(QObject *parent = nullptr);

    double volume() const;
    void setVolume(double volume);

    bool isOpen() const;
    void setIsOpen(bool isOpen);

    int numCoins() const;
    void setNumCoins(int numCoins);

    QString ballSource() const;
    void setBallSource(QString ballSource);

    int personalBest() const;
    void setPersonalBest(int personalBest);

    QString datastore() const;
    void setDatastore(QString datastore);

    QString miniStore() const;
    void setMiniStore(QString miniStore);
    
    QString myMissionsRn() const;
    void setMyMissionsRn(QString myMissionsRn);

    Q_INVOKABLE void emittingSwitchFilesSignal();
    Q_INVOKABLE void emittingSpaceInCompSignal();
    Q_INVOKABLE void emittingSpaceInCustSignal();
    
signals:
    void volumeChanged(double volume);
    void isOpenChanged(bool isOpen);
    void numCoinsChanged(int numCoins);
    void ballSourceChanged(QString ballSource);
    void personalBestChanged(int personalBest);
    void datastoreChanged(QString datastore);
    void miniStoreChanged(QString miniStore);
    void myMissionsRnChanged(QString myMissionsRn);

    void somethingCompetitiveChanged();
    void spaceClickedInComp();
    void spaceClickedInCust();
    
private:
    double m_volume;
    bool m_isOpen;
    int m_numCoins;
    QString m_ballSource;
    int m_personalBest;
    QString m_datastore;
    QString m_miniStore;
    QString m_myMissionsRn;
};

#endif // EXTRAS_H
