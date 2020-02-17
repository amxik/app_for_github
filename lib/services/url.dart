


class UrlService{

  final String _endPoint = "https://api.github.com";
  final String _token = "?access_token=8eec64425b8744aba72ded627dcd0e50a601dd5f";

  String getReposUrl(){
    return "$_endPoint/users/amxik/repos$_token";
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
