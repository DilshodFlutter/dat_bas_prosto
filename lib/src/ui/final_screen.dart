import 'package:flutter/cupertino.dart';

class FinalSCreen extends StatefulWidget {
  const FinalSCreen({Key? key}) : super(key: key);

  @override
  State<FinalSCreen> createState() => _FinalSCreenState();
}

class _FinalSCreenState extends State<FinalSCreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('OK'),
      ),
    );
  }
}
