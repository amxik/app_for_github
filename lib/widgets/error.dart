import 'package:flutter/material.dart';

class WidgetForError extends StatelessWidget {
  final AsyncSnapshot snapshot;

  WidgetForError(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Error: ${snapshot.error}"),
    );
  }
}
