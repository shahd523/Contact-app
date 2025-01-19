import 'package:assign4_flutter/ContactModel.dart';
import 'package:assign4_flutter/Contacts_List.dart';
import 'package:assign4_flutter/New_Contact.dart';
import 'package:assign4_flutter/colors.dart';
import 'package:assign4_flutter/empty_home.dart';
import 'package:assign4_flutter/floatingactionbtn.dart';
import 'package:flutter/material.dart';
import 'package:assign4_flutter/imagess.dart';

class Home extends StatefulWidget{

  static const String routName="Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ContactModel> contacts = [];
  GlobalKey<ScaffoldState>  scaffoldkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: colors.color1,
      appBar: AppBar(backgroundColor: colors.color1,
        leading:
          Align(alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0,left: 20),
            child: Image.asset(Imagess.home1),


          )
          ),
      leadingWidth: width*0.3,),
      body: contacts.isEmpty
          ? EmptyHome()
          : ContactsList(
          contacts: contacts, onContactDeleteClicked: deleteContactByIndex),
      floatingActionButton: FloatingActionBtn(
        showDelete: contacts.isNotEmpty,
        addContactFun: showModalBottomSheetFun,
        deleteContactFun: deleteContact,
        add:contacts.length<6

      ),

     );
  }
  void showModalBottomSheetFun(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewContact(
          contacts: contacts,
          onContactAdd: () {
            setState(() {});
          },
        );
      },
    );
  }

  void deleteContact() {
    contacts.removeLast();
    setState(() {});
  }

  void deleteContactByIndex(int index) {
    contacts.removeAt(index);
    setState(() {});
  }


  }


