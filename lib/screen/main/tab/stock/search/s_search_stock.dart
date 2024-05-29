import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nav/nav.dart';

import '../../../../../common/widget/w_tap.dart';

class StockSearchScreen extends StatefulWidget {
  const StockSearchScreen({super.key});

  @override
  State<StockSearchScreen> createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  final controller = TextEditingController();
  late final searchData = Get.find<SearchStockData>();

  @override
  void initState() {
    Get.put(SearchStockData());
    controller.addListener(() {
      searchData.search(controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(
        controller: controller,
      ),
      body: Obx(
        () => searchData.searchResult.isEmpty
            ? ListView(
                children: [
                  SearchHistoryList(),
                  PopularSearchStockList(),
                ],
              )
            : ListView.builder(
                itemCount: searchData.searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  final element = searchData.searchResult[index];
                  return Tap(
                    onTap: () {
                      Nav.push(StockDetail(stockName: element.name));
                      searchData.addSearchHistory(element.name);
                      controller.clear();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: element.name.text.make(),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
