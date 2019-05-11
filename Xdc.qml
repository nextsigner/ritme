import QtQuick 2.0
Item{
    id:r
    anchors.fill: parent
    property string consulta: ''
    property string code: ''
    property bool confirmar: false
    Rectangle{
        anchors.fill: r
        opacity: 0.65
        color:'black'
    }
    Rectangle{
        anchors.centerIn: parent
        width: app.fs*20
        height: msg.contentHeight+app.fs*5+app.fs*2
        color: app.c2
        radius: app.fs*0.25
        Column{
            width: parent.width-app.fs
            anchors.centerIn: parent
            spacing: app.fs
            Text{
                anchors.horizontalCenter:  parent.horizontalCenter
                font.pixelSize: app.fs
                color:app.c3
                text:r.confirmar?'<b>Confirmar</b>':'<b>'+(app.moduleName).charAt(0).toUpperCase() + (app.moduleName).slice(1)+' dice:</b> '
            }
            Text{
                id:msg
                width: parent.width
                wrapMode: Text.WordWrap
                anchors.horizontalCenter:  parent.horizontalCenter
                font.pixelSize: app.fs
                color:app.c3
                text:r.consulta
            }
            Row{
                anchors.right: parent.right
                anchors.rightMargin: app.fs*0.5
                spacing: app.fs*0.5
                BotonUX{
                    anchors.verticalCenter: parent.verticalCenter
                    text:'No'
                    fs: app.fs
                    fontColor: app.c3
                    backgroudColor: app.c2
                    visible: r.confirmar
                    onClick: {
                        r.visible=false
                    }
                }
                BotonUX{
                    anchors.verticalCenter: parent.verticalCenter
                    text:r.confirmar?'Si':'Entendido'
                    fs: app.fs
                    fontColor: app.c3
                    backgroudColor: app.c2
                    onClick: {
                        if(r.confirmar){
                            runCode(r.code)
                        }
                        r.visible=false
                    }
                }
            }
        }
    }
    function runCode(c){
        var obj = Qt.createQmlObject(c, xS, 'xdc2')
    }
}
