import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/configs/app_setup.locator.dart';
import 'package:flutter_starter_app/src/services/local/auth_service.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  TextEditingController pinCodeCtrl = TextEditingController();

  String _phoneNum = "";
  String get phoneNum => this._phoneNum;

  get isInValidNumber => phoneNum.length < 10;

  set phoneNum(String value) {
    this._phoneNum = value;
    notifyListeners();
  }

  init() async {}

  void onPhoneNumberChanged(String value) => phoneNum = value;

  void onLoginSubmit() async {
    setBusy(true);
    await Future.delayed(Duration(milliseconds: 2000));
    setBusy(false);
    NavService.home();
  }

  onPinCodeDone(String code) async {
    NavService.home();
  }
}
