import 'package:remoti/features/contacts/data/contact_model.dart';

abstract class ContactsRepository {
  Future<List<ContactModel>>listContacts();
  Future<ContactModel> toggleFavorite(String contactId);
}