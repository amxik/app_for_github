import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/api/issue_entity_api.dart';
import 'package:app_for_github/services/dialog_service.dart';
import 'package:flutter/material.dart';

const double containerPadding = 10.0;

class AddIssuePage extends StatelessWidget {
  final IssueEntityApi _repository;
  final DialogService _dialogService;
  final String _repoName;

  AddIssuePage(this._repoName, this._repository, this._dialogService);

  @override
  Widget build(BuildContext context) {
    String title;
    String body;
    List<String> labels;
    List<String> assignees;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create issue"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text("Title"),
                  TextField(
                    onChanged: (text) {
                      title = text;
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
                      body = text;
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
                      assignees = text.split(" ");
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
                      labels = text.split(" ");
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
                  IssueEntity issue = IssueEntity(
                      title: title,
                      body: body,
                      labels: labels,
                      assignees: assignees);
                  IssueEntity newIssue =
                      await _repository.addIssue(issue, _repoName);
                  _dialogService.showDialogueAfterAddingIssue(
                      context, newIssue.number);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
