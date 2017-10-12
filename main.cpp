#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <String>
#include <QFile>
#include <QQuickWindow>
#include <iostream>


int getMainWindowHeight(QByteArray& byteArray);
int getMainWindowWidth(QByteArray& byteArray);


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QFile fileReader("C:\\QtExamples\\configuration");

    int mainWindowHeight = 600;
    int mainWindowWidth = 600;

    if (fileReader.open(QIODevice::ReadOnly | QIODevice::Text) == true)
    {
        {
            QByteArray line = fileReader.readLine();
            mainWindowHeight = getMainWindowHeight(line);
            mainWindowWidth =  getMainWindowWidth(line);
        }
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject* qobject = engine.rootObjects().at(0);
    QQuickWindow* mainWindow = qobject_cast<QQuickWindow*>(qobject);

    mainWindow->setProperty("height", mainWindowHeight);
    mainWindow->setProperty("width", mainWindowWidth);
    fileReader.close();

    return app.exec();
}


int getMainWindowWidth(QByteArray& byteArray)
{
    return std::stoi(QString(byteArray).toStdString());
}


int getMainWindowHeight(QByteArray& byteArray)
{
    int value = std::stoi(QString(byteArray).toStdString());
    return value;
}
