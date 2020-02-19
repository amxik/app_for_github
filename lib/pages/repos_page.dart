import 'package:app_for_github/models/repo_entity.dart';
import 'package:app_for_github/repositories/repo_entity_repository.dart';
import 'package:app_for_github/widgets/error.dart';
import 'package:app_for_github/widgets/indicator.dart';
import 'package:app_for_github/widgets/repo.dart';
import 'package:flutter/material.dart';

class ReposPage extends StatelessWidget {
  final RepoEntityRepository _repository = RepoEntityRepository();

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
      return ListView.builder(
          itemCount: repos.length,
          itemBuilder: (BuildContext context, int index) {
            return RepoWidget(repos[index]);
          });
    } else if (snapshot.hasError) {
      return WidgetForError(snapshot);
    } else {
      return CircularIndicator();
    }
  }
}
