import QtQuick 2.3
Rectangle {
    color : "white"
    property string headline : ""
    property string subHeadline : ""
    property alias contentArea: contentArea
    property alias header: header
    property alias footer: footer
    property real scriptFontSize: 7.0
    property real tinyFontSize:   10.0
    property real smallFontSize:  14.0
    property real normalFontSize: 18.0
    property real bigFontSize:    22.0
    property real largeFontSize:  24.0
    property real hugeFontSize:   32.0

    BackGround {
        id: backGround
    }

    Header {
        id: header
    }

    ContentArea {
        id: contentArea
        anchors {
            top: header.bottom
            bottom: footer.top
        }
    }

    Footer {
        id: footer
    }

}
