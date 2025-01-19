import 'package:assign4_flutter/ContactModel.dart';
import 'package:assign4_flutter/colors.dart';
import 'package:assign4_flutter/imagess.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ContactCard extends StatelessWidget{
  final ContactModel contact;
  final Function deleteContactByIndex;
  ContactCard({required this.contact,required this.deleteContactByIndex});
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(bottom: 16),
     decoration: BoxDecoration(color: colors.color4,
   borderRadius: BorderRadius.circular(16)),
     child: Column(mainAxisSize: MainAxisSize.min,
       children: [
         Expanded(
           child: Stack(
             alignment: AlignmentDirectional.bottomStart,
             children: [
               contact.imageFile == null
                   ? Lottie.asset(Imagess.userimg)
                   : ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
                 child: Image.file(
                   contact.imageFile!,
                   fit: BoxFit.cover,
                   width: double.infinity,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8),
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   color:colors.color4,
                   borderRadius: BorderRadius.circular(8),
                 ),
                 child: Text(
                   contact.userName,
                   style:TextStyle(fontSize: 14,
                       fontWeight: FontWeight.w500,
                       color: colors.color1),
                 ),
               ),

             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8),
           child: Column(
             children: [
               Row(
                 children: [
                   Icon(Icons.email),
                   const SizedBox(width: 8),
                   Expanded(
                     child: Text(
                       contact.email,
                       style:TextStyle(color: colors.color1,fontSize: 10,
                           fontWeight: FontWeight.w500) ,
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 10),
               Row(
                 children: [
                   Icon(Icons.phone),
                   const SizedBox(width: 8),
                   Text(
                     '+2${contact.phone}',
                     style:TextStyle(color: colors.color1,fontSize: 10,
    fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
               ElevatedButton(
                 onPressed: () {
                   deleteContactByIndex();
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor:colors.color5 ,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8),
                   ),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Icon(Icons.delete, color: Colors.white, size: 18),
                     const SizedBox(width: 8),
                     Text(
                       'Delete',
                       style:TextStyle(color: Colors.white,fontSize: 10,
                           fontWeight: FontWeight.w500)
                           .copyWith(color: Colors.white),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),

       ],
       
     ),
   );
  }
  
}