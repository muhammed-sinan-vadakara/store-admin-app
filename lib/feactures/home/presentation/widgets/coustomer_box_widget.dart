import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';

class CoustomerBoxWidget extends ConsumerWidget {
  final List<CoustomerEntity> entity;
  const CoustomerBoxWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

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
                // onTap: () =>
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
                          "PRODUCT NO : ${indexxx.toString()}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: color.text),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: spaces.space_100, top: spaces.space_100),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text("PRODUCT NAME : "),
                                  Expanded(
                                    child: Text(
                                      entity[index].name,
                                      style:
                                          AppTheme.of(context).typography.h500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("DESCRIPTION : "),
                                  Expanded(
                                    child: Text(
                                      entity[index].description,
                                      style:
                                          AppTheme.of(context).typography.h500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("PRODUCT MRP : "),
                                  Expanded(
                                    child: Text(
                                      entity[index].amount,
                                      style:
                                          AppTheme.of(context).typography.h500,
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     const Text("COUSTOMER ADDRESS : "),
                              //     Text(
                              //       entity[index].address,
                              //       style: AppTheme.of(context).typography.h500,
                              //     ),
                              //   ],
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 8),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       IconButton(
                              //           onPressed: () => ref
                              //               .read(productProviderProvider
                              //                   .notifier)
                              //               .removebyid(id: entity.)
                              //           icon: Icon(
                              //             Icons.delete,
                              //             color: color.primary,
                              //           ))
                              //     ],
                              //   ),
                              // )
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
