import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  AnimationController _controller;

  Duration _songDuration = Duration();
  Duration _currentDuration = Duration();

  set playing(bool playing) {
    this._playing = playing;
    notifyListeners();
  }

  bool get playing => this._playing;

  set animationController(AnimationController controller) =>
      this._controller = controller;

  AnimationController get animationController => this._controller;

  Duration get songDuration => this._songDuration;
  set songDuration(Duration songDuration) {
    this._songDuration = songDuration;
    notifyListeners();
  }

  Duration get currentDuration => this._currentDuration;
  set currentDuration(Duration currentDuration) {
    this._currentDuration = currentDuration;
    notifyListeners();
  }

  String get songTotalDuration => this.showDuration(this._songDuration);
  String get songCurrentDuration => this.showDuration(this._currentDuration);

  double get songPercent => (this._songDuration.inSeconds > 0)
      ? this._currentDuration.inSeconds / this._songDuration.inSeconds
      : 0;

  String showDuration(Duration duration) {
    String twoDigits(int n) => (n >= 10) ? "$n" : "0$n";
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitsMinutes:$twoDigitsSeconds";
  }
}
