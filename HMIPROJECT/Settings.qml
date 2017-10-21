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
    id: settingsRectangle
    height: root.height/5
    width: root.width
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
                MouseArea
                {
                    anchors.fill: settingsWrapper
                    hoverEnabled: true

                    onEntered:
                    {
                        rectangle.color = "#708090"
                        rectangle.border.color = "transparent"
                        rectangle.radius = settingsWrapper.width/60
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
                        settingsWrapper.width = settingsWrapper.width*0.98
                        settingsWrapper.height = settingsWrapper.height*0.98
                        if (textEdit.length<10){textEdit.text= textEdit.text+ name;}
                        else { textEdit.readOnly=true;}
                        console.log("On clicked")
                    }
                    onReleased:
                    {
                        settingsWrapper.width = settingsWrapper.width/0.98
                        settingsWrapper.height = settingsWrapper.height/0.98
                        console.log("On released")
                    }
                }
            }
        }


        delegate: settingsDelegate
        model: settingsList
        focus: true
}
}
