import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostVideo extends StatefulWidget {
  final String postId;
  final String url;
  final double size;
  final String? discription;
  final double aspectRatio;
  const PostVideo(this.url,
      {this.discription,
      this.size = 100,
      this.aspectRatio = 1.0,
      required this.postId});

  @override
  _PostVideoState createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    if (_videoPlayerController == null) return;
    _videoPlayerController!.initialize().whenComplete(() {
      setState(() {
        initialized = true;
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return Container(
        height: widget.size,
        width: widget.size,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoInitialize: true,
      showControls: true,
      autoPlay: false,
      allowMuting: true,
      allowedScreenSleep: false,
      looping: true,
      playbackSpeeds: [],
      showControlsOnInitialize: true,
      allowPlaybackSpeedChanging: false,
      showOptions: false,
      aspectRatio: _videoPlayerController!.value.aspectRatio,
    );
    return Container(
      color: Colors.white,
      height: 370,
      width: MediaQuery.of(context).size.width,
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.discription ?? '',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.grey.withOpacity(0.4),
            height: 300,
            child: AspectRatio(
              aspectRatio: widget.aspectRatio,
              child: Stack(
                children: <Widget>[
                  Chewie(
                    controller: _chewieController!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
