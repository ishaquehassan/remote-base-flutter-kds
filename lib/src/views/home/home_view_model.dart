import 'package:flutter/material.dart';
import 'package:flutter_starter_app/generated/images.asset.dart';
import 'package:flutter_starter_app/src/configs/app_setup.router.dart';
import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:stacked/stacked.dart';

class MenuItem {
  final String enTitle;
  final String urTitle;
  final Color color;
  final IconData icon;
  final String imagePath;

  MenuItem(this.enTitle, this.urTitle, this.color, this.icon, this.imagePath);
}

class HomeViewModel extends BaseViewModel {
  List<MenuItem> get menuItems => [
        MenuItem("Family support", "خاندان کی امداد", Color(0xFF0065a8),
            Icons.shield, Images.familySupportContent),
        MenuItem("Awareness", "آگاہی", Color(0xFF007e41), Icons.announcement,
            Images.awarenessSupportContent),
        MenuItem("Health care", "صحت کی دیکھ بھال", Color(0xFFfdae18),
            Icons.health_and_safety, Images.hcSupportContent),
        MenuItem("Skill Development", "مہارت کی تخلیق", Color(0xFF803e93),
            Icons.umbrella, Images.skillsSupportContent),
        MenuItem("Education", "تعلیم", Color(0xFF8bc53e), Icons.book,
            Images.eduSupportContent),
        MenuItem("Early Childhood Intervention", "ابتدائی بچپن کی مداخلت",
            Color(0xFFf05822), Icons.child_care, Images.eciSupportContent),
      ];

  void onHomeItemClick(MenuItem item) {
    NavService.content(ContentPageViewArguments(
        contentPagePath: item.imagePath,
        title: item.enTitle,
        subTitle: item.urTitle));
  }

  void onBookAppointmentTap() {
    NavService.bookAnAppointmentView();
  }
}
