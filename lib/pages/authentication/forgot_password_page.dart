import 'package:find_it/components/my_animated_button.dart';
import 'package:find_it/components/my_conditional_widget.dart';
import 'package:find_it/components/my_pinput.dart';
import 'package:find_it/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _pinController = TextEditingController();
  bool _sendingSms = false;
  bool _validatingPin = false;
  bool _smsSent = false;

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _pinController.dispose();
  }

  void _validateAndSendSMS() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _sendingSms = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _smsSent = true;
          _sendingSms = false;
        });
      });
    }
  }

  // void _validateAndVerifyPin() {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _sendingSms = true;
  //     });

  //     Future.delayed(const Duration(seconds: 3), () {
  //       setState(() {
  //         _sendingSms = false;
  //         Navigator.popAndPushNamed(context, "/changepassword");
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar of the page
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      // body of the page
      // to add padding of 25 from all directions
      body: Padding(
        padding: const EdgeInsets.all(25),
        // to center the elements
        child: Center(
          // to avoid being overlayed by keyboard
          child: SingleChildScrollView(
            // form for validation
            child: Form(
              key: _formKey,
              // wrapper for the elements of the page
              child: Column(
                children: [
                  // phone number field
                  MyTextField(
                    label: "Phone",
                    hintText: "03123456789",
                    controller: _phoneNumberController,
                    canRequestFocus: !_smsSent,
                    validator: (value) {
                      if (value == null ||
                          !value.contains(RegExp(r'^03[0-4]{1}[0-9]{8}'))) {
                        return "Invalid Phone";
                      }
                      return null;
                    },
                    trailingIcon: ConditionalWidget(
                      condition: _smsSent,
                      widget: IconButton(
                        onPressed: () {
                          setState(() {
                            _smsSent = false;
                          });
                        },
                        icon: const Icon(Icons.edit_rounded),
                      ),
                    ),
                  ),
                  // if sms is not sent yet then show send sms button
                  ConditionalWidget(
                    condition: !_smsSent,
                    widget: Column(
                      children: [
                        const SizedBox(height: 25),
                        MyAnimatedButton(
                          animate: _sendingSms,
                          titlePrimary: "Send SMS",
                          titleSecondary: "Sending SMS",
                          onTap: _validateAndSendSMS,
                        ),
                      ],
                    ),
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // if sms is sent successfully then show pin entry field
                  ConditionalWidget(
                    condition: _smsSent,
                    widget: Column(children: [
                      // show text denoting successful pin sending
                      Text(
                        "SMS sent successfully",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // to separate elements
                      const SizedBox(height: 50),
                      const Text("Enter the PIN sent to your phone number"),
                      const SizedBox(height: 15),
                      // pinput for pin field
                      MyPinput(
                        controller: _pinController,
                        onCompleted: (value) {
                          // temporary: for animating the button and going to change password page
                          setState(() {
                            _validatingPin = true;

                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                _validatingPin = false;
                                Navigator.popAndPushNamed(
                                  context,
                                  "/changepassword",
                                );
                              });
                            });
                          });
                        },
                        validator: (value) {
                          if (value == null || value.length != 4) {
                            return "Invalid PIN";
                          }
                          return null;
                        },
                      ),
                      // to separate elements
                      const SizedBox(height: 15),
                      // temporary: if pin entering completed then show spinner for 3 seconds
                      if (_validatingPin)
                        SpinKitCircle(
                          color: Theme.of(context).colorScheme.primary,
                        )
                    ]),
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
