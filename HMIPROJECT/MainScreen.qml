import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2


Window {
    signal refreshScreen(var value)

    objectName: "mainScreen"
    visible: true
    width: 800
    height: 600
    id: window

    Image
    {
        anchors.fill:parent
        source:"qrc:/IMAGES/Background.jpg"
    }

    Item {
        id: rootItem
        //anchors.fill: root
        x: window.width/16
        y: window.height/12
        //        anchors.topMargin: background.height/12
        //        anchors.leftMargin: background.width/16
        visible: true
        width: rootWindow.width
        height: rootWindow.height

        ListModel
        {
            id: appModel

            ListElement{name: "RADIO";icon: "qrc:/IMAGES/Radio.png" }
            ListElement{name: "MEDIA";icon: "qrc:/IMAGES/Media.png" }
            ListElement{name: "PHONE";icon: "qrc:/IMAGES/phone.png" }
            ListElement{name: "NAVI";icon: "qrc:/IMAGES/Navi..png" }
            ListElement{name: "SETTINGS";icon: "qrc:/IMAGES/Settings...png" }
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

                Text {
                    id:textArea1
                    anchors
                    {
                        top: myIcon.bottom;
                        topMargin: parent.height* 15/600
                        horizontalCenter: myIcon.horizontalCenter
                    }
                    text: name
                    color: "#708090"
                    font.pointSize: gridView.width*0.017
                    font.bold:true
                    font.family: "Lucida Calligraphy"
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
//                        rootWindow.changeScreen("Radio.qml")

                        if(textArea1.text == "SETTINGS")
                        {
                            rootWindow.changeScreen("Settings.qml")
                        }
                        if(textArea1.text == "RADIO")
                        {
                            rootWindow.changeScreen("Radio.qml")
                        }
                        if(textArea1.text == "PHONE")
                        {
                            rootWindow.changeScreen("Phone.qml")
                        }
                        if(textArea1.text == "MEDIA")
                        {
                            rootWindow.changeScreen("Media.qml")
                        }
}}}}}}
