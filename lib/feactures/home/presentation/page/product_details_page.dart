import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/feactures/home/presentation/page/product_adding_page.dart';
import 'package:store_admin_app/feactures/home/presentation/provider/product_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/details_shimmer_widget.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/product_box_widget.dart';

class ProductDetailsPage extends ConsumerWidget {
  static const routePath = '/productdetails';
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final theme = AppTheme.of(context);
    // final constants = AddOfferPageConstants();
    return Scaffold(
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
        title: Text("COSTOMER DETAILS"),
      ),
      backgroundColor: theme.colors.secondary,
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: switch (ref.watch(getAllproductProvider)) {
          AsyncData(:final value) => SizedBox(
              child: ProductBoxWidget(
                entity: value,
              ),
            ),
          AsyncError() => const Center(
              child: Text('Error while getting data'),
            ),
          _ => const Center(
              child: DetailsShimmer(),
            )
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                backgroundColor: color.primary),
            onPressed: () {
              context.push(ProductAddingPage.routePath);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: color.secondary,
                ),
                SizedBox(
                  width: theme.spaces.space_50,
                ),
                Text(" NEW COSTOMERS",
                    style: theme.typography.h300.copyWith(
                      color: color.secondary,
                    ))
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
