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
    id: settingsRectangle
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
                    anchors.horizontalCenter: settingsRectangle.horizontalCenter
                    anchors.verticalCenter: settingsRectangle.verticalCenter
                    text: "SETTINGS" ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize: 48
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
    id: settingsList
    ListElement { name: "RADIO" }
    ListElement { name: "MEDIA" }
    ListElement { name: "PHONE" }
    ListElement { name: "NAVI" }
}
    ListView
    {
        id: settingsListView
        width: 800; height: 480
        x: 0
        y: 120


        Component {
            id: settingsDelegate
            Rectangle {
                id: settingsWrapper
                width: 800
                height: 120
                border.color: "black"
                color: ListView.isCurrentItem ? "#5CACEE" : "#C1FFC1"
                Text {
              //      anchors.horizontalCenter: settingsWrapper.horizontalCenter
                    anchors.verticalCenter: settingsWrapper.verticalCenter
                    id: radiolist
                    text: name ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize: 36

                                     }
            }
        }


        delegate: settingsDelegate
        model: settingsList
        focus: true
}
}
