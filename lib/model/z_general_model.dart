import 'package:flutter/cupertino.dart';
import 'package:mtax24/model/base_model.dart';

class GeneralModel extends BaseModel {
  final ValueNotifier<bool> toggleObscureInput = new ValueNotifier<bool>(true);
  final ValueNotifier<String> errorText = new ValueNotifier<String>("");

  void setToggleObscureInput({@required bool toggleObscureInput}) {
    this.toggleObscureInput.value = toggleObscureInput;
    clearError();
  }

  void setErrorText({@required String errorText}) {
    this.errorText.value = errorText;
    clearError();
  }
}