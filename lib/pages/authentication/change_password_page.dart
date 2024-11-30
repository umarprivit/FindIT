import 'package:find_it/components/my_animated_button.dart';
import 'package:find_it/components/my_text_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  bool _savingNewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    label: "New Password",
                    hintText: "Password123#",
                    controller: _newPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return "Password too short";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    label: "Confirm New Password",
                    hintText: "Password123#",
                    controller: _confirmNewPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null ||
                          value != _newPasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  MyAnimatedButton(
                    animate: _savingNewPassword,
                    titlePrimary: "Change Password",
                    titleSecondary: "Updating your password",
                    onTap: () {
                      setState(() {
                        _savingNewPassword = true;
                      });

                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _savingNewPassword = false;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/login",
                            (route) => false,
                          );
                        });
                      });
                    },
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
