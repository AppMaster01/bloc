import 'package:bloc_demo/blocc/internet%20bloc/interner_state.dart';
import 'package:bloc_demo/blocc/internet%20bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Home Page'),
            backgroundColor: Colors.blueGrey,
            elevation: 0),
        body: Center(
          child: BlocBuilder<InternetBloc, Internetstate>(
              builder: (context, state) {
            if (state is InternetGainedState) {
              return Text('Conected.!');
            } else if (state is InternetLostState) {
              return Text('Not Conected');
            } else {
              return Text('Loading...');
            }
          }),
        )
        //         BlocConsumer<InternetBloc, Internetstate>(
        //   listener: (context, state) {
        //     if (state is InternetGainedState) {
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //         content: Text('Internet Connected'),
        //         backgroundColor: Colors.green,
        //       ));
        //     } else if (state is InternetLostState) {
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //         content: Text('Internet Not Connected'),
        //         backgroundColor: Colors.red,
        //       ));
        //     }
        //   },
        //   builder: (context, state) {
        //     if (state is InternetGainedState) {
        //       return Text('Conected.!');
        //     } else if (state is InternetLostState) {
        //       return Text('Not Conected');
        //     } else {
        //       return Text('Loading...');
        //     }
        //   },
        // )),
        );
  }
}
