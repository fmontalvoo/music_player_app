import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:music_player_app/src/models/audio_player_model.dart';

class SongProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.songPercent;

    return Container(
      child: Column(
        children: [
          _SongDuration(time: audioPlayerModel.songTotalDuration),
          Stack(
            children: [
              Container(
                width: 4.0,
                height: 230.0,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: 4.0,
                  height: 230.0 * porcentaje,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          _SongDuration(time: audioPlayerModel.songCurrentDuration),
        ],
      ),
    );
  }
}

class _SongDuration extends StatelessWidget {
  final String time;

  _SongDuration({this.time});
  @override
  Widget build(BuildContext context) {
    return Text(
      this.time,
      style: TextStyle(color: Colors.white.withOpacity(0.4)),
    );
  }
}
