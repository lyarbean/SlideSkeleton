import QtQuick 2.0
import "."
Rectangle {
    property string presenterName: ""
    property string functionString: ""
    
    property string slideTitle: ""
    property string slideSubtitle: ""
    property string dateAndPlace: ""

    property real scriptFontSize: 7.0
    property real tinyFontSize:   8.0
    property real smallFontSize:  9.0
    property real normalFontSize: 10.0
    property real bigFontSize:    14.0
    property real largeFontSize:  18.0
    property real hugeFontSize:   24.0

    Column {
        spacing: 12
        x: 100
        y: 100
        width : parent.width
        Text {
            width : parent.width
            text: slideTitle
            font.pointSize: bigFontSize
            font.bold: true
            color: Style.dBlue
        }
        Text {
            width : parent.width
            text: slideSubtitle
            font.pointSize: normalFontSize
            font.bold: true
            color: Style.dBlue           
        }
        Item {
            width : 50
            height: 50
        }
        Text {
            width : parent.width
            text: "Presented by: " + presenterName
            font.pointSize: smallFontSize
            color : Style.dBlue
        }

        Text {
            width : parent.width
            text :  functionString
            font.pointSize: tinyFontSize
            color : Style.dBlue
        }

        Text {
            width : parent.width
            text :  dateAndPlace
            font.pointSize: tinyFontSize
            color : Style.dBlue           
        }
    }

}
