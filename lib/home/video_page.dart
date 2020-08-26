/***
 * 视频详情界面
 */

import 'package:flutter/material.dart';
import 'video_player_UI.dart';
class VideoPage extends StatelessWidget {
  static final String routerName = '/VideoPage';
//  Size get _window => MediaQueryData.fromWindow(window).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // 该组件宽高默认填充父控件，你也可以自己设置宽高
        child: VideoPlayerUI.network(
          url:
          'https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo-transcode-crf/60609889_0b5d29ee8e09fad4cc4f40f314d737ca_0.mp4',
          title: '示例视频',
        ),
      ),
    );
  }
}