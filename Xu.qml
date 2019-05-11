import QtQuick 2.0
Item{
    id:r
    anchors.fill: parent
    visible:false
    property string commit: ''
    Rectangle{
        anchors.fill: r
        opacity: 0.65
        color:app.c3
        visible:false
    }
    Rectangle{
        anchors.centerIn: parent
        width: app.fs*20
        height: msg.contentHeight+app.fs*5
        color: app.c2
        radius: app.fs
        Text{
            id:msg
            width: parent.width*0.9
            wrapMode: Text.WordWrap
            anchors.centerIn: parent
            font.pixelSize: app.fs
            color:app.c3
            text:r.commit===''?'<b>Atenciòn!</b><br>Hay novedades en los mòdulos y secciones de este curso.<br><br>¿Desea Actualizar Qmlandia?':'<b>Atenciòn!</b><br>Hay novedades en los mòdulos y secciones de este curso.<br><br>¿Desea Actualizar Qmlandia? <br><b>Cambios:</b> '+r.commit
        }
        Row{
            anchors.right: parent.right
            anchors.rightMargin: app.fs*0.5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: app.fs*0.5
            spacing: app.fs*0.5
            Rectangle{
                id:bot1
                width: app.fs*3
                height: app.fs*1.2
                color: app.c3
                radius: app.fs*0.25
                Behavior on width{NumberAnimation{duration:150}}
                Text{
                    anchors.centerIn: parent
                    font.pixelSize: app.fs
                    color:app.c2
                    text:'<b>Si</b> '
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var urlGit='https://github.com/nextsigner/qmlandia.git'
                        var params=urlGit
                        var m0=urlGit.split('/')
                        var s1=(''+m0[m0.length-1]).replace('.git', '')
                        var uklFileLocation=pws+'/link_'+s1+'.ukl'
                        var uklData=''+urlGit
                        uklData+=' -folder='+pws+'/'+s1+' \n'
                        unik.setFile(uklFileLocation, uklData)
                        params+=', -folder='+pws+'/'+s1
                        //params+=', -dir='+pws+'/'+s1
                        unik.setUnikStartSettings(params)
                        if(Qt.platform.os==='android'){
                            unik.restartApp()
                        }else{
                            unik.restartApp("")
                        }

                    }
                }
            }
            Rectangle{
                width: app.fs*3
                height: app.fs*1.2
                color: app.c3
                radius: app.fs*0.25
                Text{
                    anchors.centerIn: parent
                    font.pixelSize: app.fs
                    color:app.c2
                    text:'<b>No</b> '
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        r.visible=false
                    }
                }
            }
        }
    }

}
