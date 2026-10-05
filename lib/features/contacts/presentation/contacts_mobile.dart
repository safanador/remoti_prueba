import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remoti/features/contacts/presentation/contacts_provider.dart';

class ContactMobileLayout extends ConsumerWidget {
  const ContactMobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contactsProvider);
    final notifier = ref.read(contactsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Directorio de contactos'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar',
                prefix: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
              onChanged: notifier.setSearchQuery,
            ),
          ),
          SegmentedButton(
            segments: const [
              ButtonSegment(value: ContactDepartmentFilter.all, label: Text('Todos')),
              ButtonSegment(value: ContactDepartmentFilter.engineering, label: Text('Ingenieria')),
              ButtonSegment(value: ContactDepartmentFilter.people, label: Text('Personas')),
              ButtonSegment(value: ContactDepartmentFilter.design, label: Text('Diseño')),
              ButtonSegment(value: ContactDepartmentFilter.comercial, label: Text('Comercial')),
            ], 
            selected: {state.filter},
            onSelectionChanged: (set) => notifier.setFilter(set.first),
          ),
          Expanded(
            child: state.isLoading
            ? const Center(child: CircularProgressIndicator(),)
            : ListView.builder(
              itemCount: state.filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = state.filteredContacts[index];
                return ListTile(
                  leading: Icon(contact.active ? Icons.star : Icons.star_border),
                  title: Text(contact.name),
                  subtitle: Text(contact.email),
                  trailing: IconButton(
                    icon: Icon(
                      contact.active ? Icons.start : Icons.star_border,
                      color: contact.active ? Colors.grey : null
                    ),
                    onPressed: () => notifier.toggleFavorite(contact.id),
                  ),
                  onTap: () => {
                    notifier.selectContact(contact),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(contact.name
                          //body: ContactDetailView()
                          )),
                        )
                      )
                    )

                  },
                );
              }
            )
          )
        ],
      ),
    );
  }
}