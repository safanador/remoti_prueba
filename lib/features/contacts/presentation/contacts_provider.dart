import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:remoti/features/contacts/data/contact_mock_data.dart';
import 'package:remoti/features/contacts/data/contact_repository.dart';
import 'package:remoti/features/contacts/domain/contact_entity.dart';
import 'package:remoti/features/contacts/domain/contacts_repository.dart';

final contactRepositoryProvider = Provider<ContactsRepository>((ref) {
  return ContactRepositoryImp(mockData: ContactLocalMockDataImpl());
});

enum ContactDepartmentFilter {
  all,
  engineering,
  people,
  design,
  comercial
}

class ContactState {
  final List<Contact> contacts;
  final bool isLoading;
  final bool isError;
  final String searchQuery;
  final ContactDepartmentFilter filter;
  final Contact? selectedContact;

  const ContactState({
    this.contacts = const [],
    this.isLoading = false,
    this.isError = false,
    this.searchQuery = '',
    this.filter = ContactDepartmentFilter.all,
    this.selectedContact,
  });

  List<Contact> get filteredContacts {
    return contacts.where((contact) {
      final matchQuery = contact.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchFilter = filter == ContactDepartmentFilter.all;

      return matchFilter && matchQuery;
    }).toList();
  }

  ContactState copyWith({
    List<Contact>? contacts,
    bool? isLoading,
    bool? isError,
    String? searchQuery,
    ContactDepartmentFilter? filter,
    Contact? selectedContact,
    bool clearSelected = false,
  }) {
    return ContactState(
      contacts: contacts ?? this.contacts,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      searchQuery: searchQuery ?? this.searchQuery,
      filter: filter ?? this.filter,
      selectedContact: clearSelected
        ? null
        : selectedContact ?? this.selectedContact,
    );
  }
}

class ContactsNotifier extends StateNotifier<ContactState> {
  final ContactsRepository _repository;

  ContactsNotifier(this._repository) : super(const ContactState()) {
    loadContacts();
  }

  Future<void> loadContacts() async {
    state = state.copyWith(isLoading: true);
    final results = await _repository.listContacts();
    state = state.copyWith(contacts: results,isLoading: false);
  }

  Future<void> toggleFavorite(String contactId) async {
    final updatedContact = await _repository.toggleFavorite(contactId);
    final updatedList = state.contacts.map((c) => c.id == contactId ? updatedContact : c).toList();
    state = state.copyWith(contacts: updatedList);
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setFilter(ContactDepartmentFilter filter) {
    state = state.copyWith(filter: filter);
  }

  void selectContact(Contact? contact) {
    state = state.copyWith(selectedContact: contact, clearSelected: contact == null);
  }
}

final contactsProvider = StateNotifierProvider<ContactsNotifier, ContactState>((ref) {
  final repository = ref.watch(contactRepositoryProvider);
  return ContactsNotifier(repository);
});