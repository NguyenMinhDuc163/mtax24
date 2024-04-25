import 'package:rxdart/rxdart.dart';
import 'dart:async';

class  StreamValidate<T>{

  Stream<T> get stream => _currentAuthStateController?.stream;

  // ignore: strict_raw_type
  final StreamController _currentAuthStateController = BehaviorSubject<T>();

  void notify(T dataStream) {
    if (_currentAuthStateController != null && !_currentAuthStateController.isClosed) {
      _currentAuthStateController?.sink?.add(dataStream);
    }
  }

  String notifyErrorInput(String dataStream) {
    if (_currentAuthStateController != null && !_currentAuthStateController.isClosed) {
      _currentAuthStateController?.sink?.addError(dataStream);
    }
    return '';
  }
  String notifyDoneInput(String dataStream) {
    if (_currentAuthStateController != null && !_currentAuthStateController.isClosed) {
      _currentAuthStateController?.sink?.add(dataStream);
    }
    return '';
  }
}
