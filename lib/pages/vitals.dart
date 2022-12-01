import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class vitals extends StatefulWidget {
  const vitals({Key? key}) : super(key: key);

  @override
  State<vitals> createState() => _vitalsState();
}

class _vitalsState extends State<vitals> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(Icons.monitor_heart,size: 150,

                                  // CLASS NOT NEEDED ???????

        )
      ),
    );
  }
}
