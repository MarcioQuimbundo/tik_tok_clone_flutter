import 'package:flutter/material.dart';
import 'package:tik_tok_clone_flutter/src/ui/widgets/actions_toolbar.dart';
import 'package:tik_tok_clone_flutter/src/ui/widgets/bottom_toolbar.dart';
import 'package:tik_tok_clone_flutter/src/ui/widgets/video_description.dart';

class Home extends StatelessWidget {
  Widget get topSection => Container(
        height: 100.0,
        color: Colors.yellow[300],
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
    return Scaffold(
        body: Column(
            children: <Widget>[topSection, middleSection, BottomToolBar()]));
  }
}
