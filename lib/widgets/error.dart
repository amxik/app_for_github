import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;

  AppErrorWidget(this.snapshot);

  @override
  Widget build(BuildContext context) {
    print(snapshot.error);

    return Center(
      child: Text("Please try again."),
    );
  }
}
