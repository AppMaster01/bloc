import 'dart:core';

import 'package:bloc_demo/blocc/login/validatorbloc.dart';
import 'package:rxdart/rxdart.dart';

class Ragiesterblock with Validators {
  final name = BehaviorSubject<String>();
  final email = BehaviorSubject<String>();
  final phonnumber = BehaviorSubject<String>();
  final password = BehaviorSubject<String>();
  final conformpasword = BehaviorSubject<String>();

  Stream<String> get NAME => name.stream.transform(nameValidator);

  Stream<String> get EMAIL => email.stream.transform(emailValidator);

  Stream<String> get PHONE => phonnumber.stream.transform(phoneValidator);

  Stream<String> get PASSWRD => password.stream.transform(passwordValidator);

  Stream<String> get CONOMWORD =>
      conformpasword.stream.transform(passwordValidator);

  Function(String) get changeName => name.sink.add;

  Function(String) get changeEmail => email.sink.add;

  Function(String) get changePhone => phonnumber.sink.add;

  Function(String) get changePassword => password.sink.add;

  Function(String) get changeConformword => conformpasword.sink.add;

  Stream<bool> get isvalid => Rx.combineLatest5(
      NAME, EMAIL, PHONE, PASSWRD, CONOMWORD, (a, b, c, d, e) => false);

  Stream<bool> get isPasswordMatch =>
      Rx.combineLatest2(PASSWRD, CONOMWORD, (a, b) {
        if (a != b) {
          return false;
        } else {
          return true;
        }
      });

  void submit() {
    // print(name.value);
    // print(email.value);
    // print(phonnumber.value);
    // print(password.value);
    // print(conformpasword.value);
    if (password != CONOMWORD) {
      conformpasword.sink.addError('Password dosent match');
    }else{
      print('Register');
    }
  }

  void dispose() {
    name.close();
    email.close();
    phonnumber.close();
    password.close();
    conformpasword.close();
  }
}
