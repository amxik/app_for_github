

import 'package:app_for_github/repositories/issue_entity_repository.dart';
import 'package:app_for_github/repositories/repo_entity_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main()async {
  test("test", () async{

    print(await IssueEntityRepository().getIssues("Facebook2"));
    print(await RepoEntityRepository().getRepos());

  });
}