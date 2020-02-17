import 'package:app_for_github/models/repo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RepoWidget extends StatelessWidget {
  final RepoEntity _repoEntity;

  RepoWidget(this._repoEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
            print(_repoEntity.name);
        },
        child: Container(
          color: Colors.blue[300],
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_repoEntity.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(_repoEntity.fullName),
              Text("User login: ${_repoEntity.owner}"),

            ],
          ),
        ),),
    );
  }
}
