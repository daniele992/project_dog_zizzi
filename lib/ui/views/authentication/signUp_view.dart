import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../viewmodels/authentication/password_view_model.dart';
import '../../widgets/password_strength_bar.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = ResponsiveHelper.cardWidth(screenWidth);
    final passwordNotifier = ref.watch(passwordProvider.notifier);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF1ECF3),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: cardWidth,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.blueGrey, width: 2),
              ),
              elevation: 10,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: cardWidth,
                  minWidth: 600,
                  minHeight: 800,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      // -------- HEADER ---------
                      Center(
                        child: Column(
                          children: [
                            Icon(LineAwesomeIcons.user, size: 70, color: Colors.blueGrey.shade700),
                            const SizedBox(height: 16),
                            Text(
                              tCreateAccount,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              tCompilateField,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // ----------------- FORM ------------------------
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.envelope),
                                labelText: tEmail,
                                hintText: tHintInsertEmail,
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 10),

                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.user),
                                labelText: tUsername,
                                hintText: tHintInsertUsername,
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),

                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.user),
                                labelText: tPassword,
                                hintText: tHintInsertPw,
                              ),
                              onChanged: (value) {
                                ref.read(passwordProvider.notifier).state = value; //aggiorna il provider
                              },
                            ),
                            const SizedBox(height: tFormHeight - 20),

                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.user),
                                labelText: tRepeatPw,
                                hintText: tHintRepeatPw,
                              ),
                            ),

                            const SizedBox(height: tFormHeight - 20),

                            Consumer(
                                builder: (context, ref, _){
                                  final strength = ref.watch(passwordStrengthProvider);
                                  return PasswordStrengthBar(strength: strength);
                                }
                            ),

                            const SizedBox(height: tFormHeight - 20),

                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                const Expanded(
                                  child: Text(tAcceptPrivacy),
                                )
                              ],
                            ),

                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                const Expanded(
                                  child: Text(tAcceptConditions),
                                )
                              ],
                            ),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text(tSignUp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
