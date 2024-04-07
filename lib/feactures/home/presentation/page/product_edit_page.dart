import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/coustomer_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/product_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/form_text_feild_widget.dart';

class ProductEditPage extends HookConsumerWidget {
  static const routePath = '/Productedit';
  final ProductEntity entity;
  const ProductEditPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final addressController = useTextEditingController();
    final spaces = AppTheme.of(context).spaces;
    final isLoading = useState<bool>(false);

    void updatecostomer() async {
      isLoading.value = true;
      await ref.read(productProviderProvider.notifier).updateProduct(
            name: nameController.text,
            address: addressController.text,
            productId: entity.productId,
            phonenumber: phoneNumberController.text,
            email: emailController.text,
          );

      Future.sync(() => context.pop());
    }

    useEffect(() {
      Future.delayed(Duration.zero, () {
        nameController.text = entity.name;
        addressController.text = entity.address;
        emailController.text = entity.email;
        phoneNumberController.text = entity.phonenumber;
      });
      return null;
    }, []);

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
          title: const Text("COSTOMER UPDATEING"),
        ),
        backgroundColor: AppTheme.of(context).colors.secondary,
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
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
                          hinttText: "Enter Costomer Name",
                          controller: nameController),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_300, vertical: 8),
                      child: const Text("COSTOMER EMAIL"),
                    ),
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
                          controller: emailController),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_300,
                          vertical: spaces.space_100),
                      child: const Text("COUSTOMER PHONE NUMBER"),
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
                          controller: phoneNumberController),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spaces.space_300,
                          vertical: spaces.space_100),
                      child: const Text("COUSTOMER ADDRESS"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spaces.space_300),
                      child: FormTextFieldWidget(
                          hinttText: "Enter Coustomer Address",
                          controller: addressController),
                    ),
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
                text: "UPDATE",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Show processing snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Product updated successfully!')),
                    );

                    ref
                        .read(productProviderProvider.notifier)
                        .updateProduct(
                          productId: entity.productId,
                          name: nameController.text,
                          email: emailController.text,
                          phonenumber: phoneNumberController.text,
                          address: addressController.text,
                        )
                        .then((value) {
                      print('Product updated successfully!');
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error adding product: $error'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });

                    Future.sync(() => context.pop());
                  }
                }),
          ),
        ),
      ),
    );
  }
}
