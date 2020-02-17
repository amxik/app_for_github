

 class IssueEntity{

 final String title;
 final String body;
 final List<String> assignees;
 final int milestone;
 final List<String> labels;

  IssueEntity({this.title, this.body, this.assignees, this.milestone,
      this.labels});

 factory IssueEntity.fromJson(Map<String, dynamic> data) => new IssueEntity(
      title: data["title"],
      body: data["body"],
      assignees: getItemFromJson(data["assignees"], "login"),
      milestone: data["milestone"],
      labels: getItemFromJson(data["labels"], "name")
     );

 static getItemFromJson(List<dynamic> maps, String arg){
  return List.from(maps).map((item){
   String name = item[arg];
   return name;
  }).toList();
 }

 @override
 String toString() {
  return 'IssueEntity{title: $title, body: $body, assignees: $assignees, milestone: $milestone, labels: $labels}';
 }

 }







//{
//"title": "Found a bug",
//"body": "I'm having a problem with this.",
//"assignees": [
//"octocat"
//],
//"milestone": 1,
//"labels": [
//"bug"
//]
//}