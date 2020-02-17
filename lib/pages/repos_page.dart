import 'package:app_for_github/models/repo_entity.dart';
import 'package:app_for_github/repositories/repo_entity_repository.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:app_for_github/widgets/repo.dart';
import 'package:flutter/material.dart';

class ReposPage extends StatelessWidget {
  final RepoEntityRepository _repository = RepoEntityRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Repositories"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<RepoEntity>>(
          future: _repository.getRepos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RepoEntity>> snapshot) {
            if (snapshot.hasData) {
              List<RepoEntity> repos = snapshot.data;
              print(repos);
              return ListView.builder(
                  itemCount: repos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RepoWidget(repos[index]);
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
          },
        ),
      ),
      routes: _routes,
    );
  }

  Map<String, WidgetBuilder> get _routes {
    return {
      NavigationRoutes.repos: (context) => ReposPage(),
      // NavigationRoutes.issues: (context) => IssuesPage()
    };
  }
}
