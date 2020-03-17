class UrlService {
  final String _endPoint = "https://api.github.com";
  final String _token =
      "?access_token=f3d6ca3b33d6e998112dc1b8c38a55e713686e35";
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
