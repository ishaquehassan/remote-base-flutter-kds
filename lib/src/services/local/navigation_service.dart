import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_app/src/configs/app_setup.locator.dart';
import 'package:flutter_starter_app/src/configs/app_setup.router.dart';
import 'package:flutter_starter_app/src/services/local/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

class NavService {
  static NavigationService? _navigationService = locator<NavigationService>();

  // key
  static GlobalKey<NavigatorState>? get key => StackedService.navigatorKey;

  // on generate route
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute =>
      StackedRouter().onGenerateRoute;

  // routes with args
  static Future<dynamic>? home({dynamic arguments}) => _navigationService!
      .clearStackAndShow(Routes.homeView, arguments: arguments);

  static Future<dynamic>? auth(
          {dynamic arguments, bool shouldReplace = true}) =>
      (shouldReplace
              ? _navigationService!.clearStackAndShow
              : _navigationService!.navigateTo)(Routes.authView,
          arguments: arguments);

  static Future<dynamic>? authSignup(
          {dynamic arguments, bool shouldReplace = true}) =>
      (shouldReplace
              ? _navigationService!.clearStackAndShow
              : _navigationService!.navigateTo)(Routes.signUpView,
          arguments: arguments);

  static Future<dynamic>? content(ContentPageViewArguments arguments) =>
      _navigationService!
          .navigateTo(Routes.contentPageView, arguments: arguments);

  static Future<dynamic>? bookAnAppointmentView({dynamic arguments}) =>
      _navigationService!
          .navigateTo(Routes.bookAppointmentView, arguments: arguments);

  static Future<dynamic>? inquiryView({dynamic arguments}) =>
      _navigationService!.navigateTo(Routes.inquiryView, arguments: arguments);

  static Future<dynamic>? securedRoute(Function route,
      {dynamic arguments}) async {
    if (locator<AuthService>().user == null) {
      var isAuthenticated = await auth(shouldReplace: false);
      if (isAuthenticated is bool && isAuthenticated) {
        route(arguments);
      }
    } else {
      route();
    }
  }

  // back route
  static bool popOut({dynamic result}) =>
      _navigationService?.back(result: result) ?? false;
  static bool get canPopOut => !(_navigationService?.isBlank ?? true);
}
