class FireStoreSite {
  final String name;
  final String area;
  final String zone;
  final String type;

  FireStoreSite({
    required this.name,
    required this.area,
    required this.zone,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'area': area,
      'zone': zone,
      'type': type,
    };
  }

  factory FireStoreSite.fromMap(Map<String, dynamic> map) {
    return FireStoreSite(
      name: map['name'] as String,
      area: map['area'] as String,
      zone: map['zone'] as String,
      type: map['type'] as String,
    );
  }
}
