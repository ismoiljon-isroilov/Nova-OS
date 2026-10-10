import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
ApplicationWindow {
    id: win; width: 1100; height: 720; minimumWidth: 800; minimumHeight: 560; visible: true; title: "NOVA — Command Center"; color: "#07111f"
    property string page: "Home"
    Rectangle { anchors.fill: parent; color: "#07111f"; gradient: Gradient { GradientStop { position: 0; color: "#07111f" } GradientStop { position: 1; color: "#101e34" } } }
    RowLayout { anchors.fill: parent; spacing: 0
        Rectangle { Layout.preferredWidth: 230; Layout.fillHeight: true; color: "#0a1627"; border.color: "#203650"
            ColumnLayout { anchors.fill: parent; anchors.margins: 22; spacing: 16
                Label { text: "✦  NOVA"; color: "#f0f6ff"; font.pixelSize: 28; font.bold: true }
                Label { text: "SYSTEM COMMAND CENTER"; color: "#5c8dbb"; font.pixelSize: 10 }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#203650" }
                Repeater { model: ["Home", "Launcher", "System", "Settings"]
                    delegate: Button { required property string modelData; Layout.fillWidth: true; text: modelData; onClicked: win.page=modelData; highlighted: win.page===modelData; background: Rectangle { radius: 8; color: parent.highlighted ? "#173e60" : "#0d1c30"; border.color: parent.highlighted ? "#42c5f5" : "#203650" } ; contentItem: Text { text: parent.text; color: "#e5f0ff"; leftPadding: 12; verticalAlignment: Text.AlignVCenter; font.pixelSize: 14 } }
                }
                Item { Layout.fillHeight: true }
                Label { text: "LIVE SESSION  •  v0.1"; color: "#4c789e"; font.pixelSize: 10 }
            }
        }
        ScrollView { Layout.fillWidth: true; Layout.fillHeight: true; clip: true
            ColumnLayout { width: parent.width; spacing: 20; anchors.margins: 34
                Label { text: win.page==="Home" ? "Welcome to NOVA" : win.page; color: "#f0f6ff"; font.pixelSize: 32; font.bold: true; Layout.topMargin: 30 }
                Label { text: win.page==="Home" ? "A focused command center for your Linux workspace." : "Tools and live system details"; color: "#91aac5"; font.pixelSize: 15; wrapMode: Text.WordWrap }
                GridLayout { Layout.fillWidth: true; columns: 2; rowSpacing: 14; columnSpacing: 14
                    Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 125; radius: 12; color: "#10243a"; border.color: "#25435f"; Column { anchors.fill: parent; anchors.margins: 18; spacing: 8; Label { text: "OPERATING SYSTEM"; color: "#67c9f2"; font.pixelSize: 11 } Label { text: systemInfo.osName; color: "#f0f6ff"; font.pixelSize: 18; wrapMode: Text.WordWrap } } }
                    Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 125; radius: 12; color: "#10243a"; border.color: "#25435f"; Column { anchors.fill: parent; anchors.margins: 18; spacing: 8; Label { text: "KERNEL"; color: "#67c9f2"; font.pixelSize: 11 } Label { text: systemInfo.kernel; color: "#f0f6ff"; font.pixelSize: 18; wrapMode: Text.WordWrap } } }
                    Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 125; radius: 12; color: "#10243a"; border.color: "#25435f"; Column { anchors.fill: parent; anchors.margins: 18; spacing: 8; Label { text: "PROCESSOR"; color: "#67c9f2"; font.pixelSize: 11 } Label { text: systemInfo.cpu; color: "#f0f6ff"; font.pixelSize: 15; wrapMode: Text.WordWrap } } }
                    Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 125; radius: 12; color: "#10243a"; border.color: "#25435f"; Column { anchors.fill: parent; anchors.margins: 18; spacing: 8; Label { text: "MEMORY"; color: "#67c9f2"; font.pixelSize: 11 } Label { text: systemInfo.memory; color: "#f0f6ff"; font.pixelSize: 18 } } }
                }
                Label { text: "QUICK LAUNCH"; color: "#67c9f2"; font.pixelSize: 12; font.bold: true; Layout.topMargin: 6 }
                RowLayout { Layout.fillWidth: true; spacing: 12
                    Button { text: "Open Terminal"; onClicked: systemInfo.launchTerminal() }
                    Button { text: "File Manager"; onClicked: systemInfo.launchFileManager() }
                    Button { text: "Network Settings"; onClicked: systemInfo.launchSystemSettings() }
                }
                Rectangle { Layout.fillWidth: true; radius: 10; color: "#0b1a2b"; border.color: "#203650"; implicitHeight: win.page==="Settings" ? 100 : 0; visible: win.page==="Settings"; Column { anchors.fill: parent; anchors.margins: 16; Label { text: "NOVA settings"; color: "#f0f6ff"; font.bold: true } Label { text: "Desktop behavior is managed by KDE System Settings. The live session is ephemeral."; color: "#91aac5"; wrapMode: Text.WordWrap } } }
                Label { visible: win.page==="Launcher"; text: "Use the KDE application launcher for installed apps. NOVA shortcuts are shown above; KDE remains available as the full desktop fallback."; color: "#c4d5e8"; wrapMode: Text.WordWrap }
                Label { visible: win.page==="System"; text: "Host: "+systemInfo.hostname+"\nOS: "+systemInfo.osName+"\nKernel: "+systemInfo.kernel+"\nCPU: "+systemInfo.cpu+"\nMemory: "+systemInfo.memory; color: "#c4d5e8"; wrapMode: Text.WordWrap }
            }
        }
    }
}
