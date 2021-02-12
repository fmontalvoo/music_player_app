import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:music_player_app/src/models/audio_player_model.dart';

class PlaySong extends StatefulWidget {
  @override
  _PlaySongState createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  bool _firstTime = true;
  AnimationController _animationController;

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    this._animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    this._animationController?.dispose();
  }

  void openSong() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);
    assetsAudioPlayer.open(Audio("lib/assets/Breaking-Benjamin-Far-Away.mp3"));
    assetsAudioPlayer.currentPosition
        .listen((duration) => audioPlayerModel.currentDuration = duration);
    assetsAudioPlayer.current.listen(
        (playing) => audioPlayerModel.songDuration = playing.audio.duration);
  }

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Far Away",
                style: TextStyle(
                    fontSize: 30.0, color: Colors.white.withOpacity(0.8)),
              ),
              Text(
                "-Breaking Benjamin-",
                style: TextStyle(
                    fontSize: 15.0, color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Color(0xfff8cb51),
              child: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: this._animationController),
              onPressed: () {
                if (this._isPlaying) {
                  this._isPlaying = false;
                  this._animationController.reverse();
                  audioPlayerModel.animationController.stop();
                } else {
                  this._isPlaying = true;
                  this._animationController.forward();
                  audioPlayerModel.animationController.repeat();
                }
                if (this._firstTime) {
                  this.openSong();
                  this._firstTime = false;
                } else {
                  assetsAudioPlayer.playOrPause();
                }
              })
        ],
      ),
    );
  }
}
