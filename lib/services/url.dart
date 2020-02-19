class UrlService {
  final String _endPoint = "https://api.github.com";
  final String _token =
      "?access_token=ad129d37eedbb12abc29a51f11c8b1c133b3ac4f";
  final String login = "amxik";

  String getReposUrl() {
    return "$_endPoint/users/$login/repos$_token";
  }

  String getOneRepoUrl(String repoName) {
    return "$_endPoint/repos/$login/$repoName$_token";
  }

  String getIssuesUrl(String repoName) {
    return "$_endPoint/repos/$login/$repoName/issues$_token";
  }

  String getOneIssueUrl(String repoName, int issueNumber) {
    return "$_endPoint/repos/$login/$repoName/issues/$issueNumber$_token";
  }
}
