#ifndef FLASHINGTIMER_H
#define FLASHINGTIMER_H

#include <QObject>
#include <QTimer>
#include <QDateTime>
class FlashingTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString whatToPrint READ whatToPrint WRITE setWhatToPrint NOTIFY whatToPrintChanged)
    Q_PROPERTY(int difference READ difference WRITE setDifference NOTIFY differenceChanged)
public:
    explicit FlashingTimer(QDateTime tomorrow=QDateTime::currentDateTime(),QObject *parent=nullptr);
    QString whatToPrint() const;
    void setWhatToPrint(QString whatToPrint);
    void display();
    void setQmlRootObject(QObject *value);
    void functionToCallToUpdateMissions();
    //copy contructor and copy assignment
    FlashingTimer(const FlashingTimer &source);
    FlashingTimer& operator=(const FlashingTimer &rhs);

private:
    QDateTime tomorrow;
    QTimer *timer;
    int difference;
    QString m_whatToPrint;

signals:
    void callUpdateMissions();
    void whatToPrintChanged(QString whatToPrint);
};

#endif // FLASHINGTIMER_H
