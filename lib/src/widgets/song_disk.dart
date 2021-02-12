import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:music_player_app/src/models/audio_player_model.dart';

class SongDisk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      width: 250.0,
      height: 250.0,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff484750),
          Color(0xff1e1c24),
        ]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
                infinite: true,
                manualTrigger: true,
                controller: (controller) =>
                    audioPlayerModel.animationController = controller,
                duration: Duration(seconds: 5),
                child: Image(image: AssetImage("lib/assets/aurora.jpg"))),
            Container(
              width: 30.0,
              height: 30.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black38),
            ),
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff1c1c25)),
            ),
          ],
        ),
      ),
    );
  }
}
