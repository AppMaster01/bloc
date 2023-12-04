import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocc/login/login_block.dart';
import 'blocc/login/regiesterbloc.dart';
import 'LOGIN/login.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => InternetBloc(),
//       child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<LoginBlock>(
        create: (context) => LoginBlock(),
      ),
      Provider<Ragiesterblock>(
        create: (context) => Ragiesterblock(),
      ),
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Log_In()));
  }
}
