import 'package:app_for_github/models/issue_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double containerHeight = 80.0;
const double containerPadding = 10.0;

class IssueWidget extends StatelessWidget {
  final IssueEntity _issueEntity;

  IssueWidget(this._issueEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(containerPadding),
      child: Container(
          color: Theme.of(context).backgroundColor,
          height: containerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: ButtonTheme.of(context).padding,
                      child: Text("#${_issueEntity.number}"),
                    ),
                    Container(
                      child: Text(
                        _issueEntity.title,
                        style: Theme.of(context).textTheme.title,
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
                    Text("Labels: ${_issueEntity.labelsText}"),
                    Text("Assignees: ${_issueEntity.assigneesText}"),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
