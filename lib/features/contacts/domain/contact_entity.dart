class Contact {
  final String id;
  final String name;
  final String role;
  final String department;
  final String email;
  final String phone;
  final bool active;

  const Contact({
    required this.id,
    required this.name,
    required this.role,
    required this.department,
    required this.email,
    required this.phone,
    this.active = true,
  });

  Contact copyWith({
    String? id,
    String? name,
    String? role,
    String? department,
    String? email,
    String? phone,
    bool? active,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      department: department ?? this.role,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      active: active ?? this.active,
    );
  }
}