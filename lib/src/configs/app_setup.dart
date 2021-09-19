import 'package:flutter_starter_app/src/services/local/auth_service.dart';
import 'package:flutter_starter_app/src/services/local/connectivity_service.dart';
import 'package:flutter_starter_app/src/services/local/keyboard_service.dart';
import 'package:flutter_starter_app/src/services/remote/api_service.dart';
import 'package:flutter_starter_app/src/views/auth/auth_view.dart';
import 'package:flutter_starter_app/src/views/book_appointment/book_appointment_view.dart';
import 'package:flutter_starter_app/src/views/content_page/content_page_view.dart';
import 'package:flutter_starter_app/src/views/home/home_view.dart';
import 'package:flutter_starter_app/src/views/inquiry/inquiry_view.dart';
import 'package:flutter_starter_app/src/views/sign_up/signup_view.dart';
import 'package:flutter_starter_app/src/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ContentPageView),
    MaterialRoute(page: BookAppointmentView),
    MaterialRoute(page: InquiryView),
    MaterialRoute(page: SignUpView),
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: KeyboardService),
    LazySingleton(classType: ApiService),
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
