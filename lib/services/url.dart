


class UrlService{

  final String _endPoint = "https://api.github.com";
  final String _token = "?access_token=08212a9e893cd2e8dcc1c426207e2e9dde25adc2";

  String getReposUrl(){
    return "$_endPoint/users/amxik/repos";
  }
  String getOneRepoUrl(String repoName){
    return "$_endPoint/repos/amxik/$repoName$_token";
  }
  String getIssuesUrl(String repoName){
    return "$_endPoint/repos/amxik/$repoName/issues$_token";
  }
  String getOneIssueUrl(String repoName, int issueNumber){
    return "$_endPoint/repos/amxik/$repoName/issues/$issueNumber$_token";
  }
}
