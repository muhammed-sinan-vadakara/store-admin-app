import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/presentation/page/cotomer_edit_page.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/coustomer_provider.dart';

class CoustomerBoxWidget extends ConsumerWidget {
  final List<CoustomerEntity> entity;
  const CoustomerBoxWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    if (entity.isEmpty) {
      return Center(
        child: Column(
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
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: InkWell(
                    onTap: () => context.push(CostomerEditPage.routePath,
                        extra: entity[index]),
                    //     context.push(EditOfferPage.routePath, extra: entity[index]),
                    child: Container(
                      // height: AppTheme.of(context).spaces.space_500 * 2,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(spaces.space_50),
                          color: color.secondary,
                          boxShadow: [
                            AppTheme.of(context).boxShadow.secondary
                          ]),
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
                              "PRODUCT NO : ${indexxx.toString()}",
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
                                  Row(
                                    children: [
                                      const Text("PRODUCT NAME : "),
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      children: [
                                        const Text("DESCRIPTION : "),
                                        Expanded(
                                          child: Text(
                                            entity[index].description,
                                            style: AppTheme.of(context)
                                                .typography
                                                .h500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        const Text("MRP(Include all taxes) : "),
                                        Expanded(
                                          child: Text(
                                            entity[index].amount,
                                            style: AppTheme.of(context)
                                                .typography
                                                .h500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: spaces.space_50,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: color.primary, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Text("TAX DETAILS"),
                                          ),
                                          Row(
                                            children: [
                                              const Text("STATE GST (9%) : "),
                                              Expanded(
                                                child: Text(
                                                  "${double.parse(entity[index].amount) * 0.09}",
                                                  style: AppTheme.of(context)
                                                      .typography
                                                      .h500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("CENTRAL GST (9%) : "),
                                              Expanded(
                                                child: Text(
                                                  "${double.parse(entity[index].amount) * 0.09}",
                                                  style: AppTheme.of(context)
                                                      .typography
                                                      .h500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("TOTAL GST (18%) : "),
                                              Expanded(
                                                child: Text(
                                                  "${double.parse(entity[index].amount) * 0.18}",
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
                                  SizedBox(
                                    height: spaces.space_50,
                                  ),

                                  // double amount = double.parse(percentageController.text);
                                  // Row(
                                  //   children: [
                                  //     const Text("COUSTOMER ADDRESS : "),
                                  //     Text(
                                  //       entity[index].address,
                                  //       style: AppTheme.of(context).typography.h500,
                                  //     ),
                                  //   ],
                                  // ),

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
                                                CostomerEditPage.routePath,
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
                                                          'Are you sure. you want to delete this Product?'),
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
                                                                .read(coustomerProvider
                                                                    .notifier)
                                                                .remove(
                                                                    id: entity[
                                                                            index]
                                                                        .Coustomerid);
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
            ),
          );
        },
      );
    }
  }
}
