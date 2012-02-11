import QtQuick 1.1
import com.nokia.meego 1.0
import "components"
import "delegates"

import Webdav 1.0

Page {

    tools: commonTools

//    Image {
//        id: background
//        anchors.fill: parent
//        source: "images/meegotouch-background.png"
//        smooth: true
//    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
    }

    PageHeader {
        id: appTitleRect
        text: webdavClient.folder == webdavClient.homePath ? "Home" : webdavClient.currentItem.displayName
        busy: webdavClient.currentItem.busy
    }

    ListView {
        id: itemView
        anchors.top: appTitleRect.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 0
        spacing: 10
        clip: true

        section.property: "displayName"
        section.criteria: ViewSection.FirstCharacter

        delegate: WebdavUrlInfoDelegate { }
        model: webdavClient.currentItem.childs
    }
}