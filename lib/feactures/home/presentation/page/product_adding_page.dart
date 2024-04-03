import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/product_provider.dart';

class ProductAddingPage extends HookConsumerWidget {
  static const routePath = '/productadding';
  const ProductAddingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final addressController = useTextEditingController();
    final spaces = AppTheme.of(context).spaces;
//     final constants = ref.watch(addOfferPageConstantsProvider);

    void addOffer() async {
      // double amount = double.parse(percentageController.text);

      await ref.read(productProviderProvider.notifier).addProduct(
            id: '',
            name: nameController.text,
            email: emailController.text,
            phonenumber: phoneNumberController.text,
            address: addressController.text,
            // amount: amount,
          );

      Future.sync(() => context.pop());
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme.of(context).colors.primary,
            ),
          ),
          centerTitle: true,
          title: Text("COUSTOMER ADDING"),
        ),
        backgroundColor: AppTheme.of(context).colors.secondary,
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(spaces.space_700),
        //     child: AppBarWidget(title: constants.txtAppbarTitle)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text("COUSTOMER NAME"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: TextFieldWidget(
                      // enabled: true,
                      // textFieldTitle: "hjhh",
                      // constants.txtTitle,
                      hinttText: "Enter Coustomer Name",
                      // constants.txtHintTextTitle,
                      controller: nameController),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spaces.space_300, vertical: 8),
                  child: Text("COUSTOMER EMAIL"
                      // constants.txtOfferDetails,
                      // style: typography.h400,
                      ),
                ),
                // const SizedBox8Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: TextFieldWidget(
                      hinttText: "Enter Coustomer Email",
                      // maxLines: null,
                      // enabled: true,
                      // textFieldTitle: constants.txtDescription,
                      // hintText: constants.txtHintTextdescription,
                      controller: emailController),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spaces.space_300, vertical: spaces.space_100),
                  child: Text("COUSTOMER PHONE NUMBER"
                      // constants.txtOfferDetails,
                      // style: typography.h400,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: TextFieldWidget(
                      hinttText: "Enter Coustomer Phone Number",
                      // maxLines: null,
                      // enabled: true,
                      // textFieldTitle: constants.txtDescription,
                      // hintText: constants.txtHintTextdescription,
                      controller: phoneNumberController),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spaces.space_300, vertical: spaces.space_100),
                  child: Text("COUSTOMER ADDRESS"
                      // constants.txtOfferDetails,
                      // style: typography.h400,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
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
        bottomNavigationBar: ElevatedButtonWidget(
          text: "save",
          onPressed: addOffer,
        ),
      ),
    );
  }
}
