import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:flutter_starter_app/src/shared/app_form_field.dart';
import 'package:flutter_starter_app/src/shared/logo_with_slogan.dart';
import 'package:flutter_starter_app/src/shared/spacing.dart';
import 'package:stacked/stacked.dart';

import 'signup_view_model.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (childContext, model, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWithSlogan(),
              VerticalSpacing(30),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _formField(model, 2, label: "Enter your Full Name"),
                      _formField(model, 1,
                          label: "Enter your phone number",
                          prefix: "+92 ",
                          inputType: TextInputType.phone),
                      GestureDetector(
                        onTap: model.isInValidNumber || model.isBusy
                            ? null
                            : model.onSignUpSubmit,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: model.isInValidNumber || model.isBusy
                                  ? Colors.grey
                                  : Colors.green,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: model.isBusy
                              ? Center(
                                  child: SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
                                )
                              : Text("Sign Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      VerticalSpacing(10),
                      GestureDetector(
                        onTap: NavService.auth,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                              child: Text(
                            "Already a member? Sign In Now",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => model.init(),
    );
  }

  Widget _formField(SignUpViewModel model, double dy,
          {String? label, String? prefix, TextInputType? inputType}) =>
      Transform.translate(
        offset: Offset(0, dy),
        child: TextFormField(
            maxLength: 10,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            enabled: !model.isBusy,
            keyboardType: inputType,
            onChanged: model.onPhoneNumberChanged,
            decoration: InputDecoration(
                counterText: "",
                helperMaxLines: null,
                hintMaxLines: null,
                errorMaxLines: null,
                focusColor: model.isInValidNumber ? Colors.grey : Colors.green,
                floatingLabelStyle: TextStyle(
                    color: model.isInValidNumber ? Colors.grey : Colors.green),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dy == 1 ? 0 : 5),
                        topRight: Radius.circular(dy == 1 ? 0 : 5)),
                    borderSide: BorderSide(
                        color: model.isInValidNumber
                            ? Colors.grey
                            : Colors.green)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dy == 1 ? 0 : 5),
                        topRight: Radius.circular(dy == 1 ? 0 : 5)),
                    borderSide: BorderSide(
                        color: model.isInValidNumber
                            ? Colors.grey
                            : Colors.green)),
                hintText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                prefixText: prefix ?? "        ")),
      );
}
