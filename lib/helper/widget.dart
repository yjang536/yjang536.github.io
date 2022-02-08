import 'package:flutter/material.dart';
import 'package:micromobitech/helper/define.dart';

class LogoBig extends StatelessWidget {
  const LogoBig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0, bottom: 0),
        child: Image.asset(
          'assets/icons/facebook.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

void showConfirmDialog(BuildContext context, content, onConfirm) async {
  await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(content, style: customTextStyle),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: onConfirm,
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, "Cancel");
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      );
    },
  );
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedFn;

  CustomButton(this.text, this.onPressedFn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryButtonColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        elevation: 0,
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final Alignment alignment;
  final int? maxLines;
  final double? height;

  CustomText({
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLines,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          height: height,
        ),
        maxLines: maxLines,
      ),
    );
  }
}
