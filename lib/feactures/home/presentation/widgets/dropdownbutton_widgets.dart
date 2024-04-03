import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_app/feactures/home/presentation/page/customer_details_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/product_details_page.dart';

const List<String> list = <String>["Customer", "Product"];

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({super.key});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidget();
}

class _DropdownButtonWidget extends State<DropdownButtonWidget> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // value: dropdownValue,
      icon: const Icon(Icons.menu), iconSize: 23,
      alignment: Alignment.bottomCenter, underline: null, isExpanded: true,
      // elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),

      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      onChanged: (String? newValue) {
        print(newValue);
        print(dropdownValue);
        switch (newValue) {
          case 'Customer':
            context.push(ProductDetailsPage.routePath);
            break;
          case 'Product':
            context.push(CustomerDetailsPage.routePath);
            break;
        }

        // },
        // ),
        // onChanged: (String? value) {
        //   // This is called when the user selects an item.

        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
