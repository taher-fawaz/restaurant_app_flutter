import 'package:flutter/material.dart';
import '../../../provider/categories.dart';
import '../widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context).categories;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length > 6 ? 6 : categories.length,
        itemBuilder: (BuildContext context, int i) {
          return ChangeNotifierProvider.value(
            value: categories[i],
            builder: (context, child) => const CategoryItem(),
          );
        },
      ),
    );
  }
}
