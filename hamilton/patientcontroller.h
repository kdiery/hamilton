#ifndef PATIENTCONTROLLER_H
#define PATIENTCONTROLLER_H

#include <QQmlEngine>
#include <QObject>
#include <QString>


class PatientController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString patientAge READ patientAge NOTIFY patientAgeChanged)
    Q_PROPERTY(bool isMale READ isMale NOTIFY isMaleChanged)
    Q_PROPERTY(HealingState healingState READ healingState NOTIFY healingStateChanged)

public:
    enum class HealingState{
        NotHealing = 0,
        Healing = 1
    };
    Q_ENUM(HealingState)

    explicit PatientController(QObject *parent = nullptr);

    QString patientAge() const { return m_patientAge;}
    bool isMale() const { return m_isMale; }
    HealingState healingState() const { return m_healingState;}

public slots:
    void setPatientAge(const QString &age);
    void setIsMale(const bool &isMale);
    void startHealing();
    void stopHealing();

signals:
    void patientAgeChanged();
    void isMaleChanged();
    void healingStateChanged();


private:
    QString m_patientAge;
    bool m_isMale;
    HealingState m_healingState;
};

#endif // PATIENTCONTROLLER_H
