import QtQuick 2.3
import "."
Item {
    x: parent.width * 0.1
    y: 10
    width: parent.width * 0.7
    height: parent.height * 0.15
    focus: true
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 2
        Text {
            text: headline
            color: Style.dBlue
            font.pointSize: bigFontSize
        }
        Text {
            text: subHeadline
            color: Style.dBlue
            font.pointSize: normalFontSize
        }
    }
}
