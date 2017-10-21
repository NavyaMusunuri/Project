import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2

Window {
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
        source: "qrc:/Images/Background.jpg"
    }

    Item {
        id: rootItem
        //anchors.fill: root
        x: background.width/16
        y: background.height/12
//        anchors.topMargin: background.height/12
//        anchors.leftMargin: background.width/16
        visible: true
        width: rootWindow.width
        height: rootWindow.height

        ListModel
        {
            id: appModel

            ListElement{name: "radioIcon";icon: "qrc:/Images/Radio.png" }
            ListElement{name: "mediaIcon";icon: "qrc:/Images/Media.png" }
            ListElement{name: "phoneIcon";icon: "qrc:/Images/phone.png" }
            ListElement{name: "naviIcon";icon: "qrc:/Images/Navi..png" }
            ListElement{name: "settingsIcon";icon: "qrc:/Images/Settings...png" }
        }

        GridView {
            id: gridView
            model: appModel
            anchors.fill: rootItem
            cellWidth : rootItem.width/3
            cellHeight: rootItem.height/2
            focus: true
            delegate:

                Rectangle {
                id: delegateRootItem
                width: gridView.cellWidth/2
                height: gridView.cellHeight/2
                color: "transparent"

                Rectangle {
                    id: rectangle
                    width: myIcon.width*1.2
                    height: myIcon.height*1.2
                    anchors.fill: delegateRootItem
                    color: "transparent"
                        }

                    Image {
                        id: myIcon
                        fillMode: Image.PreserveAspectFit
                        anchors.fill: delegateRootItem
                        width: delegateRootItem.width/2
                        height: delegateRootItem.height/2
                        source: icon
                    }



                    MouseArea
                    {
                        anchors.fill: myIcon
                        hoverEnabled: true

                        onEntered:
                        {
                            rectangle.color = "#708090"
                            rectangle.border.color = "transparent"
                            rectangle.radius = 10
                            console.log("On entered")
                        }

                        onExited:
                        {
                            rectangle.color="Transparent"
                            rectangle.border.color = "Transparent"
                            myIcon.opacity = 1
                            console.log("On exited")
                        }

                        onPressed:
                        {
                            delegateRootItem.width = myIcon.width*0.9
//                                    delegateRootItem.width*0.9
                            delegateRootItem.height = myIcon.height*0.9
//                                    delegateRootItem.height*0.9
                            console.log("On pressed")
                        }
                        onReleased:
                        {
                            delegateRootItem.width = rootWindow.width/6
                                    //gridView.width/6
                                    //rootItem.width/6
                                    //delegateRootItem.width*1.1
                                    //gridView.cellWidth/6
                            delegateRootItem.height = rootWindow.height/4
                                    //gridView.height/4
                                    //rootItem.height/4
                                    //delegateRootItem.height*1.1
                                    //gridView.cellheight/4
                            console.log("On released")
                        }}}

Loader
    {
        id: radioLoader
        onLoaded:
        {
            console.log("Loader finished")
        }
    }
    Component.onCompleted:
    {
        console.log("Component onCompleted")
        loader.setSource("FirstScreen.qml");
    }
            }
        MouseArea
        {
            x: 50
            y: 50
        //text: "ChangeScreen"
        onClicked:
        {
            console.log("Component onCompleted")
            radioLoader.setSource = "qrc:/Settings.qml"
      }
}
}
}
