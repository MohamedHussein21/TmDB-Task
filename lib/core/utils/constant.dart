import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tmdb_task/core/utils/color_mange.dart';
import 'package:tmdb_task/core/utils/text_style.dart';

enum ToastStates { success, error, warning }

class Constants {
  static void navigateTo(context, widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

  static void navigateAndFinish(context, widget) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget),
        (route) {
          return false;
        },
      );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    massage, {
    required BuildContext scaffoldContext,
    required String text,
    required Color color,
  }) => ScaffoldMessenger.of(
    scaffoldContext,
  ).showSnackBar(SnackBar(content: Text(text), backgroundColor: color));

  static void showToast({required String text, required ToastStates state}) =>
      Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static Color chooseToastColor(ToastStates state) {
    Color color;

    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
      case ToastStates.warning:
        color = Colors.amber;
        break;
    }

    return color;
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManger.defaultColor,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(title, style: AppTextStyles.button),
        ),
      ),
    );
  }
}
