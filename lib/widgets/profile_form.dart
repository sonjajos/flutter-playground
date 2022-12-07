import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:my_first_flutter_app/screens/home.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  ProfileFormState createState() {
    return ProfileFormState();
  }
}

class ProfileFormState extends State<ProfileForm> {
  final formKey = GlobalKey<FormState>();

  final nameKey = GlobalKey();

  final validateName = ValidationBuilder()
      .required()
      .minLength(3, 'Name must contain at least 3 characters')
      .maxLength(30, 'Name must contain maximally 50 characters')
      .build();

  final validateLastName = ValidationBuilder()
      .required()
      .minLength(3, 'Name must contain at least 3 characters')
      .maxLength(30, 'Name must contain maximally 50 characters')
      .build();

  final validateEmail = ValidationBuilder().required().email().build();

  final validatePhone = ValidationBuilder().required().phone().build();

  String name = "";
  void setName(String value) {
    setState(() {
      name = value;
    });
  }

  String lastName = "";
  void setLastName(String value) {
    setState(() {
      lastName = value;
    });
  }

  String email = "";
  void setEmail(String value) {
    setState(() {
      email = value;
    });
  }

  String phone = "";
  void setPhone(String value) {
    setState(() {
      phone = value;
    });
  }

  bool isFormSubmitted = false;

  void submitForm() {
    setState(() {
      isFormSubmitted = true;
    });
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    }
  }

  var nameFocus = FocusNode();
  var lastNameFocus = FocusNode();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: isFormSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Name",
                        errorStyle: TextStyle(fontSize: 16),
                      ),
                      autocorrect: false,
                      validator: validateName,
                      focusNode: nameFocus,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      keyboardType: TextInputType.name,
                      onChanged: setName,
                      onEditingComplete: () {
                        lastNameFocus.requestFocus();
                      },
                    ),
                    TextFormField(
                      key: nameKey,
                      decoration: const InputDecoration(
                        labelText: "Last Name",
                        errorStyle: TextStyle(fontSize: 16),
                      ),
                      validator: validateLastName,
                      focusNode: lastNameFocus,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      onChanged: setLastName,
                      onEditingComplete: () {
                        emailFocus.requestFocus();
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        errorStyle: TextStyle(fontSize: 16),
                      ),
                      validator: validateEmail,
                      focusNode: emailFocus,
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: setEmail,
                      onEditingComplete: () {
                        phoneFocus.requestFocus();
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Phone",
                        errorStyle: TextStyle(fontSize: 16),
                      ),
                      validator: validatePhone,
                      focusNode: phoneFocus,
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      onChanged: setPhone,
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: submitForm,
                label: const Text('Submit'),
                icon: const Icon(
                  Icons.check,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
