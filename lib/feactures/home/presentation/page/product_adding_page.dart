import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/utils/snack_bar_utils.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/product_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/form_text_feild_widget.dart';

class ProductAddingPage extends HookConsumerWidget {
  static const routePath = '/productadding';
  const ProductAddingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final addressController = useTextEditingController();

    final spaces = AppTheme.of(context).spaces;
//     final constants = ref.watch(addOfferPageConstantsProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 6,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme.of(context).colors.primary,
            ),
          ),
          centerTitle: true,
          title: Text("COSTOMER ADDING"),
        ),
        backgroundColor: AppTheme.of(context).colors.secondary,
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("COSTOMER NAME"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spaces.space_300),
                      child: FormTextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Costomer Name";
                            }
                          },

                          // enabled: true,
                          // textFieldTitle: "hjhh",
                          // constants.txtTitle,
                          hinttText: "Enter Costomer Name",
                          // constants.txtHintTextTitle,
                          controller: nameController),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_300, vertical: 8),
                      child: Text("COSTOMER EMAIL"
                          // constants.txtOfferDetails,
                          // style: typography.h400,
                          ),
                    ),
                    // const SizedBox8Widget(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spaces.space_300),
                      child: FormTextFieldWidget(
                          hinttText: "Enter Coustomer Email",
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);

                            if (value!.isEmpty) {
                              return "Enter Email";
                            }

                            if (!emailValid) {
                              return "Enter Valid Email";
                            }
                          },
                          // maxLines: null,
                          // enabled: true,
                          // textFieldTitle: constants.txtDescription,
                          // hintText: constants.txtHintTextdescription,
                          controller: emailController),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_300,
                          vertical: spaces.space_100),
                      child: Text("COUSTOMER PHONE NUMBER"
                          // constants.txtOfferDetails,
                          // style: typography.h400,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spaces.space_300),
                      child: FormTextFieldWidget(
                          hinttText: "Enter Coustomer Phone Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Phone Number";
                            } else if (phoneNumberController.text.length < 10) {
                              return "Phone Number should be contain 10 Numbers";
                            }
                          },
                          keyboardtype: TextInputType.number,
                          // maxLines: null,
                          // enabled: true,
                          // textFieldTitle: constants.txtDescription,
                          // hintText: constants.txtHintTextdescription,
                          controller: phoneNumberController),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_300,
                          vertical: spaces.space_100),
                      child: Text("COUSTOMER ADDRESS"
                          // constants.txtOfferDetails,
                          // style: typography.h400,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spaces.space_300),
                      child: TextFieldWidget(
                          hinttText: "Enter Coustomer Address",
                          // maxLines: null,
                          // enabled: true,
                          // textFieldTitle: constants.txtDescription,
                          // hintText: constants.txtHintTextdescription,
                          controller: addressController),
                    ),
                    // const SizedBox16Widget(),

                    // const S/izedBox32Widget(),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                    //   child: TextFieldWidget(
                    //       enabled: true,
                    //       textFieldTitle:
                    //           selectedOfferType.value == OfferType.percentage
                    //               ? 'Offer Percentage'
                    //               : 'Offfer Amount',
                    //       hintText: selectedOfferType.value == OfferType.percentage
                    //           ? constants.txtHintTextPercentage
                    //           : constants.txtHintTextAmount,
                    //       controller: percentageController),
                    // ),
                    // SizedBox(
                    //   height: spaces.space_200,
                    // ),
                    // const RowHeadingWidget(),
                    // ListViewProductsWidget(
                    //   offerType: selectedOfferType.value,
                    //   offerValue: double.parse(
                    //       percentageController.text.trim().isNotEmpty
                    //           ? percentageController.text
                    //           : '0'),
                    // ),
                    // const SizedBox8Widget(),
                    const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButtonWidget(
                text: "save",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Show processing snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Product added successfully!')),
                    );

                    // Add product with proper error handling
                    ref
                        .read(productProviderProvider.notifier)
                        .addProduct(
                          id: '', // Consider generating a unique ID if needed
                          name: nameController.text,
                          email: emailController.text,
                          phonenumber: phoneNumberController.text,
                          address: addressController.text,
                        )
                        .then((value) {
                      // Handle successful addition (optional)
                      print('Product added successfully!');
                      // Or navigate to a confirmation screen, etc.
                    }).catchError((error) {
                      // Handle errors appropriately, display user-friendly message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error adding product: $error'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });

                    // Clear form fields after successful addition or error handling
                    Future.sync(() {
                      nameController.clear();
                      emailController.clear();
                      phoneNumberController.clear();
                      addressController.clear();
                    });
                  }

                  // onPressed: () {
                  //   if (_formKey.currentState!.validate()) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text('Processing Data')),
                  //     );
                  //   } else {
                  //     ref.read(productProviderProvider.notifier).addProduct(
                  //           id: '',
                  //           name: nameController.text,
                  //           email: emailController.text,
                  //           phonenumber: phoneNumberController.text,
                  //           address: addressController.text,
                  //           // amount: amount,
                  //         );
                  //     Future.sync(() {
                  //       nameController.clear();
                  //       emailController.clear();
                  //       phoneNumberController.clear();
                  //       addressController.clear();
                  //     });
                  //   }
                }),
          ),
        ),
      ),
    );
  }
}















// {
//                         if (_formKey.currentState!.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Processing Data')),
//                           );
//                         } else {
//                           ref.read(authenticationProvider.notifier).login(
//                               context,
//                               emailController.text,
//                               passwordController.text);
//                         }
//                       }