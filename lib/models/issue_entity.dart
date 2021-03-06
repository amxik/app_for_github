import 'dart:convert';

class IssueEntity {
 final int number;
 final String title;
 final String body;
 final List<String> assignees;
 final List<String> labels;

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

  static String toJson(IssueEntity issue) {
    Map<String, dynamic> mapFromIssue = {
      "title": issue?.title ?? "New Issue",
      "body": issue?.body ?? "",
      "labels": issue?.labels ?? [],
      "assignees": issue?.assignees ?? [],
    };

    String jsonFromMap = json.encode(mapFromIssue);

    return jsonFromMap;
  }

  @override
  String toString() {
    return 'IssueEntity{number: $number, title: $title,'
        ' body: $body, assignees: $assignees, labels: $labels}';
  }
}
