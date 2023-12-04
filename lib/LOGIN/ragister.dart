import 'package:bloc_demo/LOGIN/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocc/login/regiesterbloc.dart';

class Ragiste extends StatefulWidget {
  const Ragiste({super.key});

  @override
  State<Ragiste> createState() => _RagisteState();
}

class _RagisteState extends State<Ragiste> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Ragiesterblock>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffc2e0f9),
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: bloc.name,
                  builder: (context, snapshot) => TextField(
                    onChanged: (value) => bloc.changeName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'Enter  Name',
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: bloc.EMAIL,
                  builder: (context, snapshot) => TextField(
                    onChanged: (value) => bloc.changeEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter  Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: bloc.PHONE,
                  builder: (context, snapshot) => TextField(
                    onChanged: (value) => bloc.changePhone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter  Phone number',
                        labelText: 'Phone number',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: bloc.PASSWRD,
                  builder: (context, snapshot) => TextField(
                    onChanged: (value) => bloc.changePassword,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter  Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder(
                  stream: bloc.CONOMWORD,
                  builder: (context, snapshot) => TextField(
                    onChanged: (value) => bloc.changeConformword,
                    obscureText: visible ? false : true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Conform  Pasword',
                        labelText: 'Conform Pasword',
                        suffixIcon: IconButton(
                          icon: visible
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),
              SizedBox(height: 20),
              BuildButton(),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Already have an accunt?  ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'Login here',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Log_In(),
                        ));
                      }),
              ])),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildButton() {
    final bloc = Provider.of<Ragiesterblock>(context, listen: false);

    return StreamBuilder(
      stream: bloc.isvalid,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: snapshot.hasError || !snapshot.hasData
              ? null
              : () {
                  bloc.submit();
                },
          child: Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(
                color: snapshot.hasError ? Colors.grey : Color(0xffff69b4),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text('Register',
                  style: TextStyle(fontSize: 21, color: Colors.white)),
            ),
          ),
        );
      },
    );
  }
}
