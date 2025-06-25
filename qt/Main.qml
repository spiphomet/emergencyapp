

import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    width: 400
    height: 600
    visible: true
    title: qsTr("Emergency bed availability")

    Column{
        anchors.centerIn: parent
        spacing: 10

    }
    Text {
            text: "Hospital Emergency Info"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    ListView {
            id: hospitalList
            width: parent.width
            height: 400
            model: hospitalModel

            delegate: Rectangle {
                width: parent.width
                height: 80
                border.width: 1
                border.color: "gray"
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 10
                    color: "transparent"
                }
            }
            Column {
                        Text { text: "🏥 " + name }
                        Text { text: "🛏️ Beds Available: " + beds }
                        Text { text: "⏱ Last Updated: " + updated }
                            }

    }
    Button{
        text:"Refresh"
        onClicked: {
            backend.refreshData()
        }
    }


    ListModel {
        id: hospitalModel
    }
    Component.onCompleted: {
        backend.refreshData()
    }
    Connections {
        target: backend

        function onDataUpdated() {
            console.log("Updated!")
        }
    }
}



