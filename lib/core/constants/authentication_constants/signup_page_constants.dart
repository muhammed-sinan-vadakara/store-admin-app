import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_page_constants.g.dart';

class SignUpPageConstants {
  final txtAppbarTitle = 'Add Coupons';
  final txtTitle = 'Title';
  final txtHintTextTitle = 'Enter Title...';
  final txtCode = 'Code';
  final txtHintTextCode = 'Enter Code...';
  final txtType = 'Type';
  final txtAmountText = 'Amount';
  final txtPercentageText = 'Percentage';
  final txtFreeDelivery = 'Free Delivery';
  final txtHintTextPercentag = 'Enter Percentage';
  final txtHintTextAmount = 'Enter Amount';
  final txtCondition = 'Conditions';
  final txtAdd = 'Add Coupons';
  final txtSave = 'Save';
  final txtFreeDeliveryApply = 'Free Delivery Applied';
}

@riverpod
SignUpPageConstants signUpPageConstants(SignUpPageConstantsRef ref) {
  return SignUpPageConstants();
}
