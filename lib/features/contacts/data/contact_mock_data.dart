import 'package:remoti/features/contacts/data/contact_model.dart';

abstract class ContactMockData {
  Future<List<ContactModel>> listContacts();
  Future<ContactModel> toggleFavorite(String contactId);
}

class ContactLocalMockDataImpl implements ContactMockData {
  final List<ContactModel> _contacts = [
    const ContactModel(
      id: '1',
      name: 'Camila Reyes',
      role: 'Product Designer',
      department: 'Diseño',
      email: 'camila.reyes@empresa.cl',
      phone: '+56 9 1111 2222',
      active: true,
    ),
    const ContactModel(
      id: '2',
      name: 'Matías Soto',
      role: 'Backend Engineer',
      department: 'Ingeniería',
      email: 'matias.soto@empresa.cl',
      phone: '+56 9 2222 3333',
      active: true,
    ),
    const ContactModel(
      id: '3',
      name: 'Valentina Cid',
      role: 'QA Lead',
      department: 'Ingeniería',
      email: 'valentina.cid@empresa.cl',
      phone: '+56 9 3333 4444',
      active: false,
    ),
    const ContactModel(
      id: '4',
      name: 'Ignacio Muñoz',
      role: 'Sales Rep',
      department: 'Comercial',
      email: 'ignacio.munoz@empresa.cl',
      phone: '+56 9 4444 5555',
      active: true,
    ),
    const ContactModel(
      id: '5',
      name: 'Florencia Paz',
      role: 'HR Business Partner',
      department: 'Personas',
      email: 'florencia.paz@empresa.cl',
      phone: '+56 9 5555 6666',
      active: true,
    ),
    const ContactModel(
      id: '6',
      name: 'Tomás Herrera',
      role: 'Frontend Engineer',
      department: 'Ingeniería',
      email: 'tomas.herrera@empresa.cl',
      phone: '+56 9 6666 7777',
      active: true,
    ),
    const ContactModel(
      id: '7',
      name: 'Antonia Vidal',
      role: 'Account Manager',
      department: 'Comercial',
      email: 'antonia.vidal@empresa.cl',
      phone: '+56 9 7777 8888',
      active: false,
    ),
    const ContactModel(
      id: '8',
      name: 'Sebastián Rojas',
      role: 'Data Analyst',
      department: 'Ingeniería',
      email: 'sebastian.rojas@empresa.cl',
      phone: '+56 9 8888 9999',
      active: true,
    ),
    const ContactModel(
      id: '9',
      name: 'Constanza Fuentes',
      role: 'UX Researcher',
      department: 'Diseño',
      email: 'constanza.fuentes@empresa.cl',
      phone: '+56 9 9999 0000',
      active: true,
    ),
    const ContactModel(
      id: '10',
      name: 'Diego Contreras',
      role: 'DevOps Engineer',
      department: 'Ingeniería',
      email: 'diego.contreras@empresa.cl',
      phone: '+56 9 1010 2020',
      active: true,
    ),
    const ContactModel(
      id: '11',
      name: 'Javiera Morales',
      role: 'Recruiter',
      department: 'Personas',
      email: 'javiera.morales@empresa.cl',
      phone: '+56 9 1111 3030',
      active: true,
    ),
    const ContactModel(
      id: '12',
      name: 'Benjamín Silva',
      role: 'Sales Rep',
      department: 'Comercial',
      email: 'benjamin.silva@empresa.cl',
      phone: '+56 9 1212 4040',
      active: false,
    ),
    const ContactModel(
      id: '13',
      name: 'Josefa Araya',
      role: 'Product Manager',
      department: 'Diseño',
      email: 'josefa.araya@empresa.cl',
      phone: '+56 9 1313 5050',
      active: true,
    ),
    const ContactModel(
      id: '14',
      name: 'Cristóbal Vergara',
      role: 'Backend Engineer',
      department: 'Ingeniería',
      email: 'cristobal.vergara@empresa.cl',
      phone: '+56 9 1414 6060',
      active: true,
    ),
    const ContactModel(
      id: '15',
      name: 'Millaray Torres',
      role: 'People Ops',
      department: 'Personas',
      email: 'millaray.torres@empresa.cl',
      phone: '+56 9 1515 7070',
      active: true,
    ),
    const ContactModel(
      id: '16',
      name: 'Agustín Bravo',
      role: 'Account Manager',
      department: 'Comercial',
      email: 'agustin.bravo@empresa.cl',
      phone: '+56 9 1616 8080',
      active: true,
    ),
    const ContactModel(
      id: '17',
      name: 'Fernanda Espinoza',
      role: 'Frontend Engineer',
      department: 'Ingeniería',
      email: 'fernanda.espinoza@empresa.cl',
      phone: '+56 9 1717 9090',
      active: false,
    ),
    const ContactModel(
      id: '18',
      name: 'Rodrigo Pizarro',
      role: 'Data Analyst',
      department: 'Ingeniería',
      email: 'rodrigo.pizarro@empresa.cl',
      phone: '+56 9 1818 1010',
      active: true,
    ),
  ];

  @override
  Future<List<ContactModel>> listContacts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _contacts;
  }

  @override
  Future<ContactModel> toggleFavorite(String contactId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final index = _contacts.indexWhere((contact) => contact.id == contactId);

    if (index != -1) {
      final current = _contacts[index];
      final updated = ContactModel(
        id: current.id,
        name: current.name,
        role: current.role,
        department: current.department,
        email: current.email,
        phone: current.phone,
      );
      _contacts[index] = updated;
      return updated;
    }
    throw Exception('Contacto no encontrado');
  }
}
