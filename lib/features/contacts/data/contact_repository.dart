import 'package:remoti/features/contacts/data/contact_mock_data.dart';
import 'package:remoti/features/contacts/data/contact_model.dart';
import 'package:remoti/features/contacts/domain/contacts_repository.dart';

class ContactRepositoryImp implements ContactsRepository {
  final ContactMockData mockData;
  const ContactRepositoryImp({required this.mockData});

  @override
  Future<List<ContactModel>> listContacts() => mockData.listContacts();

  @override
  Future<ContactModel> toggleFavorite(String contactId) => mockData.toggleFavorite(contactId);
}