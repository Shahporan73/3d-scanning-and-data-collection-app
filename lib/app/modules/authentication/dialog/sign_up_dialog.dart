import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resource/comon_widget/custom_button.dart';
import '../views/signin_view.dart';

Future<void> showSignUpDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '🎉 Thank you for signing up!',
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Text(
              'Your account is currently pending admin review.'
                  'Once approved, you will receive a notification and be able to access your account.',
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 14),
            CustomButton(
                title: 'Close',
                paddingVertical: 10,
                fontSize: 14,
                onTap: () {
                  Navigator.pop(context);
                  Get.to(()=> SigninView());
                },
            ),
          ],
        ),
      );
    },
  );
}