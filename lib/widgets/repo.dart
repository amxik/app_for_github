import 'package:app_for_github/models/repo_entity.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double containerHeight = 60.0;

class RepoWidget extends StatelessWidget {
  final NavigationService _service = NavigationService();
  final RepoEntity _repoEntity;

  RepoWidget(this._repoEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          _service.openIssuesPage(context, _repoEntity.name);
        },
        child: Container(
          color: Theme.of(context).backgroundColor,
          height: containerHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_repoEntity.name, style: Theme.of(context).textTheme.title),
              Text(_repoEntity.fullName),
              Text("User login: ${_repoEntity.owner}"),
            ],
          ),
        ),
      ),
    );
  }
}
