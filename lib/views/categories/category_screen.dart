import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NormalAppBar(title: 'Category'),
      body: Center(
        child: Text('Category Screen'),
      ),
    );
  }
}
