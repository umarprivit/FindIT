import 'package:classico/authentication/forgot_password_page.dart';
import 'package:classico/authentication/register_page.dart';
import 'package:classico/components/my_animated_button.dart';
import 'package:classico/components/mytextfield.dart';
import 'package:classico/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggingIn = false;

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
  }

  String? _phoneNumberValidator(value) {
    if (value == null || !value.contains(RegExp(r"^03[0-4]{1}[0-9]{8}"))) {
      return "Invalid phone number";
    }
    return null;
  }

  String? _passwordValidator(value) {
    if (value == null || value.length < 6) {
      return "Password too short";
    }
    return null;
  }

  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoggingIn = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoggingIn = false;
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
            (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          // centers the entire form elements
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
                  const Logo(),
                  const Title(),
                  // to separate elements
                  const SizedBox(height: 25),
                  // welcome message
                  const Welcome(),
                  // to separate elements
                  const SizedBox(height: 25),
                  // phone number field
                  MyTextField(
                    validator: _phoneNumberValidator,
                    label: "Phone",
                    hintText: "03123456789",
                    controller: _phoneNumberController,
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // password field
                  MyTextField(
                    validator: _passwordValidator,
                    label: "Password",
                    hintText: "Password123#",
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  // to separate elements
                  const SizedBox(height: 25),
                  // forgot password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // to separate elements
                  const SizedBox(height: 25),
                  // the login button
                  MyAnimatedButton(
                    animate: _isLoggingIn,
                    titlePrimary: "Login",
                    titleSecondary: "Validating",
                    onTap: _validateAndLogin,
                  ),
                  // to separate elements
                  const SizedBox(height: 25),
                  // register new user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New to FindIt? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: Text(
                          "Lets Register",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
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

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Welcome ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          TextSpan(
            text: "back!\n",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          TextSpan(
            text: "You were missed",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 25,
            ),
          ),
        ],
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Find",
            style: TextStyle(color: Colors.grey.shade900),
          ),
          TextSpan(
            text: "IT!",
            style: TextStyle(color: Colors.amber.shade500),
          ),
        ],
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber.shade500,
              ),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.water_drop_sharp,
                size: 130,
                color: Colors.amber.shade500,
              ),
            ),
            const Icon(
              Icons.shopping_cart_rounded,
              size: 55,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}
