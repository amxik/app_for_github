class UrlService {
  final String _endPoint = "https://api.github.com";
  final String _token =
      "?access_token=0260b58e64b747e0794f728cea1d1a05d7f763e4";

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
