import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// VIDEO ######################################### VIDEO
// AIDES => https://stackoverflow.com/questions/75001588/how-to-play-video-from-video-path-in-flutter
// => https://docs.flutter.dev/cookbook/plugins/play-video

class VideoHero extends StatefulWidget {
  const VideoHero({super.key});

  @override
  State<VideoHero> createState() => _VideoHeroState();
}

class _VideoHeroState extends State<VideoHero> {

  late VideoPlayerController _videoPlayerController;
  
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('web/assets/video/v1.mp4')
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.setLooping(true);
            _videoPlayerController.play();
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Stack(
              children: <Widget>[
                VideoPlayer(_videoPlayerController),
                const Positioned(bottom:230,left:120, child: Text("France Data", style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 5,
                    color: Colors.white)),),
                const Positioned(bottom:200,left:60, child: Text("Atlas des données de France", style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 4,
                    color: Colors.white)),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
