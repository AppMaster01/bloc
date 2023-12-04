import 'package:bloc_demo/LOGIN/ragister.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocc/login/login_block.dart';

class Log_In extends StatefulWidget {
  const Log_In({super.key});

  @override
  State<Log_In> createState() => _Log_InState();
}

class _Log_InState extends State<Log_In> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBlock>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffc2e0f9),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(10),
              child: StreamBuilder(
                stream: bloc.loginEmail,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) =>
                        TextField(
                  onChanged: (value) => bloc.changeLoginEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Enter User Name',
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: StreamBuilder(
                stream: bloc.loginpassword,
                builder: (context, snapshot) => TextField(
                  onChanged: (value) => bloc.changeLoginPassword,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
            ),
            SizedBox(height: 20),
            BuildButton(),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Need an accunt?  ',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Ragister here',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ragiste()));
                    }),
            ])),
          ],
        ),
      ),
    );
  }

  Widget BuildButton() {
    final bloc = Provider.of<LoginBlock>(context, listen: false);
    return StreamBuilder(
      stream: bloc.isvalid,
      builder: (context, snapshot) => GestureDetector(
        onTap: snapshot.hasError || !snapshot.hasData
            ? null
            : () {
                bloc.submit();
              },
        child: Container(
          height: 35,
          width: 100,
          decoration: BoxDecoration(
              color: snapshot.hasError ? Colors.grey : Color(0xffff69b4),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text('Login',
                style: TextStyle(fontSize: 21, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
