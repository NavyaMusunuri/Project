import QtQuick 2.0

Item {

    property int mainScreenHeight: 600
    property int mainScreenWidth: 800

    Image {
        id: homeButton
        y:20
        width: root.width/8
        height: root.height/6
        source: "qrc:/IMAGES/Home.png"
//        anchors.top: parent.top
//        anchors.topMargin: mainScreenHeight*18/600
//        anchors.left: parent.left
//        anchors.leftMargin: mainScreenWidth*10/1000
        fillMode: Image.PreserveAspectFit

//        height:mainScreenHeight/6
//        width:mainScreenWidth*0.1

        MouseArea
        {
            anchors.fill: homeButton

            onPressed:
            {
                homeButton.height=100*(3/4)
                homeButton.width=100*0.1*(3/4)
            }

            onReleased:
            {
                homeButton.height=100
                homeButton.width=100
                rootWindow.changeScreen("MainScreen.qml")
            }
        }
    }

}
