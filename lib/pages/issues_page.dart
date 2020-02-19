import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/api/issue_entity_api.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:app_for_github/widgets/error.dart';
import 'package:app_for_github/widgets/indicator.dart';
import 'package:app_for_github/widgets/issue.dart';
import 'package:app_for_github/widgets/no_content.dart';
import 'package:flutter/material.dart';

class IssuesPage extends StatelessWidget {
  final IssueEntityApi _repository;
  final NavigationService _service;
  final String _repoName;

  IssuesPage(this._repoName, this._service, this._repository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Issues"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _service.openAddIssuesPage(context, _repoName);
            },
          )
        ],
      ),
      body: FutureBuilder<List<IssueEntity>>(
        future: _repository.getIssues(_repoName),
        builder: _contentBuilder,
      ),
    );
  }

  Widget _contentBuilder(
      BuildContext context, AsyncSnapshot<List<IssueEntity>> snapshot) {
    if (snapshot.hasData) {
      List<IssueEntity> issues = snapshot.data;
      return issues.isNotEmpty
          ? ListView.builder(
              itemCount: issues.length,
              itemBuilder: (BuildContext context, int index) {
                return IssueWidget(issues[index]);
              })
          : NoContentWidget("No Issues");
    } else if (snapshot.hasError) {
      return WidgetForError(snapshot);
    } else {
      return ProgressAppIndicator();
    }
  }
}
