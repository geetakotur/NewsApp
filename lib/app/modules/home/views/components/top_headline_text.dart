import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/core/env/env.dart';
import 'package:newsapp/app/modules/home/controllers/category_controller.dart';


class TopHeadLinesText extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top Headlines",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
         
        ],
      ),
    );
  }
}
