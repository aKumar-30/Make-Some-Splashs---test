#ifndef FLASHINGTIMER_H
#define FLASHINGTIMER_H

#include <QObject>
#include <QTimer>
#include <QTime>
class FlashingTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString whatToPrint READ whatToPrint WRITE setWhatToPrint NOTIFY whatToPrintChanged)
public:
    explicit FlashingTimer(QTime tomorrow=QTime::currentTime(),QObject *parent=nullptr);
    QString whatToPrint() const;
    void setWhatToPrint(QString whatToPrint);
    void display();

private:
    QTime tomorrow;
    QTimer *timer;
    int difference;
    QString m_whatToPrint;

signals:
    void whatToPrintChanged(QString whatToPrint);
};

#endif // FLASHINGTIMER_H
