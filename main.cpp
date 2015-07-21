#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("."));
    engine.addImportPath(QStringLiteral("theme"));
    engine.addImportPath(QStringLiteral("qml"));
    engine.load(QUrl(QStringLiteral("qrc:/presentation.qml")));

    return app.exec();
}
