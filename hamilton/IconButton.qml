import QtQuick
import QtQuick.Effects

Item {
    id: root
    width: buttonRectId.implicitWidth
    height: buttonRectId.implicitHeight

    property alias iconSource: iconId.source

    signal buttonClicked

    Rectangle {
        id: buttonRectId
        implicitHeight: 72
        implicitWidth: 72
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

        Image {
            id: iconId
            anchors.centerIn: parent
            sourceSize.height: 30
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
