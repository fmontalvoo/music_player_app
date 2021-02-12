import 'package:flutter/material.dart';

import 'package:music_player_app/src/widgets/song_disk.dart';
import 'package:music_player_app/src/widgets/song_progress_bar.dart';

class SongPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SongDisk(),
          SizedBox(width: 40.0),
          SongProgressBar(),
        ],
      ),
    );
  }
}
