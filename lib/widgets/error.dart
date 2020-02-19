import 'package:flutter/material.dart';

class WidgetForError extends StatelessWidget {
  final AsyncSnapshot snapshot;

  WidgetForError(this.snapshot);

  @override
  Widget build(BuildContext context) {
    print(snapshot.error);

    return Center(
      child: Text("Please try again."),
    );
  }
}
