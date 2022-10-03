import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const appId = "2f618369bd834efd91537ed2ca5baa77";
const token =
    "0062f618369bd834efd91537ed2ca5baa77IADOFJR0SJ9aaSe1eXCo4Mymtv4Z6gB4TRfi9pB2DBcPbdzDPrsAAAAAEADL5xHfYhMJYgEAAQBhEwli";

class CallPage extends StatefulWidget {
  static const String id = 'call_screen';
  const CallPage({Key? key}) : super(key: key);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  late int _remoteUid = 0;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initForAgora();
  }

  Future<void> initForAgora() async {
    await [Permission.microphone, Permission.camera].request();

    //engine oluştur
    _engine = await RtcEngine.create(appId);

    await _engine.enableVideo();

    _engine.setEventHandler(
      RtcEngineEventHandler(
          joinChannelSuccess: (String channel, int uid, int elapsed) {
        print("local user $uid joined");
      }, userJoined: (int uid, int elapsed) {
        print("remote user $uid joined");
        setState(() {
          _remoteUid = uid;
        });
      }, userOffline: (int uid, UserOfflineReason reason) {
        print("remote user $uid left channel");
        setState(() {
          _remoteUid = 0;
        });
      }),
    );

    await _engine.joinChannel(token, "firstchannel", null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: _renderRemoteVideo(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 200,
              height: 200,
              child: _renderLocalPreview(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                setState((){
                  _engine.setEventHandler(RtcEngineEventHandler());
                });
              },
              child: Icon(Icons.videocam_off,color: Colors.white,size: 40.0,),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15.0)),
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red.shade700),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.red)))),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderLocalPreview() {
    return RtcLocalView.SurfaceView();
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != 0) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid, channelId: appId);
    } else {
      return Text(
        'Lütfen uzaktan kullanıcının katılmasını bekleyin',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'UbuntuMono',
          color: Colors.white,
          fontSize: 50.0,
        ),
      );
    }
  }
}
