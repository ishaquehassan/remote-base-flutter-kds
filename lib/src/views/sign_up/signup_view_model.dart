import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  String _phoneNum = "";
  String get phoneNum => this._phoneNum;

  get isInValidNumber => phoneNum.length < 10;

  set phoneNum(String value) {
    this._phoneNum = value;
    notifyListeners();
  }

  init() async {}

  void onPhoneNumberChanged(String value) => phoneNum = value;

  void onSignUpSubmit() async {
    setBusy(true);
    await Future.delayed(Duration(milliseconds: 2000));
    setBusy(false);
    NavService.home();
  }
}
