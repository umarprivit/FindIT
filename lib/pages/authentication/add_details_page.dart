import 'package:find_it/components/my_animated_button.dart';
import 'package:find_it/components/my_conditional_widget.dart';
import 'package:find_it/components/my_pinput.dart';
import 'package:find_it/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _pinController = TextEditingController();
  bool _isSavingBuyer = false;
  bool _isSavingSeller = false;
  bool _verifyPhone = false;
  bool _phoneVerified = false;

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }

  String? _firstNameValidator(value) {
    if (value == null || value.length < 3) {
      return "At least 3 characters for username";
    } else if (value.length > 20) {
      return "First Name too long. Max 20 characters";
    }

    return null;
  }

  String? _lastNameValidator(value) {
    if (value == null || value.length < 3) {
      return "At least 3 characters for username";
    } else if (value.length > 20) {
      return "Last Name too long. Max 20 characters";
    }

    return null;
  }

  String? _phoneNumberValidator(value) {
    if (value == null || !value.contains(RegExp(r'^03[0-4]{1}[0-9]{8}$'))) {
      return "Invalid Phone Number";
    }
    return null;
  }

  void _validateAndSaveBuyer() {
    if (!_phoneVerified) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          icon: Icon(Icons.error_rounded),
          content: Text("Verify your phone number before processing further"),
        ),
      );
    } else if (_formKey.currentState!.validate()) {
      setState(() {
        _isSavingBuyer = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isSavingBuyer = false;
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/login",
            (route) => false,
          );
        });
      });
    }
  }

  void _validateAndSaveSeller() {
    if (!_phoneVerified) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          icon: Icon(Icons.error_rounded),
          content: Text("Verify your phone number before processing further"),
        ),
      );
    } else if (_formKey.currentState!.validate()) {
      setState(() {
        _isSavingSeller = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isSavingSeller = false;
          Navigator.popAndPushNamed(context, "/addsellerdetails");
        });
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
                  // first name field
                  MyTextField(
                    validator: _firstNameValidator,
                    label: "First Name",
                    hintText: "Abid",
                    controller: _firstNameController,
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // last name field
                  MyTextField(
                    validator: _lastNameValidator,
                    label: "Last Name",
                    hintText: "Memon",
                    controller: _lastNameController,
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // contact number field
                  MyTextField(
                    validator: _phoneNumberValidator,
                    label: "Phone Number",
                    hintText: "03123456789",
                    controller: _phoneNumberController,
                    trailingIcon: Container(
                      width: 38,
                      margin: const EdgeInsets.only(right: 5),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (_phoneNumberController.text
                                .contains(RegExp(r"^03[0-4]{1}[0-9]{8}"))) {
                              setState(() {
                                _verifyPhone = true;
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
                  // conditionally show verification field
                  ConditionalWidget(
                    condition: _verifyPhone,
                    widget: Column(
                      children: [
                        const SizedBox(height: 15),
                        MyPinput(
                            controller: _pinController,
                            onCompleted: (value) {
                              showDialog(
                                  context: context,
                                  builder: (context) => SpinKitCircle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ));
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.pop(context);
                                setState(() {
                                  _verifyPhone = false;
                                  _phoneVerified = true;
                                });
                              });
                            },
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return "Invalid PIN";
                              }
                              return null;
                            }),
                      ],
                    ),
                  ),
                  // to separate elements
                  const SizedBox(height: 25),
                  // continue as buyer or seller
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // continue as buyer
                        MyAnimatedButton(
                          animate: _isSavingBuyer,
                          titlePrimary: "Create Buyer Account",
                          titleSecondary: "Saving",
                          onTap: _validateAndSaveBuyer,
                        ),
                        // continue as seller
                        MyAnimatedButton(
                          animate: _isSavingSeller,
                          titlePrimary: "Create Seller Account",
                          titleSecondary: "Saving",
                          onTap: _validateAndSaveSeller,
                        ),
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
