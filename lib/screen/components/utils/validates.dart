
import '../../init_view.dart';

// ignore: prefer_mixin
class Validates {
  Validates(this.translate);

  final AppTranslate translate;
  StreamValidate<String> streamValidate = StreamValidate();
  // ignore: inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
  validateInput(text, typeInput) {
    switch (typeInput) {
    // ignore: inference_failure_on_function_return_type
      case ACCOUNT:
        userValidator(text);
        break;
      case PASSWORD:
        passValidator(text);
        break;

      case OLD_PASS:
        (emailValidator(text) == false)
            ? streamValidate.notifyErrorInput("Vui lòng nhập mật khẩu")
            : streamValidate.notifyDoneInput('');
        break;
      case NEW_PASS:
        (emailValidator(text) == false)
            ? streamValidate.notifyErrorInput("Vui lòng nhập mật khẩu")
            : streamValidate.notifyDoneInput('');
        break;
    // case AMOUNT_MONEY:
    // (text == "12")
    //     ? streamController.notifyErrorInput("tai khoan nhan 123")
    //     : streamController.notifyDoneInput('');
    // break;
    // case CONTENT:
    //   (text == "12")
    //       ? streamController.notifyErrorInput("tai khoan nhan 123")
    //       : streamController.notifyDoneInput('');
    //   break;
    // case RECIPIENT_NAME:
    //   (text == "")
    //       ? streamController.notifyErrorInput(tr('internal-transfer.ALERT_BENEFIT_NAME'))
    //       : streamController.notifyDoneInput('');
    //   break;
    // case EMAIL:
    //  emailValidator(text);
    //   break;
    //   case OTPLOGIN:
    //  otpLoginValidator(text);
    //   break;

      default:
    }
  }

// TODO hàm regex

  static Pattern regExpEmail =
      r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
  static Pattern regExpNewPassword =
      r'((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!&*^?]).{6,100})';

  bool emailValidator([value]) {
    if (!(value.contains(new RegExp(regExpEmail))))
      return false;
    else
      return true;
  }

  String userValidator(String value) {
    print(streamValidate.stream);

    if (value == "" || value == null) {
      return streamValidate
          .notifyErrorInput('Vui lòng nhập tài khoản');
    } else {
      return streamValidate.notifyDoneInput('');
    }

  }
  String passValidator(String value) {
    print(streamValidate.stream);

    if (value == "" || value == null) {
      return streamValidate
          .notifyErrorInput('Vui lòng nhập mật khẩu');
    } else {
      return streamValidate.notifyDoneInput('');
    }

  }
}

// các loại input muốn validate xem là validate ô nào nó là định danh id
const String OLD_PASS = "oldpass";
const String NEW_PASS = "newpass";
const String CF_NEW_PASS = "cfnewpass";
const String ACCOUNT_RECEIVE = "account_receive";
const String AMOUNT_MONEY = "amount_money";
const String CONTENT = "content";
const String EMAIL = "email";
const String ACCOUNT = "account";
const String PASSWORD = "password";
const String OTPLOGIN = "OTPLOGIN";
const String NONE = "NONE";
const String RECIPIENT_NAME = "Recipient's_name";
