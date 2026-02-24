import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project_dog_zizzi/routes/app_routes.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/authRepository/login_providers.dart';
import '../../../core/providers/connectivity/connectivity_provider.dart';
import '../../../core/utils/helper/responsive_helper.dart';
import '../../../core/utils/helper/snackbar_helper.dart';
import '../../../core/utils/validators/form_validators.dart';
import '../../../data/models/login_request_model.dart';
import '../../viewmodels/authentication/password_view_model.dart';
import 'dart:async';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {

  ProviderSubscription<AsyncValue<ConnectivityResult>>? _connectivityListener;
  Timer? _connectivityDebounce;
  bool _obscureText = true; // inizialmente nascosta

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool privacyAccepted = false;
  bool conditionsAccepted = false;

  @override
  void dispose(){
    //Importante: rilascia i controller
    emailController.dispose();
    passwordController.dispose();
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
                              Icon(
                                  LineAwesomeIcons.sign_in_alt_solid,
                                  size: 70,
                                  color: Colors.blue.shade700
                              ),
                              const SizedBox(height: 16),
                              Text(
                                tLoginAccount,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey.shade800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                tCompilateFieldForLogin,
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

                              //Button per il login
                              Consumer(
                                builder: (context, ref, _) {
                                  final connectivityAsyncValue = ref.watch(connectivityProvider);
                                  final hasConnection = connectivityAsyncValue.maybeWhen(
                                    data: (status) => status != ConnectivityResult.none,
                                    orElse: () => true,
                                  );

                                  final loginState = ref.watch(loginViewModelProvider);

                                  return SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: hasConnection
                                          ? () async {
                                        if (formKey.currentState!.validate()) {
                                          final request = LoginRequestModel(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );

                                          await ref.read(loginViewModelProvider.notifier).login(request);

                                          final updatedState = ref.read(loginViewModelProvider);

                                          if (updatedState.hasValue && updatedState.value == true) {
                                            SnackbarHelper.showSnackBar(
                                              context,
                                              message: 'Login effettuato con successo',
                                              icon: Icons.check_circle,
                                              backgroundColor: Colors.green,
                                            );
                                            Navigator.pushNamed(context, AppRoutes.homepage);
                                          }
                                        }
                                      }
                                          : null,
                                      child: loginState.isLoading
                                          ? const CircularProgressIndicator(color: Colors.white)
                                          : const Text('LOGIN'),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 16),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(tStillRegister),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(context, AppRoutes.register);
                                      },
                                      child: const Text(
                                        tSignUp,
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