import QtQuick 2.0
Item{
    id:r
    width: rowSil.width
    height: fs*1.2
    property int fs: app.fs
    property var arrSil: []
    property color color: 'black'
    property string w: 'null'
    signal clicked
    signal hoverWord(string word)
    //signal clickedSil(string sil)
    Row{
        id: rowSil
        Repeater{
            id: repArrSil
            model: r.arrSil
            Rectangle{
                id: rectSil
                width: children[0].contentWidth
                height: children[0].contentHeight
                color: maMt.p?app.c2:app.c1
                border.color: app.c2
                border.width: !maMt.p||modelData===' '?0:2
                Text{id: txtMw;text: modelData;font.pixelSize: r.fs; color: maMt.p?app.c1:app.c2}
                Keys.onPressed: {
                        if (event.key == Qt.Key_Space) {
                            //console.log("move left");
                            //borde.color='red'
                            r.parent.parent.autoSpeak=true
                            r.parent.parent.playNextSil()
                            event.accepted = true;
                        }
                    }
                    Rectangle{
                        id: borde
                        anchors.fill: parent
                        color: 'transparent'
                        border.color: 'red'
                        border.width: parent.focus?2:0
                    }
                    MouseArea{
                        id: maMt
                        anchors.fill: parent
                        hoverEnabled: true
                        property  bool p: false
                        onPChanged: {
                            r.parent.parent.showWord(r.w)
                            rectSil.focus=p
                        }
                        onEntered: p=true
                        onExited: p=false
                        onPressed: p=true
                        onReleased: p=false
                        onClicked: {
                            p=true
                            r.parent.parent.setSil(txtMw.text)
                        }
                    }
                }
            }
        }
        Component.onCompleted: {
            var m0=r.w.split('-')
            for(var i2=0;i2<m0.length;i2++){
                r.arrSil.push(m0[i2])
            }
            repArrSil.model=r.arrSil
        }
    }
