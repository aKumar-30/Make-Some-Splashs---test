#ifndef FLASHINGTIMER_H
#define FLASHINGTIMER_H

#include <QObject>
#include <QTimer>
#include <QDateTime>
class FlashingTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString whatToPrint READ whatToPrint WRITE setWhatToPrint NOTIFY whatToPrintChanged)
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

    int difference() const;
    void setDifference(int difference);

private:
    QDateTime tomorrow;
    QTimer *timer;
    QString m_whatToPrint;
    int m_difference;

signals:
    void callUpdateMissions();
    void whatToPrintChanged(QString whatToPrint);
    void differenceChanged(int difference);
};

#endif // FLASHINGTIMER_H
