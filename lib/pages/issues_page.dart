
import 'package:app_for_github/models/issue_entity.dart';
import 'package:app_for_github/repositories/issue_entity_repository.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:app_for_github/widgets/issue.dart';
import 'package:flutter/material.dart';

class IssuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IssuesPageArguments arg = ModalRoute.of(context).settings.arguments;
    final IssueEntityRepository _repository = IssueEntityRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text("Issues"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 20,
            onPressed: () {
              NavigationService().openAddIssuesPage(context, arg.repoName);
            },
          )
        ],
      ),
      body: FutureBuilder<List<IssueEntity>>(
        future: _repository.getIssues(arg.repoName),
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
      return Center(
        child: Text("Error: ${snapshot.error}"),
      );
    } else {
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 60,
          width: 60,
        ),
      );
    }
  }
}
