import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mtax24/model/model.dart';


abstract class BaseController {
  BaseModel get model;

  onError(error, {@required String source}) {
    print("onError: $error");
    if(error is String){
      model.setError(error: error, source: source);
    }
    model.setLoading(loading: false, source: source);
  }

  onLoading({@required String source}) {
    model.clearError(source: source);
    model.setLoading(loading: true, source: source);
  }

  onCompleted(result, {@required String source}) {
    model.clearError(source: source);
    model.setLoading(loading: false, source: source);
  }

  execute<T>(FutureOr<T> computation(),
      {onLoading(),
      onCompleted(T result),
      onError(dynamic),
      @required String source}) async {
    if (onLoading != null)
      onLoading();
    else
      this.onLoading(source: source);

    try {
      final result = await Future.sync(computation);
      if (onCompleted != null)
        onCompleted(result);
      else
        this.onCompleted(result, source: source);
    } catch (error) {
      if (onError != null)
        onError(error);
      else
        this.onError(error, source: source);
    }
  }
}
