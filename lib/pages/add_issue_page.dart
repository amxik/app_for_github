import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/api/issue_entity_api.dart';
import 'package:flutter/material.dart';

const double containerPadding = 10.0;

class AddIssuePage extends StatefulWidget {
  final IssueEntityApi _repository;
  final String _repoName;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AddIssuePage(this._repoName, this._repository);

  @override
  _AddIssuePageState createState() => _AddIssuePageState();
}

class _AddIssuePageState extends State<AddIssuePage> {
  String title;
  String body;
  List<String> labels;
  List<String> assignees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      appBar: AppBar(
        title: Text("Create issue"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _getTextField("Title"),
            _getTextField("Body"),
            _getTextField("Labels"),
            _getTextField("Assignees"),
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
                  IssueEntity newIssue = await widget._repository
                      .addIssue(issue, widget._repoName);
                  await _showInSnackBar(newIssue.number);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getTextField(String fieldTitle) {
    return Container(
      padding: EdgeInsets.all(containerPadding),
      child: TextFormField(
        onChanged: (text) {
          switch (fieldTitle) {
            case ("Title"):
              title = text;
              break;
            case ("Body"):
              body = text;
              break;
            case ("Labels"):
              labels = text.split(" ");
              break;
            case ("Assignees"):
              assignees = text.split(" ");
              break;
          }
        },
        decoration:
            InputDecoration(hintText: fieldTitle, labelText: fieldTitle),
      ),
    );
  }

  Future<void> _showInSnackBar(int number) async {
    ScaffoldFeatureController controller = widget._scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: Text(number != null ? "Issue #$number created" : "Error"),
    duration: Duration(seconds: 1)));
  }
}
