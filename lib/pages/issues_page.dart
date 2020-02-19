import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/repositories/issue_entity_repository.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:app_for_github/widgets/error.dart';
import 'package:app_for_github/widgets/indicator.dart';
import 'package:app_for_github/widgets/issue.dart';
import 'package:flutter/material.dart';

class IssuesPage extends StatelessWidget {
  final IssueEntityRepository _repository = IssueEntityRepository();
  final NavigationService _service = NavigationService();
  final String _repoName;

  IssuesPage(this._repoName);

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
      return ListView.builder(
          itemCount: issues.length,
          itemBuilder: (BuildContext context, int index) {
            return IssueWidget(issues[index]);
          });
    } else if (snapshot.hasError) {
      return WidgetForError(snapshot);
    } else {
      return CircularIndicator();
    }
  }
}
