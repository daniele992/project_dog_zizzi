import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project_dog_zizzi/core/providers/authRepository/auth_providers.dart';
import 'package:project_dog_zizzi/data/models/user_registration_model.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/connectivity/connectivity_provider.dart';
import '../../../core/utils/helper/responsive_helper.dart';
import '../../../core/utils/helper/snackbar_helper.dart';
import '../../../core/utils/validators/form_validators.dart';
import '../../../routes/app_routes.dart';
import '../../viewmodels/authentication/password_view_model.dart';
import '../../widgets/password_strength_bar.dart';
import 'dart:async';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {

  ProviderSubscription<AsyncValue<ConnectivityResult>>? _connectivityListener;
  Timer? _connectivityDebounce;
  bool _obscureText = true; // inizialmente nascosta
  bool _obscureTextRepeatPw = true; // inizialmente nascosta

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPwController = TextEditingController();

  bool privacyAccepted = false;
  bool conditionsAccepted = false;

  @override
  void dispose(){
    //Importante: rilascia i controller
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passwordController.dispose();
    repeatPwController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _connectivityListener = ref.listenManual<AsyncValue<ConnectivityResult>>(
      connectivityProvider,
        (previous, next){
        final previousStatus = previous?.valueOrNull;
        final currenStatus = next.valueOrNull;

          //Evita snackbar inutili all'avvio
          if(previousStatus == null || currenStatus == null) return;

          //Se lo stato non cambia non facciamo nulla
          if(previousStatus == currenStatus) return;

          _connectivityDebounce?.cancel();

          _connectivityDebounce = Timer(const Duration(milliseconds: 2000), (){
            final hasConnection = currenStatus != ConnectivityResult.none;

            if(!mounted) return;
            SnackbarHelper.showSnackBar(
              context,
              message: hasConnection ? tConnectionActive : tNoConnection,
              icon: hasConnection ? Icons.wifi : Icons.wifi_off,
              backgroundColor: hasConnection ? Colors.green : Colors.red
            );
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    final connectivityAsyncValue = ref.watch(connectivityProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = ResponsiveHelper.cardWidth(screenWidth);

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
                        key: formKey,
                        child: Column(
                          children: [
                            //TextFormField for insert Email
                            TextFormField(
                              controller: emailController,
                              validator: FormValidators.validateEmail,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.envelope),
                                labelText: tEmail,
                                hintText: tHintInsertEmail,
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),

                            //TextFormField for insert name
                            TextFormField(
                              controller: nameController,
                              validator: FormValidators.validateName,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.user),
                                labelText: tName,
                                hintText: tHintInsertUName,
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),

                            //TextFormField for insert surname
                            TextFormField(
                              controller: surnameController,
                              validator: FormValidators.validateName,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.user),
                                labelText: tSurname,
                                hintText: tHintSurName,
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),

                            //TextFormField for insert Password
                            TextFormField(
                              controller: passwordController,
                              validator: FormValidators.validatePassword,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(LineAwesomeIcons.lock_solid),
                                labelText: tPassword,
                                hintText: tHintInsertPw,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? LineAwesomeIcons.eye : LineAwesomeIcons.eye_slash,
                                  ),
                                  onPressed: (){
                                    setState((){
                                      _obscureText = !_obscureText; //toggle
                                    });
                                  },
                                ),
                              ),
                              onChanged: (value) {
                                ref.read(passwordProvider.notifier).state = value; //aggiorna il provider
                              },
                            ),
                            const SizedBox(height: tFormHeight - 20),

                            //TextFormField for insert Repeat Password
                            TextFormField(
                              controller: repeatPwController,
                              validator: (value) => FormValidators.validateRepeatPassword(value, passwordController.text),
                              obscureText: _obscureTextRepeatPw,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(LineAwesomeIcons.lock_solid),
                                labelText: tRepeatPw,
                                hintText: tHintRepeatPw,
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureTextRepeatPw ? LineAwesomeIcons.eye : LineAwesomeIcons.eye_slash,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        _obscureTextRepeatPw = !_obscureTextRepeatPw;
                                      });
                                    },
                                )
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

                            //CheckBox for accept privacy
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  side: BorderSide(
                                    color: privacyAccepted ? Colors.green : Colors.red
                                  ),
                                  value: privacyAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      privacyAccepted = value ?? false;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.acceptPrivacy);
                                    },
                                    child: Text(
                                      tAcceptPrivacy,
                                      style: TextStyle(color: privacyAccepted
                                          ? Colors.green
                                          : Colors.red
                                      ),
                                    ),
                                  )
                                )
                              ],
                            ),

                            //CheckBox for accept conditions
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.green,
                                  side: BorderSide(
                                    color: conditionsAccepted ? Colors.green : Colors.red
                                  ),
                                  value: conditionsAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      conditionsAccepted = value ?? false;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.acceptConditions);
                                    },
                                    child: Text(
                                      tAcceptConditions,
                                      style: TextStyle(color: conditionsAccepted
                                          ? Colors.green
                                          : Colors.red
                                      ),
                                    ),
                                  )
                                )
                              ],
                            ),

                            const SizedBox(height: 30),

                            Consumer(
                              builder: (context, ref, _) {
                                final connectivityAsyncValue = ref.watch(connectivityProvider);

                                // 👉 di default consideriamo la connessione attiva
                                final hasConnection = connectivityAsyncValue.maybeWhen(
                                  data: (status) => status != ConnectivityResult.none,
                                  orElse: () => true,
                                );

                                // ✅ Stato aggiornato dal ViewModel
                                final signUpState = ref.watch(signUpViewModelProvider);

                                return SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: hasConnection
                                        ? () async {
                                      if (!privacyAccepted || !conditionsAccepted) {
                                        SnackbarHelper.showSnackBar(
                                          context,
                                          message: tSnackBarWarning,
                                          icon: Icons.error,
                                        );
                                        return;
                                      }

                                      if (formKey.currentState!.validate()) {
                                        final user = UserRegistrationModel(
                                          email: emailController.text,
                                          name: nameController.text,
                                          surname: surnameController.text,
                                          password: passwordController.text,
                                          privacyPolicy: privacyAccepted,
                                          conditions: conditionsAccepted,
                                          admin: false,
                                        );

                                        // Chiamata al ViewModel
                                        await ref.read(signUpViewModelProvider.notifier).register(user);

                                        // ✅ Gestione messaggi dopo la registrazione
                                        final updatedState = ref.read(signUpViewModelProvider);
                                        if (updatedState.isSuccess) {
                                          SnackbarHelper.showSnackBar(
                                            context,
                                            message: tSuccessRegistration,
                                            icon: Icons.check_circle,
                                            backgroundColor: Colors.green,
                                          );
                                          // Optional: navigazione ad altra schermata
                                          // Navigator.pushReplacementNamed(context, '/home');
                                        } else if (updatedState.errorMessage != null) {
                                          SnackbarHelper.showSnackBar(
                                            context,
                                            message: updatedState.errorMessage!,
                                            icon: Icons.error,
                                            backgroundColor: Colors.red,
                                          );
                                        }
                                      }
                                    }
                                        : null,

                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                                        if (!hasConnection) return Colors.grey;
                                        if (states.contains(WidgetState.hovered)) return Colors.green;
                                        return Colors.blue;
                                      }),
                                    ),

                                    // ✅ UI pulsante: testo o caricamento
                                    child: signUpState.isLoading
                                        ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                        : Text(
                                      hasConnection ? tSignUp : tNoConnection,
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                );

                              },
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(tAlreadyAccount),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.login); //Navigator.pushReplacementNamed(context, '/login');
                                    },
                                    child: const Text(
                                      tLogin,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
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
      )
    );
  }
}