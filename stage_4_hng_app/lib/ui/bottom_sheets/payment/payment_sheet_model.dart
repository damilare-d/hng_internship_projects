import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PaymentSheetModel extends BaseViewModel {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  void disposeControllers() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }
}
