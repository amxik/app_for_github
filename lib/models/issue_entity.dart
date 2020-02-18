class IssueEntity {
  int issueNumber;
  String title;
  String body;
  List<String> assignees;
  List<String> labels;

  IssueEntity(
      {this.issueNumber, this.title, this.body, this.assignees, this.labels});

  factory IssueEntity.fromJson(Map<String, dynamic> data) => new IssueEntity(
      issueNumber: data["number"],
      title: data["title"],
      body: data["body"],
      assignees: getItemFromJson(data["assignees"], "login"),
      labels: getItemFromJson(data["labels"], "name"));

  static getItemFromJson(List<dynamic> maps, String arg) {
    return List.from(maps).map((item) {
      String name = item[arg];
      return name;
    }).toList();
  }

  @override
  String toString() {
    return 'IssueEntity{number: $issueNumber, title: $title, body: $body, assignees: $assignees, labels: $labels}';
  }
}
