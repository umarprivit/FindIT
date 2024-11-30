import 'package:find_it/components/my_animated_button.dart';
import 'package:find_it/components/my_conditional_widget.dart';
import 'package:find_it/components/my_pinput.dart';
import 'package:find_it/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pinController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _verifyEmail = false;
  bool _emailVerified = false;
  bool _isRegistering = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  String? _emailValidator(value) {
    if (value == null ||
        !value.contains(
          RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-z]+"),
        )) {
      return "Invalid email address";
    }
    return null;
  }

  String? _passwordValidator(value) {
    if (value == null || value.length < 6) {
      return "Password too short";
    }
    return null;
  }

  String? _confirmPasswordValidator(value) {
    if (value == null || value.length < 6) {
      return "Password too short";
    } else if (value != _passwordController.text) {
      return "Passwords do not match";
    }

    return null;
  }

  void _validateAndRegister() {
    if (!_emailVerified) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          icon: Icon(Icons.error_rounded),
          content: Text("Verify your email before processing further"),
        ),
      );
    } else if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistering = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isRegistering = false;
        });
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/adddetails",
          (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      // body
      body: Padding(
        padding: const EdgeInsets.all(25),
        // centers the entire form elements
        child: Center(
          // enables scrolling if soft keyboard overlays the form
          child: SingleChildScrollView(
            // form for validation
            child: Form(
              key: _formKey,
              // column to arrange the elements vertically
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // the children of column
                children: [
                  // email field
                  MyTextField(
                    validator: _emailValidator,
                    label: "Email",
                    hintText: "user101@gmail.com",
                    controller: _emailController,
                    trailingIcon: Container(
                      width: 38,
                      margin: const EdgeInsets.only(right: 5),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (_emailController.text.contains(
                              RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-z]+"),
                            )) {
                              setState(() {
                                _verifyEmail = true;
                              });
                            }
                          },
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // conditionally show verification pin field
                  ConditionalWidget(
                    condition: _verifyEmail,
                    widget: Column(
                      children: [
                        MyPinput(
                          controller: _pinController,
                          onCompleted: (value) {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog.fullscreen(
                                backgroundColor: Colors.black12,
                                child: SpinKitCircle(
                                  color: Colors.amber.shade500,
                                ),
                              ),
                            );

                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.pop(context);

                              setState(() {
                                _verifyEmail = false;
                                _emailVerified = true;
                              });
                            });
                          },
                          validator: (value) {
                            if (value == null || value.length < 4) {
                              return "Invalid PIN";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  // password field
                  MyTextField(
                    validator: _passwordValidator,
                    label: "Password",
                    hintText: "Password123#",
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // password confirmation field
                  MyTextField(
                    validator: _confirmPasswordValidator,
                    label: "Confirm Password",
                    hintText: "Password123#",
                    controller: _confirmPasswordController,
                    obscureText: true,
                  ),
                  // to separate elements
                  const SizedBox(height: 25),
                  // the register button
                  MyAnimatedButton(
                    animate: _isRegistering,
                    titlePrimary: "Register",
                    titleSecondary: "Registering",
                    onTap: _validateAndRegister,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
