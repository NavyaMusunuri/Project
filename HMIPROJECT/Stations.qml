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
        source: "qrc:/Background.qml"
    }

    Rectangle
    {
        id: stationsSlider
        x: 700
        y: 120
        height: 480
        width: 100
        color: "transparent"
        border.color: "white"

    }
    Rectangle
    {
        x: 700
        y: 120
        height: 100
        width: 100
        color: "darkgray"
    }
    Rectangle
    {
        x: 700
        y: 500
        height: 100
        width: 100
        color: "darkgray"
    }
    Rectangle
    {
        x: 700
        y: 250
        height: 180
        width: 100
        color: "lightgray"
    }
    Image {
        id: upArrow
        x: 700
        y: 120
        height: 100
        width: 100
        source: "qrc:/../../Downloads/Project/Up Arrow.png"
    }
    Image {
        id: downArrow
        x: 700
        y: 500
        height: 100
        width: 100
        source: "qrc:/../../Downloads/Project/Down Arrow.png"
    }

    Rectangle
    {
        id: stationListRectangle
        height: 120
        width: 800
        gradient: Gradient
        {
            GradientStop{position: 0.0; color: "#4682B4"}
            GradientStop{position: 0.5; color: "#668B8B"}
            GradientStop{position: 1.0; color: "#4682B4"}
        }

        Text

        {
            anchors.horizontalCenter: stationListRectangle.horizontalCenter
            anchors.verticalCenter: stationListRectangle.verticalCenter
            text: "STATION LIST" ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize: 48
        }
    }

    Image
    {
        id: home
        y: 20
        height: 100
        width: 100
        source: "qrc:/IMAGES/Home.png"
        MouseArea
                         {
                             anchors.fill: home
                             hoverEnabled: true

                             onPressed:
                             {
                                 home.width = home.width*0.98
                                 home.height = home.height*0.98
                                 console.log("On home clicked")
                             }
                             onReleased:
                             {
                                 home.width = home.width/0.98
                                 home.height = home.height/0.98
                                 console.log("On home released")
                                 rootWindow.changeScreen("MainScreen.qml")
                             }
                         }
    }


    ListModel
    {
        id: stationsList
        ListElement { name: "97.7-1. FM" }
        ListElement { name: "98.5-1. FM" }
        ListElement { name: "98.5-2 FM" }
        ListElement { name: "104.9-1. FM" }
        ListElement { name: "105.7-1. FM" }
        ListElement { name: "1170. AM" }
    }
    ListView
    {
        id: stationsListView
        width: 700; height: 480
        x: 0
        y: 120


        Component {
            id: stationsDelegate
            Rectangle {
                id: stationsWrapper
                width: 700
                height: 80
                border.color: "black"
                color: ListView.isCurrentItem ? "#C1FFC1" : "#C1FFC1"
                Text {
                    //      anchors.horizontalCenter: settingsWrapper.horizontalCenter
                    anchors.verticalCenter: stationsWrapper.verticalCenter
                    id: radiolist
                    text: name ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize: 28

                }

                MouseArea
                {
                    anchors.fill: stationsWrapper
                    hoverEnabled: true

                    onEntered:
                    {
                        rectangle.color = "#708090"
                        rectangle.border.color = "transparent"
                        rectangle.radius = stationsWrapper.width/60
                        console.log("On entered")
                    }

                    onExited:
                    {
                        rectangle.color="Transparent"
                        rectangle.border.color = "Transparent"
                        myIcon.opacity=1
                        console.log("On exited")
                    }

                    onPressed:
                    {
                        stationsWrapper.width = stationsWrapper.width*0.98
                        stationsWrapper.height = stationsWrapper.height*0.98
                        if (textEdit.length<10){textEdit.text= textEdit.text+ name;}
                        else { textEdit.readOnly=true;}
                        console.log("On clicked")
                    }
                    onReleased:
                    {
                        stationsWrapper.width = stationsWrapper.width/0.98
                        stationsWrapper.height = stationsWrapper.height/0.98
                        console.log("On released")
                    }
                }
            }
        }


        delegate: stationsDelegate
        model: stationsList
        focus: true
    }
}
