class UrlService {
  final String _endPoint = "https://api.github.com";
  final String _token =
      "?access_token=c716240675a5f1b719e2eb06eac5a29a88a9faf4";

  String getReposUrl() {
    return "$_endPoint/users/amxik/repos$_token";
  }

  String getOneRepoUrl(String repoName) {
    return "$_endPoint/repos/amxik/$repoName$_token";
  }

  String getIssuesUrl(String repoName) {
    return "$_endPoint/repos/amxik/$repoName/issues$_token";
  }

  String getOneIssueUrl(String repoName, int issueNumber) {
    return "$_endPoint/repos/amxik/$repoName/issues/$issueNumber$_token";
  }
}
