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
        id: homeButton
        y: 20
        height: 100
        width: 100
        source: "qrc:/../../Downloads/Project/Home.png"
    }


    ListModel
    {
        id: stationsList
        ListElement { name: "Name & Frequency" }
        ListElement { name: "Name & Frequency" }
        ListElement { name: "Name & Frequency" }
        ListElement { name: "Name & Frequency" }
        ListElement { name: "Name & Frequency" }
        ListElement { name: "Name & Frequency" }
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
                color: ListView.isCurrentItem ? "#5CACEE" : "#C1FFC1"
                Text {
                    //      anchors.horizontalCenter: settingsWrapper.horizontalCenter
                    anchors.verticalCenter: stationsWrapper.verticalCenter
                    id: radiolist
                    text: name ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize: 28

                }
            }
        }


        delegate: stationsDelegate
        model: stationsList
        focus: true
    }
}
