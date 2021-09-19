import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/shared/spacing.dart';
import 'package:flutter_starter_app/src/views/home/home_view_model.dart';

class HomeItemContainer extends StatelessWidget {
  final MenuItem item;

  const HomeItemContainer({required this.item});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: Icon(item.icon, color: Colors.white),
            decoration: BoxDecoration(
                color: item.color, borderRadius: BorderRadius.circular(10))),
        HorizontalSpacing(20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.enTitle,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              VerticalSpacing(10),
              Text(item.urTitle,
                  style: TextStyle(
                      fontSize: 18,
                      height: .5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
        ),
        Icon(Icons.chevron_right)
      ],
    );
  }
}
