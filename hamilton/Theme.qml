pragma Singleton

import QtQuick

QtObject {
    id: theme
    property bool isDark: false

    readonly property color background: isDark ? "#333333" : "#FFFFFF"
    readonly property color text: isDark ? "#FFFFFF" : "#696969"
    readonly property color accentColorBaby: isDark ? "#FFB6C1" : "#ffc0cb"
    readonly property color accentColorChild: isDark ? "#87cefa" : "#87ceeb"
    readonly property color accentColorAdult: isDark ? "#778899" : "#708090"
    readonly property color accentColorElder: isDark ? "#ffd700" : "#daa520"

    function toggleDark() {
        isDark = !isDark
    }
}
