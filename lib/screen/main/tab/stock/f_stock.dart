import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragment();
}

class _StockFragment extends State<StockFragment> with SingleTickerProviderStateMixin{
  late final _tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appColors.roundedLayoutBackground,
          pinned: true, //앱 바 고정
          actions: [
            ImageButton(
              imagePath: '$basePath/icon/stock_search.png',
              onTap: () {
                //Nav.push(const StockSearchScreen());
              },
            ),
            ImageButton(
              imagePath: '$basePath/icon/stock_calendar.png',
              onTap: () {
                context.showSnackbar('캘린더');
              },
            ),
            ImageButton(
              imagePath: '$basePath/icon/stock_settings.png',
              onTap: () {
                //Nav.push(const SettingScreen());
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              if(currentIndex == 0)
                const MyStockFragment()
              else
                const TodaysDiscoveryFragment()
            ],
          ),
        )
      ],
    );
  }

  Widget get title => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      '토스증권'.text.size(24).bold.make(),
      width20,
      'S&P 500'.text.size(13).bold.color(context.appColors.lessImportantText).make(),
      width10,
      3919.29.toComma().text.size(13).bold.color(context.appColors.plus).make(),
    ],
  ).pOnly(left: 20);

  Widget get tabBar => Column(
    children: [
      TabBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        labelPadding: const EdgeInsets.symmetric(vertical: 20),
        indicatorColor: Colors.white,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
        controller: _tabController,
        tabs: [
          '내 주식'.text.make(),
          '오늘의 발견'.text.make(),
        ],
      ),
      const Line(),
    ],
  );

}
