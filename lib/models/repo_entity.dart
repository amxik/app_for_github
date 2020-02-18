class RepoEntity {
  String name;
  String fullName;
  String owner;

  RepoEntity({this.name, this.fullName, this.owner});

  factory RepoEntity.fromJson(Map<String, dynamic> data) => new RepoEntity(
      name: data["name"],
      fullName: data["full_name"],
      owner: data["owner"]["login"]);

  @override
  String toString() {
    return 'RepoEntity{name: $name, fullName: $fullName, owner: $owner}';
  }
}
