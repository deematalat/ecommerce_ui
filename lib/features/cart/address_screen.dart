import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';


class AddressEntryScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(title: "Full Name"),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: firstNameController,
                        hintText: "First Name",
                        validator: (value) => value!.isEmpty ? 'Enter first name' : null,
                      ),
                    ),
                  horizontalSpace(10),
                    Expanded(
                      child: CustomTextField(
                        controller: lastNameController,
                        hintText: "Last Name",
                        validator: (value) => value!.isEmpty ? 'Enter last name' : null,
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                const SectionTitle(title: "Address Line 1"),
                CustomTextField(
                  controller: addressLine1Controller,
                  hintText: "Address Line 1",
                  validator: (value) => value!.isEmpty ? 'Enter address line 1' : null,
                ),
                verticalSpace(10),
                const SectionTitle(title: "Address Line 2"),
                CustomTextField(
                  controller: addressLine2Controller,
                  hintText: "Address Line 2 (optional)",
                ),
                const SizedBox(height: 10),
                const SectionTitle(title: "City"),
                CustomTextField(
                  controller: cityController,
                  hintText: "City",
                  validator: (value) => value!.isEmpty ? 'Enter city' : null,
                ),
                verticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(title: "State"),
                          CustomTextField(
                            controller: stateController,
                            hintText: "State",
                            validator: (value) => value!.isEmpty ? 'Enter state' : null,
                          ),
                        ],
                      ),
                    ),
                     horizontalSpace(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(title: "Country"),
                          CustomTextField(
                            controller: countryController,
                            hintText: "Country",
                            validator: (value) => value!.isEmpty ? 'Enter country' : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SectionTitle(title: "Zip Code"),
                CustomTextField(
                  controller: zipCodeController,
                  hintText: "Zip Code",
                  validator: (value) => value!.isEmpty ? 'Enter zip code' : null,
                ),
                verticalSpace(10),
                const SectionTitle(title: "Phone Number"),
                CustomTextField(
                  controller: phoneNumberController,
                  hintText: "Phone Number",
                  validator: (value) => value!.isEmpty ? 'Enter phone number' : null,
                ),
                verticalSpace(20),
                Center(
                  child: AppTextButton(
                    textStyle: TextStyles.font26WhiteBold,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pushNamed(Routes.paymentScreen);
                        // Process the data
                        print("Data saved: ${firstNameController.text} ${lastNameController.text}");
                      }
                    },
                    buttonText: 'SAVE & CONTINUE',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:TextStyles.font26BlackBold,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const UnderlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
