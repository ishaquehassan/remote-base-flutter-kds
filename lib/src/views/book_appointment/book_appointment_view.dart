import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:flutter_starter_app/src/shared/app_form_field.dart';
import 'package:flutter_starter_app/src/shared/logo_with_slogan.dart';
import 'package:stacked/stacked.dart';

import 'book_appointment_view_model.dart';

class BookAppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookAppointmentViewModel>.reactive(
      builder: (childContext, model, _) => Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text("Book an appointment",
                style: TextStyle(color: Colors.white)),
            subtitle: Text("ملاقات کا وقت بک کروائیں",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppFormField(hintText: "Date"),
              AppFormField(hintText: "Reason", isMultiline: true),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: NavService.popOut, child: Text("BOOK"))),
                ],
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => BookAppointmentViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}
