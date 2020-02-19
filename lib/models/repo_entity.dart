class RepoEntity {
  final String name;
  final String fullName;
  final String owner;

  RepoEntity._({this.name, this.fullName, this.owner});

  factory RepoEntity.fromJson(Map<String, dynamic> data) => new RepoEntity._(
      name: data["name"] ?? "",
      fullName: data["full_name"] ?? "",
      owner: data["owner"]["login"] ?? "");

  @override
  String toString() {
    return 'RepoEntity{name: $name, fullName: $fullName, owner: $owner}';
  }
}
