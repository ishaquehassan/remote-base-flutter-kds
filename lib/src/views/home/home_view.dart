import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:flutter_starter_app/src/shared/home_item_container.dart';
import 'package:flutter_starter_app/src/shared/logo_with_slogan.dart';
import 'package:flutter_starter_app/src/shared/spacing.dart';
import 'package:flutter_starter_app/src/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        drawer: Drawer(
          child: Column(
            // Important: Remove any padding from the ListView.

            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        color: Colors.white,
                        child: LogoWithSlogan(size: 100, fontSize: 12)),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Color(0xFFEAEAEA),
                  child: Column(children: [
                    ListTile(
                      trailing: Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: NavService.auth,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
            title: Text("Welcome! | خوش آمدید"),
            actions: [
              GestureDetector(
                onTap: NavService.inquiryView,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.help),
                ),
              )
            ],
            centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...model.menuItems
                  .map((item) => Expanded(
                        child: GestureDetector(
                          onTap: () => model.onHomeItemClick(item),
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: HomeItemContainer(item: item)),
                          ),
                        ),
                      ))
                  .toList(),
              Expanded(
                child: GestureDetector(
                  onTap: model.onBookAppointmentTap,
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Book an appointment!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text("ملاقات کا وقت بک کروائیں۔",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
