import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/coustomer_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/form_text_feild_widget.dart';

class CustomerAddingPage extends HookConsumerWidget {
  static const routePath = '/customeradding';
  const CustomerAddingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final amountController = useTextEditingController();
    final spaces = AppTheme.of(context).spaces;
//     final constants = ref.watch(addOfferPageConstantsProvider);

    void addOffer() async {
      // double amount = double.parse(percentageController.text);

      await ref.read(coustomerProvider.notifier).addcostomer(
            id: '',
            name: nameController.text,
            description: descriptionController.text,
            amount: amountController.text,
            // amount: amount,
          );

      Future.sync(() => context.pop());
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colors.secondary,
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
          title: Text("PRODUCT ADDING"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(),
                  Text("PRODUCT NAME"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spaces.space_300,
                        vertical: spaces.space_100),
                    child: FormTextFieldWidget(
                        hinttText: "Enter Product Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add product name";
                          }
                        },
                        controller: nameController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spaces.space_300,
                        vertical: spaces.space_100),
                    child: Text("PRODUCT DESCRIPTION"),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                    child: FormTextFieldWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Describe the product";
                          }
                        },
                        hinttText: "Enter Descrption of Product",
                        controller: descriptionController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spaces.space_300,
                        vertical: spaces.space_150),
                    child: Text("MRP(include all taxes)"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                    child: FormTextFieldWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter MRP of the product";
                          } else if (double.parse(value) <= 0) {
                            return "Negative and zero is MRP is not allowed";
                          }
                        },
                        keyboardtype: TextInputType.number,
                        hinttText: "Enter MRP of Product",
                        controller: amountController),
                  ),

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
                          content: Text('Product added successfully')),
                    );

                    // Add product with proper error handling
                    ref
                        .read(coustomerProvider.notifier)
                        .addcostomer(
                            id: '', // Consider generating a unique ID if needed
                            name: nameController.text,
                            amount: amountController.text,
                            description: descriptionController.text)
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
                      amountController.clear();
                      descriptionController.clear();
                    });
                  }
                }
                // onPressed: () {
                //   // if (_formKey.currentState!.validate()) {
                //   //   ScaffoldMessenger.of(context).showSnackBar(
                //   //     const SnackBar(content: Text('Processing Data')),
                //   //   );
                //   // } else {
                //   ref.read(coustomerProvider.notifier).addcostomer(
                //       id: '',
                //       name: nameController.text,
                //       description: descriptionController.text,
                //       amount: amountController.text
                //       // amount: amount,
                //       );
                // }
                // },
                ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
// import 'package:resto_admin/core/enums/offer_type.dart';
// import 'package:resto_admin/core/themes/app_theme.dart';
// import 'package:resto_admin/core/widgets/app_bar_widget.dart';
// import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
// import 'package:resto_admin/core/widgets/image_picker_widget.dart';
// import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
// import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
// import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
// import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
// import 'package:resto_admin/core/widgets/text_field_widget.dart';
// import 'package:resto_admin/features/offer/presentation/provider/offer_provider.dart';
// import 'package:resto_admin/features/offer/presentation/provider/selected_items_provider.dart';
// import 'package:resto_admin/features/offer/presentation/widgets/listview_products_widget.dart';
// import 'package:resto_admin/features/offer/presentation/widgets/row_heading_widget.dart';
// import 'package:resto_admin/features/offer/presentation/widgets/tab_button_widget.dart.dart';

// class AddOfferPage extends HookConsumerWidget {
//   static const routePath = '/AddOfferPage';
//   const AddOfferPage({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final nameController = useTextEditingController();
//     final descriptionController = useTextEditingController();
//     final percentageController = useTextEditingController();
//     final constants = ref.watch(addOfferPageConstantsProvider);

    
//     //Theme data
//     final spaces = AppTheme.of(context).spaces;
//     final typography = AppTheme.of(context).typography;
//     //Selected tab
//     final selectedOfferType = useState<OfferType>(OfferType.percentage);

//     //Tabs to Show
//     final tabsToShow = useMemoized(
//       () => [
//         {
//           'text': constants.txtPercentageText,
//           'type': OfferType.percentage,
//         },
//         {
//           'text': constants.txtAmountText,
//           'type': OfferType.amount,
//         },
//       ],
//     );

//     //Handle tapping on the tab items
//     void tabOnPressed(int index) {
//       selectedOfferType.value = tabsToShow[index]['type'] as OfferType;
//     }

//     /// Save offer updates
//     void addOffer() async {
//       double amount = double.parse(percentageController.text);

//       await ref.read(offerProvider.notifier).addOffer(
//             id: '',
//             imagePath: ref.watch(imageProvider)!.path,
//             name: nameController.text,
//             description: descriptionController.text,
//             amount: amount,
//             offerType: selectedOfferType.value,
//             product: ref.read(selectedItemsProvider).selectedItems.toList(),
//           );

//       Future.sync(() => context.pop());
//     }

//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         backgroundColor: AppTheme.of(context).colors.secondary,
//         appBar: PreferredSize(
//             preferredSize: Size.fromHeight(spaces.space_700),
//             child: AppBarWidget(title: constants.txtAppbarTitle)),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox24Widget(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
//                 child: const ImagePickerWidget(),
//               ),
//               const SizedBox32Widget(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
//                 child: TextFieldWidget(
//                     enabled: true,
//                     textFieldTitle: constants.txtTitle,
//                     hintText: constants.txtHintTextTitle,
//                     controller: nameController),
//               ),
//               const SizedBox8Widget(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
//                 child: TextFieldWidget(
//                     maxLines: null,
//                     enabled: true,
//                     textFieldTitle: constants.txtDescription,
//                     hintText: constants.txtHintTextdescription,
//                     controller: descriptionController),
//               ),
//               const SizedBox16Widget(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
//                 child: Text(
//                   constants.txtOfferDetails,
//                   style: typography.h400,
//                 ),
//               ),
//               const SizedBox16Widget(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
//                 child: Row(
//                   children: [
//                     for (var i = 0; i < tabsToShow.length; i++)
//                       TabButtonWidget(
//                         buttonText: tabsToShow[i]['text'] as String,
//                         isSelected:
//                             selectedOfferType.value == tabsToShow[i]['type'],
//                         onPressed: () => tabOnPressed(i),
//                       ),
//                   ],
//                 ),
//               ),
//               const SizedBox32Widget(),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
//                 child: TextFieldWidget(
//                     enabled: true,
//                     textFieldTitle:
//                         selectedOfferType.value == OfferType.percentage
//                             ? 'Offer Percentage'
//                             : 'Offfer Amount',
//                     hintText: selectedOfferType.value == OfferType.percentage
//                         ? constants.txtHintTextPercentage
//                         : constants.txtHintTextAmount,
//                     controller: percentageController),
//               ),
//               SizedBox(
//                 height: spaces.space_200,
//               ),
//               const RowHeadingWidget(),
//               ListViewProductsWidget(
//                 offerType: selectedOfferType.value,
//                 offerValue: double.parse(
//                     percentageController.text.trim().isNotEmpty
//                         ? percentageController.text
//                         : '0'),
//               ),
//               const SizedBox8Widget(),
//               const SizedBox()
//             ],
//           ),
//         ),
//         bottomNavigationBar: ElevatedButtonWidget(
//           text: constants.txtSave,
//           onPressed: addOffer,
//         ),
//       ),
//     );
//   }
// }