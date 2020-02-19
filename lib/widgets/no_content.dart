import 'package:flutter/material.dart';

class NoContentWidget extends StatelessWidget {
  final String text;

  NoContentWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
