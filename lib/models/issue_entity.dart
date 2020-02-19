class IssueEntity {
  int number;
  String title;
  String body;
  List<String> assignees;
  List<String> labels;

  IssueEntity(
      {this.number, this.title, this.body, this.assignees, this.labels});

  String get assigneesText => assignees?.join(", ") ?? "";

  String get labelsText => labels?.join(", ") ?? "";

  factory IssueEntity.fromJson(Map<String, dynamic> data) => new IssueEntity(
      number: data["number"],
      title: data["title"],
      body: data["body"],
      assignees: getItemsFromTheMapByKey(data["assignees"], "login"),
      labels: getItemsFromTheMapByKey(data["labels"], "name"));

  static List<String> getItemsFromTheMapByKey(List<dynamic> maps, String key) {
    var items = maps?.map((mapElement) {
      return mapElement[key].toString();
    });
    return items?.toList();
  }

  @override
  String toString() {
    return 'IssueEntity{number: $number, title: $title,'
        ' body: $body, assignees: $assignees, labels: $labels}';
  }
}
