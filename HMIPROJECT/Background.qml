import QtQuick 2.0
import QtQuick.Window 2.2

Window
{
    id: rootWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("PROJECT")
Image
{
    id: background
    anchors.fill: parent
    width: rootWindow.width
    height: rootWindow.height
    source: "qrc:/Background.qml"
}
}
