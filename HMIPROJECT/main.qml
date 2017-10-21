import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2

Item {
    id: rootWindow
    visible: true
    width: 800
    height: 600

    Image
    {
        anchors.fill: parent
        source: "qrc:/IMAGES/Background.jpg"
    }
    Item
    {
        id: refreshItem
        objectName: "refresh"
        signal refresh(var refresh)
    }

    Loader
    {
        id: loader
        onLoaded:
        {
            console.log("Loader finished")
            refreshItem.refresh(1)
        }
    }

    Component.onCompleted:
    {
        console.log("Component onCompleted")
        loader.setSource("MainScreen.qml")
    }

    function changeScreen(value)
    {
        console.log("Showing Screen" + value)
        loader.setSource(value)

        if(value === "MainScreen.qml")
        {
            refreshItem.refresh(1)
        }
    }
}

