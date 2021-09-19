import 'package:flutter_starter_app/src/services/local/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  init() async {
    await Future.delayed(Duration(milliseconds: 2000));
    NavService.auth();
  }
}
