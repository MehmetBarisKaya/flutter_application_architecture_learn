// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

class ThrottleHelper {
  late String _pastText;
  final int _maxTimerValue = 5;
  int _timerValue = 0;
  ThrottleHelper() {
    _onSetmaxValue();
  }

  void onDelaytouch(String text, Function(String text) onComplete) {
    _pastText = text;
    if (_timerValue == _maxTimerValue) {
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        _timerValue--;
        if (_timerValue == 0) {
          onComplete(_pastText);
          timer.cancel();
          _onSetmaxValue();
        }
      });
    } else {
      _timerValue = _maxTimerValue - 1;
    }
  }

  void _onSetmaxValue() {
    _timerValue = _maxTimerValue;
  }
}
