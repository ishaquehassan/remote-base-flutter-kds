import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:flutter_starter_app/src/shared/logo_with_slogan.dart';
import 'package:flutter_starter_app/src/shared/spacing.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'auth_view_model.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
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
                      Transform.translate(
                        offset: Offset(0, 22),
                        child: TextFormField(
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            enabled: !model.isBusy,
                            keyboardType: TextInputType.phone,
                            onChanged: model.onPhoneNumberChanged,
                            decoration: InputDecoration(
                                helperMaxLines: null,
                                hintMaxLines: null,
                                errorMaxLines: null,
                                focusColor: model.isInValidNumber
                                    ? Colors.grey
                                    : Colors.green,
                                floatingLabelStyle: TextStyle(
                                    color: model.isInValidNumber
                                        ? Colors.grey
                                        : Colors.green),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: model.isInValidNumber
                                            ? Colors.grey
                                            : Colors.green)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: model.isInValidNumber
                                            ? Colors.grey
                                            : Colors.green)),
                                labelText: "Enter your phone number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                prefixText: "+92 ")),
                      ),
                      GestureDetector(
                        onTap: model.isInValidNumber || model.isBusy
                            ? null
                            : model.onLoginSubmit,
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
                              : Text("Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      VerticalSpacing(10),
                      GestureDetector(
                        onTap: NavService.authSignup,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                              child: Text(
                            "Not a member yet? Join Now",
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
      viewModelBuilder: () => AuthViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}
