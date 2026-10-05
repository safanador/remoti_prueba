import 'package:remoti/features/contacts/domain/contact_entity.dart';

class ContactModel extends Contact {
  const ContactModel({
    required super.id,
    required super.name,
    required super.role,
    required super.department,
    required super.email,
    required super.phone,
    super.active = true,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      department: json['department'],
      email: json['email'],
      phone: json['phone'],
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'role': role,
    'department': department,
    'email': email,
    'phone': phone,
    'active': active,
  };
}
