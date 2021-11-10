import 'package:flutter/material.dart';
import '../../provider/categories.dart';
import 'widgets/category_full_item.dart';

import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/CategoriesScreen';

  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<Categories>(context, listen: false).categories;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
          title: const Text('Categories'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            5.0,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int i) {
              return ChangeNotifierProvider.value(
                value: categories[i],
                builder: (context, child) => const CategoryItemFull(),
              );
            },
          ),
        ));
  }
}
