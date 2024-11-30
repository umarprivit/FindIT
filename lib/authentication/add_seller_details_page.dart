import 'package:bottom_picker/bottom_picker.dart';
import 'package:classico/components/my_animated_button.dart';
import 'package:classico/components/mytextfield.dart';
import 'package:flutter/material.dart';

class AddSellerDetailsPage extends StatefulWidget {
  const AddSellerDetailsPage({super.key});

  @override
  State<AddSellerDetailsPage> createState() => _AddSellerDetailsPageState();
}

class _AddSellerDetailsPageState extends State<AddSellerDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _cnicNumberController = TextEditingController();
  final _cnicIssuanceDateController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _categoryController = TextEditingController();
  bool _isSaving = false;
  String _category = "None";

  final List<DropdownMenuItem<String>> _categories = [
    const DropdownMenuItem(
      value: 'General Store',
      child: Text('General Store'),
    ),
    const DropdownMenuItem(
      value: 'Grocery',
      child: Text('Grocery'),
    ),
    const DropdownMenuItem(
      value: 'Clothing',
      child: Text('Clothing'),
    ),
    const DropdownMenuItem(
      value: 'Electronics',
      child: Text('Electronics'),
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    _cnicNumberController.dispose();
    _cnicIssuanceDateController.dispose();
    _fatherNameController.dispose();
    _categoryController.dispose();
  }

  // data validators
  String? _cnicNumberValidator(value) {
    if (value == null || !value.contains(RegExp(r'^4550101052697$'))) {
      return "Invalid CNIC Number";
    }

    return null;
  }

  String? _cnicIssuanceDateValidator(value) {
    if (value == null || value.isEmpty) {
      return "Invalid date";
    }

    return null;
  }

  String? _fatherNameValidator(value) {
    if (value == null || value.length < 3) {
      return "At least 3 characters for father name";
    } else if (value.length > 30) {
      return "Last Name too long. Max 30 characters";
    }

    return null;
  }

  void _showBottomPicker() {
    final now = DateTime.now();
    BottomPicker.date(
      dismissable: true,
      displayCloseIcon: false,
      minDateTime: DateTime(now.year - 5, now.month, now.day),
      maxDateTime: DateTime(now.year, now.month, now.day),
      buttonSingleColor: Theme.of(context).colorScheme.primary,
      onSubmit: (value) {
        _cnicIssuanceDateController.text =
            "${value.month}/${value.day}/${value.year}";
      },
    ).show(context);
  }

  void _validateAndSaveSeller() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSaving = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isSaving = false;
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/login",
            (route) => false,
          );
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
                  // cnic number field
                  MyTextField(
                    validator: _cnicNumberValidator,
                    label: "CNIC Number",
                    controller: _cnicNumberController,
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // cnic issuance date field
                  MyTextField(
                    validator: _cnicIssuanceDateValidator,
                    label: "CNIC Issuance Date",
                    controller: _cnicIssuanceDateController,
                    canRequestFocus: false,
                    trailingIcon: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: _showBottomPicker,
                      child: const Icon(Icons.date_range_rounded),
                    ),
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // father name field
                  MyTextField(
                    validator: _fatherNameValidator,
                    label: "Father Name",
                    controller: _fatherNameController,
                  ),
                  // to separate elements
                  const SizedBox(height: 15),
                  // category field
                  DropdownButtonFormField<String>(
                    items: _categories,
                    borderRadius: BorderRadius.circular(10),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text("Category"),
                    ),
                    onChanged: (value) {
                      _category = value!;
                    },
                  ),
                  // to separate elements
                  const SizedBox(height: 25),
                  // save button
                  MyAnimatedButton(
                    animate: _isSaving,
                    titlePrimary: "Verify and Save",
                    titleSecondary: "Saving",
                    onTap: _validateAndSaveSeller,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
