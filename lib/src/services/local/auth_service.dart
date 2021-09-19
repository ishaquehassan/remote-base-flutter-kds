import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class AuthService with ReactiveServiceMixin {
  ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  User? get user => _user.value;

  AuthService() {
    listenToReactiveValues([_user]);
    FirebaseAuth.instance.authStateChanges().listen((event) {
      user = event;
    });
  }

  set user(User? user) {
    _user.value = user;
  }
}
