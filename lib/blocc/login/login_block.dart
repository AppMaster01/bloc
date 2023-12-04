import 'dart:async';

import 'package:bloc_demo/blocc/login/validatorbloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlock with Validators {
  final loginEmail = BehaviorSubject<String>();
  final loginpassword = BehaviorSubject<String>();

  Stream<String> get Email => loginEmail.stream.transform(emailValidator);

  Stream<String> get Password =>
      loginpassword.stream.transform(passwordValidator);

  Stream<bool> get isvalid =>
      Rx.combineLatest2(Email, Password, (Email, Password) => true);

  Function(String) get changeLoginEmail => loginEmail.sink.add;

  Function(String) get changeLoginPassword => loginpassword.sink.add;

  void submit() {
    print(loginEmail.value);
    print(loginpassword.value);
  }

  void dispose() {
    loginEmail.close();
    loginpassword.close();
  }
}
