import QtQuick
import QtQuick.Effects

Item {
    id: root
    width: buttonRectId.implicitWidth
    height: buttonRectId.implicitHeight

    property alias iconSource: iconId.source
    property alias buttonText: textId.text

    signal buttonClicked

    Rectangle {
        id: buttonRectId
        implicitWidth: textId.implicitWidth + iconId.implicitWidth + 30
        implicitHeight: 72
        color: Theme.background
        border.color: Theme.text
        border.width: 2
        radius: 18
        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: Theme.text
            shadowHorizontalOffset: 1
            shadowVerticalOffset: 4
            shadowBlur: 0
        }

        Text {
            id: textId
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            font.family: "Roboto Regular"
            font.pixelSize: 24
            color: Theme.text
        }

        Image {
            id: iconId
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            sourceSize.height: 20
            source: "qrc:/icons/power-off.svg"

            MultiEffect {
                source: iconId
                anchors.fill: iconId
                colorization: 1.0
                colorizationColor: Theme.text
                brightness: 1.0
            }
        }

        MouseArea {
            id: mouseAreaId
            anchors.fill: parent
            onClicked: buttonClicked()
        }
    }
}
