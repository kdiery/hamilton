#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "patientcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    PatientController *patientController = new PatientController();
    engine.rootContext()->setContextProperty("patientController", patientController);

    qmlRegisterSingletonType(QUrl("qrc:/qt/qml/hamilton/Theme.qml"), "Theme",1,0,"Theme");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("hamilton", "Main");

    return app.exec();
}
