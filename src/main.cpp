#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "systeminfo.h"
int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("NOVA Desktop");
    QGuiApplication::setOrganizationName("NOVA");
    QQuickStyle::setStyle("Basic");
    SystemInfo info;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("systemInfo", &info);
    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));
    if (engine.rootObjects().isEmpty()) return 1;
    return app.exec();
}
