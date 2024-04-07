import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/presentation/page/product_edit_page.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/product_provider.dart';

class ProductBoxWidget extends ConsumerWidget {
  final List<ProductEntity> entity;
  const ProductBoxWidget({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    if (entity.isEmpty) {
      return Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  height: 150,
                  width: 300,
                  child: Lottie.asset("assets/animations/nodatabyrobort.json",
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: spaces.space_100 * 12,
            ),
            Text(
              "There was no data added",
              style: TextStyle(
                  color: color.primary,
                  fontSize: spaces.space_250,
                  fontWeight: FontWeight.w800),
            )
          ],
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: entity.length,
        itemBuilder: (context, index) {
          final int indexxx = index + 1;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: InkWell(
                  onTap: () => context.push(ProductEditPage.routePath,
                      extra: entity[index]),
                  //     context.push(EditOfferPage.routePath, extra: entity[index]),
                  child: Container(
                    // height: AppTheme.of(context).spaces.space_500 * 2,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(spaces.space_50),
                        color: color.secondary,
                        boxShadow: [AppTheme.of(context).boxShadow.secondary]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: spaces.space_200,
                          top: spaces.space_200,
                          right: spaces.space_200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "COUSTOMER NO : ${indexxx.toString()}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: color.text),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: spaces.space_100,
                                top: spaces.space_100),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: color.text),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text("NAME : "),
                                            Expanded(
                                              child: Text(
                                                entity[index].name,
                                                style: AppTheme.of(context)
                                                    .typography
                                                    .h500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("EMAIL : "),
                                            Expanded(
                                              child: Text(
                                                entity[index].email,
                                                style: AppTheme.of(context)
                                                    .typography
                                                    .h500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("PHONE : "),
                                            Expanded(
                                              child: Text(
                                                entity[index].phonenumber,
                                                style: AppTheme.of(context)
                                                    .typography
                                                    .h500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("ADDRESS : "),
                                            Expanded(
                                              child: Text(
                                                entity[index].address,
                                                style: AppTheme.of(context)
                                                    .typography
                                                    .h500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () => context.push(
                                              ProductEditPage.routePath,
                                              extra: entity[index]),
                                          icon: Icon(
                                            Icons.edit,
                                            color: color.primary,
                                          )),
                                      IconButton(
                                          onPressed: () => showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirm Delete'),
                                                    content: const Text(
                                                        'Are you sure. you want to delete this costomer?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          ref
                                                              .read(
                                                                  productProviderProvider
                                                                      .notifier)
                                                              .removebyid(
                                                                  id: entity[
                                                                          index]
                                                                      .productId);
                                                          Navigator.pop(
                                                              context); // Close confirmation dialog
                                                        },
                                                        child: const Text(
                                                            'Delete'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                          icon: Icon(
                                            Icons.delete,
                                            color: color.primary,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spaces.space_400,
              ),
            ],
          );
        },
      );
    }
  }
}
