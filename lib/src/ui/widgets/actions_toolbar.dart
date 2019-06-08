import 'package:flutter/material.dart';
import 'package:tik_tok_clone_flutter/tik_tok_icons.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class ActionsToolbar extends StatelessWidget {
  // full dimensions of an action
  static const double ActionWidgetSize = 60.0;

  //The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

  //The size of the share social icon
  static const double ShareActionIconSize = 25.0;

  //The size of the profile image in the follow action
  static const double ProfileImageSize = 50.0;

  //The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getSocialAction(icon: TikTokIcons.heart, title: '3.2m'),
        _getSocialAction(icon: TikTokIcons.chat_bubble, title: '16.4k'),
        _getSocialAction(
            icon: TikTokIcons.reply, title: '16.4k', isShare: true),
      ]),
    );
  }

  Widget _getSocialAction({String title, IconData icon, bool isShare = false}) {
    return Container(
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(
        children: [
          Icon(icon,
              size: isShare ? ShareActionIconSize : ActionIconSize,
              color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child:
                Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ],
      ),
    );
  }

  Widget _getFollowAction() {
    return Container(
      height: ActionWidgetSize,
      width: ActionWidgetSize,
      child: Stack(
        children: <Widget>[
          _getProfilePicture(),
          _getPlusIcon(),
        ],
      ),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
      child: Container(
        height: ProfileImageSize,
        width: ProfileImageSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ProfileImageSize / 2),
        ),
        child: Container(),//CachedNetworkImage(),
      ),
    );
  }
  Widget _getPlusIcon() {}
}
