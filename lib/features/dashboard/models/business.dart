class Business {
  final String id;
  final String name;

  Business({required this.id, required this.name});

  factory Business.fromMap(Map<String, dynamic> map) => Business(id: map['id'], name: map['name']);
}
