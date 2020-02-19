import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/repositories/issue_entity_repository.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double containerPadding = 10.0;

class AddIssuePage extends StatelessWidget {
  final NavigationService _service = NavigationService();
  final IssueEntityRepository _repository = IssueEntityRepository();
  final IssueEntity newIssue = IssueEntity();
  final String _repoName;

  AddIssuePage(this._repoName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create issue"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            widgetWithTextField("Title"),
            widgetWithTextField("Body"),
            widgetWithTextField("Labels"),
            widgetWithTextField("Assignees"),
            Container(
              child: RaisedButton(
                color: Colors.blue,
                child: Text("Create"),
                onPressed: () async {
                  int code = await _repository.addIssue(newIssue, _repoName);
                  showAlertDialog(context, "Status code: $code");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget widgetWithTextField(String fieldTitle) {
    return Container(
      padding: EdgeInsets.all(containerPadding),
      child: Column(
        children: <Widget>[
          Text(fieldTitle),
          TextField(
            onChanged: (text) {
              switch (fieldTitle) {
                case ("Title"):
                  newIssue.title = text;
                  break;
                case ("Body"):
                  newIssue.body = text;
                  break;
                case ("Labels"):
                  newIssue.labels = text.split(" ");
                  break;
                case ("Assignees"):
                  newIssue.assignees = text.split(" ");
                  break;
              }
            },
            decoration: InputDecoration(hintText: fieldTitle),
          ),
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
          _service.openIssuesPage(context, _repoName);
        });
        return alert;
      },
    );
  }
}
