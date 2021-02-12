import 'package:flutter/material.dart';
import 'package:music_player_app/src/helpers/helpers.dart';

class SongLyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42.0,
        diameterRatio: 2.5,
        physics: BouncingScrollPhysics(),
        children: getLyrics()
            .map((lyric) => Text(lyric,
                style: TextStyle(
                    fontSize: 20.0, color: Colors.white.withOpacity(0.6))))
            .toList(),
      ),
    );
  }
}
