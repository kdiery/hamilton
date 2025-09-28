#include "patientcontroller.h"

PatientController::PatientController(QObject *parent)
    : QObject(parent)
    , m_patientAge("adult")
    , m_isMale(true)
    , m_healingState(HealingState::NotHealing)
{}

void PatientController::setPatientAge(const QString &age)
{
    if(m_patientAge != age) {
        m_patientAge = age;
        emit patientAgeChanged();
    }
}

void PatientController::setIsMale(const bool &isMale)
{
    if(m_isMale != isMale) {
        m_isMale = isMale;
        emit isMaleChanged();
    }
}

void PatientController::startHealing()
{
    if(m_healingState != HealingState::Healing) {
        m_healingState = HealingState::Healing;
        emit healingStateChanged();
    }
}

void PatientController::stopHealing()
{
    if(m_healingState != HealingState::NotHealing) {
        m_healingState = HealingState::NotHealing;
        emit healingStateChanged();
    }
}
