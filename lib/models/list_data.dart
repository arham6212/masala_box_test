class ListData {
  late final String name, type;

  ListData({required this.name, required this.type});

  ListData.fromResponse(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() => {'name': name, 'type': type};
}
