import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("PROJECT")

    Image
    {
        id: background
        anchors.fill: parent
        width: root.width
        height: root.height
        source: "qrc:/../../Downloads/Project/Background.jpg"
    }


    ListModel
    {
        id: pictureModel

        ListElement
        {

        }
    }

    GridView {
        id: gridView
        model: pictureModel
        anchors.fill: parent
        anchors.leftMargin: root.width/16
        anchors.topMargin: root.height/12
        cellWidth : root.width/4
        cellHeight: root.height/3

        delegate: Rectangle {
            width: root.width/4
            height: root.height/3
            color: "transparent"

            Image {
                id: radioIcon
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                cache: false
                source: "qrc:/../../Downloads/Radio.png"
            }
            Image {
                id: mediaIcon
                anchors.left: radioIcon.left
                anchors.topMargin: parent.height/12
                anchors.leftMargin: root.width/3
                fillMode: Image.PreserveAspectFit
                cache: false
                source: "qrc:/../../Downloads/Media.png"
            }
            Image {
                id: phoneIcon
                anchors.left: mediaIcon.left
                anchors.leftMargin: root.width/3
                fillMode: Image.PreserveAspectFit
                cache: false
                source: "qrc:/../../Downloads/phone.png"
            }
            Image {
                id: naviIcon
                anchors.top: radioIcon.bottom
                anchors.topMargin: root.height/7
                anchors.rightMargin: root.width/2
                fillMode: Image.PreserveAspectFit
                cache: false
                source: "qrc:/../../Downloads/Navi..png"
            }
            Image {
                id: settingsIcon
                anchors.top: mediaIcon.bottom
                anchors.left: naviIcon.left
                anchors.topMargin: root.height/6
                anchors.leftMargin: root.width/3
                fillMode: Image.PreserveAspectFit
                cache: false
                source: "qrc:/../../Downloads/Settings...png"
            }
        }
    }
}

