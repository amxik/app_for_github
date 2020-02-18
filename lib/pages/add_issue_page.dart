import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/repositories/issue_entity_repository.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:flutter/material.dart';

class AddIssuePage extends StatefulWidget {
  @override
  _AddIssuePageState createState() => _AddIssuePageState();
}

class _AddIssuePageState extends State<AddIssuePage> {
  @override
  Widget build(BuildContext context) {
    final IssuesPageArguments arg = ModalRoute.of(context).settings.arguments;
    IssueEntity newIssue = IssueEntity();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create issue"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text("Title"),
                TextField(
                  onChanged: (text) {
                    newIssue.title = text;
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("Body"),
                TextField(
                  onChanged: (text) {
                    newIssue.body = text;
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("Assignees"),
                TextField(
                  onChanged: (text) {
                    newIssue.assignees = text.split(" ");
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("Labels"),
                TextField(
                  onChanged: (text) {
                    newIssue.labels = text.split(" ");
                  },
                ),
              ],
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.blue,
              child: Text("Create"),
              onPressed: () async {
                int code = await IssueEntityRepository()
                    .addIssue(newIssue, arg.repoName);
                showAlertDialog(context, "Status code: $code");
              },
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      title: Text(message),
    );

    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return alert;
      },
    );
  }
}
