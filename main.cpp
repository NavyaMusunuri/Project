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
    QFile fileReader("configuration.txt");

    int mainWindowHeight;
    int mainWindowWidth;

    std::cout << "file error string " << fileReader.errorString().toStdString().c_str() << std::endl;
    if (fileReader.exists() == false)
    {
        std::cout << "file does not exists" << std::endl;
    }
    if (fileReader.open(QIODevice::ReadOnly | QIODevice::Text) == true)
    {
        std::cout << "Read Failed" << std::endl;
        fileReader.close();

        while (fileReader.atEnd())
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
    return std::stoi(std::string(byteArray.data()));
}


int getMainWindowHeight(QByteArray& byteArray)
{
    return std::stoi(std::string(byteArray.data()));
}
