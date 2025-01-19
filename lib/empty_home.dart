import 'package:assign4_flutter/colors.dart';
import 'package:assign4_flutter/imagess.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class EmptyHome extends StatelessWidget {
  EmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Imagess.home2),
           Text(
            'There is No Contacts Added Here',
            style: TextStyle(
              fontSize: 20,
              color: colors.color4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
