import 'package:flutter/material.dart';
import 'package:tik_tok_clone_flutter/src/ui/widgets/actions_toolbar.dart';
import 'package:tik_tok_clone_flutter/src/ui/widgets/bottom_toolbar.dart';
import 'package:tik_tok_clone_flutter/src/ui/widgets/video_description.dart';
import 'package:camera/camera.dart';

class Home extends StatefulWidget {
  final List<CameraDescription> cameras;

  Home(this.cameras);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraController controller;
  @override
  void initState() {
    super.initState();
    try {
      onCameraSelected(widget.cameras[0]);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget get topSection => Container(
        height: 100.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Following"),
            Container(
              width: 15.0,
            ),
            Text("For you",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold))
          ],
        ),
      );

  Widget get middleSection => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[VideoDescription(), ActionsToolbar()],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRation = size.width / size.height;
    if (!controller.value.initialized) {
      return new Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            children: <Widget>[
              (!controller.value.initialized)
                  ? Container()
                  : CameraPreview(
                      controller,
                    ),
              Column(children: <Widget>[
                topSection,
                middleSection,
                BottomToolBar(),
                SizedBox(
                  height: 10,
                )
              ]),
            ],
          ),
        ));
  }

  void onCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) await controller.dispose();
    controller = CameraController(cameraDescription, ResolutionPreset.medium);

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        print('Camera Error: ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) setState(() {});
  }
}
