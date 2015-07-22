import QtQuick 2.3
import "."

Rectangle {
    color: "white"

    property real hugeFontSize: 32

    Text {
        anchors.centerIn: parent
        font.pointSize: hugeFontSize
        text: "Thank you!"
        style: Text.Raised
        styleColor: "red"
        color : "green"
        opacity: 0.8
    }
}
