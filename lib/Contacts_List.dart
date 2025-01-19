import 'package:assign4_flutter/ContactCard.dart';
import 'package:assign4_flutter/ContactModel.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<ContactModel> contacts;
  final void Function(int index) onContactDeleteClicked;
  const ContactsList({
    super.key,
    required this.contacts,
    required this.onContactDeleteClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                return ContactCard(
                    contact: contacts[index],
                    deleteContactByIndex: () {
                      onContactDeleteClicked(index);
                    });
              },
              itemCount: contacts.length,
            ),
          ),
        ],
      ),
    );
  }
}
