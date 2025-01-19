import 'dart:io';
import 'package:assign4_flutter/ContactModel.dart';
import 'package:assign4_flutter/CustomTextField.dart';
import 'package:assign4_flutter/CustomValidation.dart';
import 'package:assign4_flutter/ImagePIC.dart';
import 'package:assign4_flutter/Texts.dart';
import 'package:assign4_flutter/colors.dart';
import 'package:assign4_flutter/imagess.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class NewContact extends StatefulWidget {
  const NewContact({
    required this.contacts,
    required this.onContactAdd,
    super.key,
  });

  final List<ContactModel> contacts;

  final Function onContactAdd;

  @override
  State<NewContact> createState() => _NewContactBottomSheetState();
}
class _NewContactBottomSheetState extends State<NewContact> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration:  BoxDecoration(
          color: colors.color1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.color4),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: pickedImage == null
                        ? Center(
                      child: GestureDetector(
                        onTap: () async {
                          File? tempImage =
                          await ImapePicker.galleryPicker();
                          if (tempImage != null) {
                            pickedImage = tempImage;
                            setState(() {});
                          }
                        },
                        child: Lottie.asset(Imagess.userimg),
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.file(pickedImage!, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: userNameController,
                        builder: (context, value, _) {
                          return Text(
                            value.text.isEmpty ?Texts. user: value.text,
                            style: TextStyle(
                              color: colors.color4,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                       Divider(color: colors.color4),
                      ValueListenableBuilder(
                        valueListenable: emailController,
                        builder: (context, value, _) {
                          return Text(
                            value.text.isEmpty ? Texts.email : value.text,
                            style:TextStyle(
                              color: colors.color4,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                       Divider(color: colors.color4),
                      ValueListenableBuilder(
                        valueListenable: phoneNumberController,
                        builder: (context, value, _) {
                          return Text(
                            value.text.isEmpty ? Texts.phone : value.text,
                            style: TextStyle(
                              color: colors.color4,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                children: [
                 customtextfield(
                    hintText: Texts.hinttext1,
                    controller: userNameController,
                    validator: (value) {
                      return Customvalidation.validateEmptyField(
                          value,Texts.validation1 );
                    },
                  ),
                  const SizedBox(height: 8),
                  customtextfield(
                    hintText: Texts.hinttext2,
                    controller: emailController,
                    validator: (value) {
                      return Customvalidation.validateEmailField(value);
                    },
                  ),
                  const SizedBox(height: 8),
                  customtextfield(
                    hintText: Texts.hinttext3,
                    controller: phoneNumberController,
                    validator: (value) {
                      return Customvalidation.validateEmptyField(
                          value,Texts.validation2 );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addContact();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: colors.color4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: Text(
                Texts.btn1txt,
                style: TextStyle(
                  color: colors.color1,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addContact() {
    if (formKey.currentState!.validate()) {
      widget.contacts.add(ContactModel(
          userName: userNameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          imageFile: pickedImage));
      widget.onContactAdd();
      Navigator.pop(context);
    }
  }
}
