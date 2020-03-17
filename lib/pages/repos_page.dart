import 'package:app_for_github/models/repo_entity.dart';
import 'package:app_for_github/api/repo_entity_api.dart';
import 'package:app_for_github/widgets/error.dart';
import 'package:app_for_github/widgets/indicator.dart';
import 'package:app_for_github/widgets/no_content.dart';
import 'package:app_for_github/widgets/repo.dart';
import 'package:flutter/material.dart';

class ReposPage extends StatelessWidget {
  final RepoEntityApi _repository;

  ReposPage(this._repository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositories"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<RepoEntity>>(
        future: _repository.getRepos(),
        builder: _contentBuilder,
      ),
    );
  }

  Widget _contentBuilder(
      BuildContext context, AsyncSnapshot<List<RepoEntity>> snapshot) {
    if (snapshot.hasData) {
      List<RepoEntity> repos = snapshot.data;
      return repos.isNotEmpty
          ? ListView.builder(
              itemCount: repos.length,
              itemBuilder: (BuildContext context, int index) {
                return RepoWidget(repos[index]);
              })
          : NoContentWidget("No Repositories");
    } else if (snapshot.hasError) {
      return AppErrorWidget(snapshot);
    } else {
      return IndicatorWidget();
    }
  }
}
