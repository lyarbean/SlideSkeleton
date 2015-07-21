import QtQuick 2.0
import "."
ListModel {
    ListElement {
        name: "CMake, the easy way"
        ref: "pages/front_page.qml"
    }
    ListElement {
        name: "Agenda"
        ref: "pages/1.qml"
    }
    // --
    ListElement {
        name: "Build Systems"
        ref: "pages/2.qml"
    }
    ListElement {
        name: "Build Tools and Generators"
        ref: "pages/2-1.qml"
    }
    ListElement {
        name: "Autotools process vs. CMake Process"
        ref: "pages/2-2.qml"
    }
    // --
    ListElement {
        name: "CMake, the right way"
        ref: "pages/3.qml"
    }
    ListElement {
        name: "Fame and Fans"
        ref: "pages/3-1.qml"
    }
    ListElement {
        name: "Family"
        ref: "pages/3-2.qml"
    }
    ListElement {
        name: "Features"
        ref: "pages/3-3.qml"
    }
    // --
    ListElement {
        name: "CMake, from A to Z"
        ref: "pages/4.qml"
    }
    ListElement {
        name: "Hello CMake"
        ref: "pages/4-1.qml"
    }
    ListElement {
        name: "Variables"
        ref: "pages/4-2.qml"
    }
    ListElement {
        name: "Finders"
        ref: "pages/4-3.qml"
    }
//    ListElement {
//        name: "Modularized Source Code Layout"
//        ref: "pages/4-4.qml"
//    }
//    ListElement {
//        name: "Miscellaneous"
//        ref: "pages/4-5.qml"
//    }
    // --
    ListElement {
        name: "Not Just Make"
        ref: "pages/5.qml"
    }
    ListElement {
        name: "CTest"
        ref: "pages/5-1.qml"
    }
    ListElement {
        name: "Cpack"
        ref: "pages/5-2.qml"
    }
    ListElement {
        name: "Dependency Graph"
        ref: "pages/5-3.qml"
    }
    ListElement {
        name: "Port to CMake"
        ref: "pages/6.qml"
    }
    ListElement {
        name: "The Root Project"
        ref: "pages/6-1.qml"
    }
    ListElement {
        name: ""
        ref: "pages/6-2.qml"
    }
    ListElement {
        name: ""
        ref: "pages/6-3.qml"
    }
    ListElement {
        name: ""
        ref: "pages/6-4.qml"
    }

    ListElement {
        name:  "Q&A"
        ref: "pages/qa.qml"
    }
    ListElement {
        name: "Thanks!"
        ref: "pages/back_page.qml"
    }
}
