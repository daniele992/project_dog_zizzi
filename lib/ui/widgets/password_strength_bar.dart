import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/text_strings.dart';
import '../../core/utils/password_utils.dart';
import '../../data/datasources/local/password_strength.dart';

class PasswordStrengthBar extends StatelessWidget {
  final PasswordStrength strength;

  const PasswordStrengthBar({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {

    final strengthPercent = strength.strength / 10;
    final strengthColor = getStrengthColor(strength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
                child:TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: strengthPercent),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, _) {
                    return TweenAnimationBuilder<Color?>(
                      tween: ColorTween(begin: Colors.grey.shade300, end: strengthColor),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, color, __){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: value,
                            minHeight: 10,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: AlwaysStoppedAnimation<Color>(color!),
                          ),
                        );
                      },
                    );
                  },
                ),
            ),
            Tooltip(
              message: tStrengthPw,
              waitDuration: const Duration(milliseconds: 500),
              showDuration: const Duration(seconds: 2),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.grey.shade600,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "$tStrength ${strength.strengthToString()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: strengthColor,
          ),
        ),
        const SizedBox(height: 8),
        ...strength.hints.map(
            (s) => Text("- $s", style: const TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}