import 'package:flutter/material.dart';

import 'package:music_player_app/src/widgets/play_song.dart';
import 'package:music_player_app/src/widgets/song_lyrics.dart';
import 'package:music_player_app/src/widgets/song_player.dart';
import 'package:music_player_app/src/widgets/custom_app_bar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            children: [
              CustomAppBar(),
              SongPlayer(),
              PlaySong(),
              Expanded(child: SongLyrics())
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.72,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color(0xff33333e),
                Color(0xff201e28),
              ])),
    );
  }
}
