import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:intl/intl.dart';

import 'conversion.dart';
import 'userSetting.dart';

/// A quick example "keyboard" widget for Numeric.
class NumericKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  final ValueNotifier<String> notifier;
  final FocusNode focusNode;

  NumericKeyboard({
    Key key,
    this.notifier,
    this.focusNode,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(280);

  void _onTap(String text, IconData icon) {
    final currentValue = Conversion().getConvertValue().toString();

    // DONE
    if (text == "Done") {
      focusNode.unfocus();
    }
    // <-
    else if(icon != null){
      Conversion().setConvertValue(currentValue, "back");
    }
    // C
    else if (text == "C") {
      updateValue("");
      Conversion().setConvertValue("", text);
    }
    // 숫자 클릭시 & 사칙연산 눌렀을때 & dot & +/-
    else {
      Conversion().setConvertValue(currentValue, text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: userSetting().getColor(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            children: [
              _buildButton(text: "Done", color: Color(0xFFBAB572)),
              _buildButton(text: "C"),
              _buildButton(icon: Icons.keyboard_backspace),
              _buildButton(text: "=", color: Color(0xFFBAB572)),
              _buildButton(text: "7"),
              _buildButton(text: "8"),
              _buildButton(text: "9"),
              _buildButton(text: "/"),
              _buildButton(text: "4"),
              _buildButton(text: "5"),
              _buildButton(text: "6"),
              _buildButton(text: "*"),
              _buildButton(text: "1"),
              _buildButton(text: "2"),
              _buildButton(text: "3"),
              _buildButton(text: "-"),
              _buildButton(text: "+/-"),
              _buildButton(text: "0"),
              _buildButton(text: "."),
              _buildButton(text: "+"),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildButton({
    String text,
    IconData icon,
    Color color,
  }) =>
      NumericButton(
        text: text,
        icon: icon,
        color: color,
        onTap: () => _onTap(text, icon),
      );
}

class NumericButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  const NumericButton({
    Key key,
    this.text,
    this.onTap,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.0),
      color: color ?? Color(0xFFFFFCD6),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: icon != null
                ? Icon(
              icon,
              color: Colors.black,
            )
                : Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}