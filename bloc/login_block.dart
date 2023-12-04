// import 'package:rxdart/rxdart.dart';
//
// class LoginBlock {
//   final loginEmail = BehaviorSubject<String>();
//   final loginpassword = BehaviorSubject<String>();
//   Stream<String> get Email => loginEmail.stream;
//   Stream<String> get Password => loginpassword.stream;
//   Function(String) get changeLoginEmail =>loginEmail.sink.add;
//   Function(String) get changeLoginPassword =>loginpassword.sink.add;
//
//
//   void dispose(){
//     loginEmail.close();
//     loginpassword.close();
//   }
// }
