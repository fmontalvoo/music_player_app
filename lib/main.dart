import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:music_player_app/src/models/audio_player_model.dart';

import 'package:music_player_app/src/pages/music_player_page.dart';

import 'package:music_player_app/src/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AudioPlayerModel())],
      child: MaterialApp(
        title: 'Music Player',
        theme: appTheme,
        home: MusicPlayerPage(),
      ),
    );
  }
}
