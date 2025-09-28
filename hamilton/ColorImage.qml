import QtQuick
import QtQuick.Effects

Item {
    height: imageId.implicitHeight
    width: imageId.implicitWidth

    property alias imageSource: imageId.source
    property alias imageWidth: imageId.sourceSize.width
    property alias imageColor: imageEffect.colorizationColor

    Image {
        id: imageId
        anchors.centerIn: parent
    }

    MultiEffect {
        id: imageEffect
        source: imageId
        anchors.fill: imageId
        colorization: 1.0
        brightness: 1.0
    }
}
