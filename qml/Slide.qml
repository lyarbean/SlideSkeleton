import QtQuick 2.3
Rectangle {
    color : "white"
    property string headline : ""
    property string subHeadline : ""
    property alias contentArea: contentArea
    property alias header: header
    property alias footer: footer
    property real scriptFontSize: 7.0
    property real tinyFontSize:   8.0
    property real smallFontSize:  9.0
    property real normalFontSize: 10.0 // default text Point size
    property real bigFontSize:    14.0
    property real largeFontSize:  18.0
    property real hugeFontSize:   24.0

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
