import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4
import "."

ApplicationWindow {
    id: theWindow
    title: qsTr("Slide")

    property int slideWidth: 480 //640
    property int slideHeight: 360 //480

    function scaleViewport() {
        var s;
        if (theWindow.width * slideHeight > theWindow.height * slideWidth) {
            s = theWindow.height / slideHeight;
        } else {
            s = theWindow.width / slideWidth;
        }
        if (Math.abs (s - theView.scale) > 0.1) {
            theView.scale = s
        }
    }
    onWidthChanged: {
        scaleViewport()
    }
    onHeightChanged: {
        scaleViewport()
    }



    Python {
        id: py // renderCode.py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('/'));
            importModule_sync('renderCode')
        }
    }

    // TODO Rename id
    Pages {
        id: theModel
    }

    // For navigation
    property int currentIndex: 0
    property int previousIndex: 0
    property int printPageIndex: 0
    Component.onCompleted: {
        theView.push(Qt.resolvedUrl(theModel.get(0).ref)).focus = true
        //theWindow.showFullScreen()
        visible = true
    }

    function nextPage() {
        if (currentIndex < theModel.count - 1) {
            currentIndex++
            theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
        }
    }

    function jumpToIndex(idx) {
        previousIndex = currentIndex
        while (idx < currentIndex) {
            theView.pop()
            theView.currentItem.focus = true
            currentIndex--
        }
        while (idx > currentIndex) {
            currentIndex++
            theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
        }
    }

    StackView {
        id: theView
        Component.onCompleted: {
            width = slideWidth
            height = slideHeight
        }
        antialiasing: true
        smooth: true
        focus: true
        transformOrigin: Item.TopLeft
        Keys.onEscapePressed: {
            if (theWindow.visibility === Window.FullScreen) {
                theWindow.showNormal()
            } else {
                theWindow.showFullScreen()
            }
        }
        Keys.onReleased: {
            switch (event.key) {
                case Qt.Key_Left:
                case Qt.Key_Backspace: {
                    if (currentIndex > 0) {
                        currentIndex--
                        theView.pop()
                        theView.currentItem.focus = true
                        event.accepted = true
                    }
                    break;
                }
                case Qt.Key_Right:
                case Qt.Key_Return: {
                    if (currentIndex < theModel.count - 1) {
                        currentIndex++
                        theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
                        event.accepted = true
                    }
                    break;
                }
                case Qt.Key_Up: {
                    jumpToIndex(previousIndex)
                    event.accepted = true
                    break;
                } 
                case Qt.Key_Down: {
                    previousIndex = currentIndex
                    event.accepted = true
                    break;
                } 
                case Qt.Key_Menu: {
                    navigator.visible = !navigator.visible
                    event.accepted = true
                    break;
                }
                case Qt.Key_Meta: {
                    if (event.modifiers & Qt.AltModifier) {
                        noteEdit.visible = !noteEdit.visible
                        event.accepted = true
                    }
                    break;
                }
                case Qt.Key_P: {
                    if (event.modifiers & Qt.ControlModifier ) {
                        theView.currentItem.grabToImage(function(result) {
                            var s = "000" + printPageIndex
                            result.saveToFile("/tmp/slide"+ s.substr(s.length - 4) + ".png")
                            printPageIndex++
                        });
                        event.accepted = true
                    }
                    break;
                }
                default: {
                    break;
                }
            }
        }
    }
    Rectangle {
        id: noteEdit
        y: parent.height * 0.65
        x: parent.width * 0.15
        height: parent.height * 0.3
        width: parent.width * 0.85
        visible: false
        focus: true
        color: "white"
        property alias text: noteText.text
        Rectangle {
            color: "orange"
            opacity: 0.3
            anchors.fill: parent
            MouseArea {
                anchors.fill: parent
                drag.target: noteEdit
                onEntered: {
                    theView.currentItem.focus = true
                }
            }
        }
        ScrollView {
            anchors.fill: parent
            frameVisible: true
            highlightOnFocus: true
            TextEdit {
                id: noteText
                text: "Note"
                font.pointSize: theView.width / 60
                color: "black"
                selectByMouse: true
                cursorVisible: true
                cursorDelegate: Rectangle {
                    width: noteText.font.pointSize / 3
                    color: "red"
                }
                Keys.onReleased: {
                    if ((event.modifiers & Qt.AltModifier) && (event.key === Qt.Key_Meta)) {
                        noteEdit.visible = false
                        theView.currentItem.focus = true
                        event.accepted = true
                    }
                }
            }
        }
    }

    // Navigator with preview support
    Rectangle {
        id: previewBox
        height: parent.height * 0.3
        width: parent.width * 0.3
        y: parent.height * 0.68 - 80
        x: parent.width * 0.1
        visible: navigator.visible
        property alias box: box
        color: "#ffffff"
        border {
            width: height * 0.05
            color: "steelblue"
        }
        radius: height * 0.05
        Rectangle {
            id: box
            width: parent.width - parent.height * 0.1
            height: parent.height* 0.9
            x: parent.height* 0.05
            y: parent.height* 0.05
        }
    }
    Loader {
        id: preview
        parent: previewBox.box
        visible: previewBox.visible
        anchors.fill: parent
        asynchronous: false
        onSourceChanged: {
            if (item !== null) {
            }
        }
        enabled: false
    }

    Rectangle {
        z: 999
        id: navigator
        focus: true
        height: 50
        width: parent.width * 0.9
        visible: false
        onVisibleChanged: {
            if (visible) {
                theList.currentIndex = currentIndex
            }
        }

        y: parent.height - 75
        color: "#00ffffff"
        ListView {
            id: theList
            model: theModel
            orientation: ListView.Horizontal
            anchors.fill: parent
            header: Rectangle {
                width: 50
                height: 50
                radius: 25
                color: "orange"
                Rectangle {
                    x: 25
                    width: 25
                    height: 50
                    color: "orange"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: navigator.visible = false
                }
            }
            delegate: Rectangle {
                id: box
                color: "white"
                width: 50
                height: 50
                border {
                    width: 2
                    color: "orange"
                }
                radius: 4
                Text {
                    id: page
                    anchors {
                        margins: 3
                        centerIn: parent
                    }
                    font.pointSize: 24
                    text: index
                    color: "steelblue"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        navigator.visible = false
                        jumpToIndex(index)
                    }
                    hoverEnabled: true
                    onHoveredChanged: {
                        box.color = containsMouse ? "orange" : "white"
                        page.color = containsMouse ? "black" : "steelblue"
                    }
                    onEntered: {
                        preview.source = ref
                    }
                }
            }
        }
    }
}
