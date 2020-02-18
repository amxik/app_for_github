import 'package:app_for_github/models/issue_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IssueWidget extends StatelessWidget {
  final IssueEntity _issueEntity;

  IssueWidget(this._issueEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          color: Colors.blue[300],
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("#${_issueEntity.issueNumber}"),
                    ),
                    Container(
                      child: Text(
                        _issueEntity.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(_issueEntity.body),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Labels: ${_issueEntity.labels.join(",")}"),
                    Text("Assignees: ${_issueEntity.assignees.join(",")}"),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
