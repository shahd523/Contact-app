import 'package:assign4_flutter/colors.dart';
import 'package:flutter/material.dart';


class FloatingActionBtn extends StatelessWidget {
  const FloatingActionBtn({
    required this.showDelete,
    required this.addContactFun,
    required this.deleteContactFun,
    required this.add,


    super.key,
  });
  final bool showDelete;
  final bool add;
  final Function addContactFun;
  final Function deleteContactFun;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: showDelete,
          child: FloatingActionButton(
            onPressed: () {
              deleteContactFun();
            },
            tooltip: 'Delete',
            backgroundColor: colors.color5,
            child:  Icon(
              Icons.delete_rounded,
              color: colors.color4,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Visibility(
          visible: add,

          child: FloatingActionButton(
            onPressed: () {
              addContactFun(context);
            },
            tooltip: 'Add Contact',
            backgroundColor: colors.color4,
            child:  Icon(
              Icons.add,
              color: colors.color1,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
