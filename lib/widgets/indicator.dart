import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: 60,
        width: 60,
      ),
    );
  }
}
