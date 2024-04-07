import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/coustomer_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/form_text_feild_widget.dart';

class CostomerEditPage extends HookConsumerWidget {
  static const routePath = '/customeredit';
  final CoustomerEntity entity;
  const CostomerEditPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final amountController = useTextEditingController();
    final spaces = AppTheme.of(context).spaces;
    final isLoading = useState<bool>(false);

    void updatecostomer() async {
      isLoading.value = true;
      await ref.read(coustomerProvider.notifier).updatecoustomer(
            costomerid: entity.Coustomerid,
            name: nameController.text,
            description: descriptionController.text,
            amount: amountController.text,
          );

      Future.sync(() => context.pop());
    }

    useEffect(() {
      Future.delayed(Duration.zero, () {
        nameController.text = entity.name;
        descriptionController.text = entity.description;
        amountController.text = entity.amount;
      });
      return null;
    }, []);

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
          title: const Text("PRODUCT UPDATEING"),
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
                  const Text("PRODUCT NAME"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spaces.space_300,
                        vertical: spaces.space_100),
                    child: FormTextFieldWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please add product name";
                          }
                        },
                        hinttText: "Enter Product Name",
                        enabled: true,
                        controller: nameController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spaces.space_300,
                        vertical: spaces.space_100),
                    child: const Text("PRODUCT DESCRIPTION"),
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
                    child: const Text("MRP(include all taxes)"),
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
                text: "UPDATE",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Product updaded successfully')),
                    );

                    ref
                        .read(coustomerProvider.notifier)
                        .updatecoustomer(
                            costomerid: entity.Coustomerid,
                            name: nameController.text,
                            amount: amountController.text,
                            description: descriptionController.text)
                        .then((value) {
                      print('Product added successfully!');
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
