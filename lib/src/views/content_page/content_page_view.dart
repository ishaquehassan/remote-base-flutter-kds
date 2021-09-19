import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/views/content_page/content_page_view_model.dart';
import 'package:stacked/stacked.dart';

class ContentPageView extends StatelessWidget {
  final String contentPagePath;
  final String title;
  final String subTitle;

  const ContentPageView(
      {required this.title,
      required this.subTitle,
      required this.contentPagePath});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContentPageViewModel>.reactive(
      builder: (childContext, model, _) => Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(title, style: TextStyle(color: Colors.white)),
            subtitle: Text(subTitle, style: TextStyle(color: Colors.white)),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Image.asset(contentPagePath),
        ),
      ),
      viewModelBuilder: () => ContentPageViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}
