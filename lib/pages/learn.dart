import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class learn extends StatefulWidget {
  const learn({Key? key}) : super(key: key);

  @override
  State<learn> createState() => _learnState();
}

class _learnState extends State<learn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(CupertinoIcons.news,size: 150,)),
    );
  }
}