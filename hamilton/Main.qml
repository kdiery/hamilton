import QtQuick
import QtQuick.Controls.Material

Window {
    id: rootId
    width: 1024
    height: 768
    visible: true
    title: qsTr("Hamilton")
    color: Theme.background

    property bool isMale: true
    property bool animationIsRunning: false

    Rectangle {
        id: containerId
        anchors.fill: parent
        anchors.margins: 20
        color: Theme.background
        state: "not_healing"

        // start animation, move and change button, move patienticon
        states: [
            State {
                name: "healing"
                PropertyChanges {
                    target: currentPatientTranslateId
                    x: -100
                    y: 100
                }
                PropertyChanges {
                    target: healingButtonId
                    iconSource: "qrc:/icons/hand.svg"
                    buttonText: "Stop"
                }
                PropertyChanges {
                    target: planetLabelId
                    opacity: 0
                    visible: false
                }
                PropertyChanges {
                    target: planetRowId
                    opacity: 0
                    visible: false
                }
                PropertyChanges {
                    target: ageGroupLabelId
                    opacity: 0
                    visible: false
                }
                PropertyChanges {
                    target: ageGroupRowId
                    opacity: 0
                    visible: false
                }
                PropertyChanges {
                    target: pulseAnimationId
                    running: true
                }
            },
            State {
                name: "not_healing"
                PropertyChanges {
                    target: currentPatientTranslateId
                    x: 0
                    y: 0
                }
                PropertyChanges {
                    target: healingButtonId
                    iconSource: "qrc:/icons/play.svg"
                    buttonText: "Start Healing"
                }
                PropertyChanges {
                    target: planetLabelId
                    opacity: 1
                    visible: true
                }
                PropertyChanges {
                    target: planetRowId
                    opacity: 1
                    visible: true
                }
                PropertyChanges {
                    target: ageGroupLabelId
                    opacity: 1
                    visible: true
                }
                PropertyChanges {
                    target: ageGroupRowId
                    opacity: 1
                    visible: true
                }
                PropertyChanges {
                    target: pulseAnimationId
                    running: false
                }
            }
        ]

        transitions: [
            Transition {
                ParallelAnimation {
                    NumberAnimation {
                        targets: currentPatientTranslateId
                        property: "x"
                        duration: 1000
                        easing.type: Easing.OutQuad
                    }
                    NumberAnimation {
                        targets: currentPatientTranslateId
                        property: "y"
                        duration: 1000
                        easing.type: Easing.OutQuad
                    }
                    NumberAnimation {
                        targets: [planetLabelId, planetRowId, ageGroupLabelId, ageGroupRowId]
                        property: "opacity"
                        duration: 1000
                        easing.type: Easing.OutQuad
                    }
                }
            }
        ]

        ColorImage {
            id: currentProcedureId
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: -100
            anchors.bottomMargin: -100
            imageSource: "qrc:/icons/baby-carriage.svg"
            imageWidth: 500
            imageColor: Theme.accentColorAdult

            SequentialAnimation {
                id: pulseAnimationId
                loops: Animation.Infinite
                PauseAnimation {
                    duration: 1000
                }
                NumberAnimation {
                    target: currentProcedureId
                    property: "scale"
                    to: 0.5
                    duration: 800
                }
                PauseAnimation {
                    duration: 1000
                }
                NumberAnimation {
                    target: currentProcedureId
                    property: "scale"
                    to: 1.0
                    duration: 800
                }
            }
        }

        ColorImage {
            id: currentPatientId
            anchors.right: parent.right
            anchors.top: parent.top
            imageSource: "qrc:/icons/baby.svg"
            imageWidth: 150
            imageColor: Theme.text

            transform: Translate {
                id: currentPatientTranslateId
                x: 0
                y: 0
            }

            state: "baby"

            states: [
                State {
                    name: "baby"
                    PropertyChanges {
                        target: currentPatientId
                        imageSource: "qrc:/icons/baby.svg"
                    }
                    PropertyChanges {
                        target: currentProcedureId
                        imageSource: "qrc:/icons/baby-carriage.svg"
                        imageColor: Theme.accentColorBaby
                    }
                },
                State {
                    name: "child"
                    PropertyChanges {
                        target: currentPatientId
                        imageSource: isMale ? "qrc:/icons/child.svg" : "qrc:/icons/child-dress.svg"
                    }
                    PropertyChanges {
                        target: currentProcedureId
                        imageSource: "qrc:/icons/futbol.svg"
                        imageColor: Theme.accentColorChild
                    }
                },
                State {
                    name: "adult"
                    PropertyChanges {
                        target: currentPatientId
                        imageSource: isMale ? "qrc:/icons/person.svg" : "qrc:/icons/person-dress.svg"
                    }
                    PropertyChanges {
                        target: currentProcedureId
                        imageSource: "qrc:/icons/lungs.svg"
                        imageColor: Theme.accentColorAdult
                    }
                },
                State {
                    name: "elder"
                    PropertyChanges {
                        target: currentPatientId
                        imageSource: "qrc:/icons/person-cane.svg"
                    }
                    PropertyChanges {
                        target: currentProcedureId
                        imageSource: "qrc:/icons/leaf.svg"
                        imageColor: Theme.accentColorElder
                    }
                }
            ]
        }

        Column {
            anchors.left: parent.left
            anchors.top: parent.top
            move: Transition {
                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutQuad
                }
            }
            Row {
                bottomPadding: 20
                spacing: 10
                IconButton {
                    iconSource: "qrc:/icons/power-off.svg"
                    onButtonClicked: rootId.close()
                }
                IconButton {
                    iconSource: "qrc:/icons/circle-half-stroke.svg"
                    onButtonClicked: Theme.toggleDark()
                }
            }

            Text {
                id: planetLabelId
                text: "Favourite planet:"
                bottomPadding: 10
                font.family: "Roboto Regular"
                font.pixelSize: 12
                color: Theme.text
            }

            Row {
                id: planetRowId
                spacing: 10
                IconButton {
                    iconSource: "qrc:/icons/mars.svg"
                    onButtonClicked: isMale = true
                }
                IconButton {
                    iconSource: "qrc:/icons/venus.svg"
                    onButtonClicked: isMale = false
                }
            }

            Text {
                id: ageGroupLabelId
                text: "Age group:"
                topPadding: 20
                bottomPadding: 10
                font.family: "Roboto Regular"
                font.pixelSize: 12
                color: Theme.text
            }

            Row {
                id: ageGroupRowId
                spacing: 10
                IconButton {
                    iconSource: "qrc:/icons/baby.svg"
                    onButtonClicked: {
                        currentPatientId.state = "baby"
                    }
                }
                IconButton {
                    iconSource: isMale ? "qrc:/icons/child.svg" : "qrc:/icons/child-dress.svg"
                    onButtonClicked: {
                        currentPatientId.state = "child"
                    }
                }
                IconButton {
                    iconSource: isMale ? "qrc:/icons/person.svg" : "qrc:/icons/person-dress.svg"
                    onButtonClicked: {
                        currentPatientId.state = "adult"
                    }
                }
                IconButton {
                    iconSource: "qrc:/icons/person-cane.svg"
                    onButtonClicked: {
                        currentPatientId.state = "elder"
                    }
                }
                bottomPadding: 10
            }
            TextIconButton {
                id: healingButtonId
                iconSource: "qrc:/icons/play.svg"
                buttonText: "Start Healing"
                onButtonClicked: {
                    if (containerId.state === "healing") {
                        containerId.state = "not_healing"
                    } else {
                        containerId.state = "healing"
                    }
                }
            }
        }
    }
}
