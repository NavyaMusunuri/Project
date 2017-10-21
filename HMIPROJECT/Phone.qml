import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    id:root
    width: 800
    height: 600
    title: qsTr("PHONE")

    Image
       {
           id: background
           anchors.fill: parent
           width: root.width
           height: root.height
           source: "qrc:/IMAGES/Background.jpg"
       }

    Image
       {
           id: home
           y:20
           width: root.width/8
           height: root.height/6
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

    Rectangle
       {
           id: dial
           height: 100
           width: 250
           x:100
           y:400
           gradient: Gradient
           {
               GradientStop{position: 0.0; color: "#4682B4"}
               GradientStop{position: 0.5; color: "#668B8B"}
               GradientStop{position: 1.0; color: "#4682B4"}
           }

           Text

           {
               anchors.horizontalCenter: dial.horizontalCenter
               anchors.verticalCenter: dial.verticalCenter
               text: "Dial" ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize: 60        }
           MouseArea
                  {
                      anchors.fill: dial
                      hoverEnabled: true

                      onPressed:
                      {
                          dial.width = dial.width*0.98
                          dial.height = dial.height*0.98
                          console.log("On dial clicked")
                      }
                      onReleased:
                      {
                          dial.width = dial.width/0.98
                          dial.height = dial.height/0.98
                          console.log("On dial released")
                          rootWindow.changeScreen("Keypad.qml")
                      }
                  }
              }

       Rectangle
       {
           id: contacts
           height: 100
           width: 320
           x:400
           y:400
           gradient: Gradient
           {
               GradientStop{position: 0.0; color: "#4682B4"}
               GradientStop{position: 0.5; color: "#668B8B"}
               GradientStop{position: 1.0; color: "#4682B4"}
           }

           Text

           {
               anchors.horizontalCenter: contacts.horizontalCenter
               anchors.verticalCenter: contacts.verticalCenter
               text: "Contacts" ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize :60      }
           MouseArea
                  {
                      anchors.fill: contacts
                      hoverEnabled: true

                      onPressed:
                      {
                          contacts.width = contacts.width*0.98
                          contacts.height = contacts.height*0.98
                          console.log("On contacts clicked")
                      }
                      onReleased:
                      {
                          contacts.width = contacts.width/0.98
                          contacts.height = contacts.height/0.98
                          console.log("On contacts released")
                      }
                  }
       }

       Rectangle
           {
               id: connect
               height: 100
               width: 500
               x:200
               y:80
               gradient: Gradient
               {
                   GradientStop{position: 0.0; color: "#4682B4"}
                   GradientStop{position: 0.5; color: "#668B8B"}
                   GradientStop{position: 1.0; color: "#4682B4"}
               }

               Text

               {
                   anchors.horizontalCenter: connect.horizontalCenter
                   anchors.verticalCenter: connect.verticalCenter
                   text: "Connected To " ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize :44     }
           }

       Rectangle
           {
               id: pisquare
               height: 100
               width: 500
               x:200
               y:160
               gradient: Gradient
               {
                   GradientStop{position: 0.0; color: "#4682B4"}
                   GradientStop{position: 0.5; color: "#668B8B"}
                   GradientStop{position: 1.0; color: "#4682B4"}
               }

               Text

               {
                   anchors.horizontalCenter: pisquare.horizontalCenter
                   anchors.verticalCenter: pisquare.verticalCenter
                   text: "PiSquare’s Phone" ; font.family: "Lucida Calligraphy"; fontSizeMode: Text.Fit; font.pixelSize :44     }
           }
}
