// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/auth/auth_view.dart';
import '../views/book_appointment/book_appointment_view.dart';
import '../views/content_page/content_page_view.dart';
import '../views/home/home_view.dart';
import '../views/inquiry/inquiry_view.dart';
import '../views/sign_up/signup_view.dart';
import '../views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String authView = '/auth-view';
  static const String homeView = '/home-view';
  static const String contentPageView = '/content-page-view';
  static const String bookAppointmentView = '/book-appointment-view';
  static const String inquiryView = '/inquiry-view';
  static const String signUpView = '/sign-up-view';
  static const all = <String>{
    splashView,
    authView,
    homeView,
    contentPageView,
    bookAppointmentView,
    inquiryView,
    signUpView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.contentPageView, page: ContentPageView),
    RouteDef(Routes.bookAppointmentView, page: BookAppointmentView),
    RouteDef(Routes.inquiryView, page: InquiryView),
    RouteDef(Routes.signUpView, page: SignUpView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    AuthView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => AuthView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ContentPageView: (data) {
      var args = data.getArgs<ContentPageViewArguments>(nullOk: false);
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ContentPageView(
          title: args.title,
          subTitle: args.subTitle,
          contentPagePath: args.contentPagePath,
        ),
        settings: data,
      );
    },
    BookAppointmentView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => BookAppointmentView(),
        settings: data,
      );
    },
    InquiryView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => InquiryView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ContentPageView arguments holder class
class ContentPageViewArguments {
  final String title;
  final String subTitle;
  final String contentPagePath;
  ContentPageViewArguments(
      {required this.title,
      required this.subTitle,
      required this.contentPagePath});
}
