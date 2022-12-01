import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(EvaIcons.eye,size: 150,)),
    );
  }
}
