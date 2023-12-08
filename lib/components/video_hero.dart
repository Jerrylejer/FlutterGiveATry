import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHero extends StatefulWidget {
  const VideoHero({Key? key,}) : super(key: key);

  @override
  State<VideoHero> createState() => _VideoHeroState();
}

class _VideoHeroState extends State<VideoHero> {
  late VideoPlayerController _videoHeroController;
  late Future<void> _initializeVideoHeroFuture;

  @override
  void initState() {
    _videoHeroController = VideoPlayerController.asset('web/assets/video/v1.mp4');
    _initializeVideoHeroFuture =
        _videoHeroController.initialize().then((_) {
      _videoHeroController.play();
      _videoHeroController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoHeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoHeroFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _videoHeroController.value.aspectRatio,
              child: VideoPlayer(_videoHeroController),
            );
          } else {
            return const Center(child: CircularProgressIndicator()
            );
          }
        }
      );
  }
}

