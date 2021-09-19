import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:flutter_starter_app/src/shared/app_form_field.dart';
import 'package:flutter_starter_app/src/shared/spacing.dart';
import 'package:stacked/stacked.dart';

import 'inquiry_view_model.dart';

class InquiryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InquiryViewModel>.reactive(
      builder: (childContext, model, _) => Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text("Inquiry", style: TextStyle(color: Colors.white)),
            subtitle: Text("تحقیقات", style: TextStyle(color: Colors.white)),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              VerticalSpacing(20),
              AppFormField(hintText: "Comments", isMultiline: true),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: NavService.popOut,
                          child: Text("INQUIRE"))),
                ],
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => InquiryViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}
