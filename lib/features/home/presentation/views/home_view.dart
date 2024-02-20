import 'package:flutter/material.dart';
import 'widgets/best_seller_scrol_viewHome.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_list_viewHorizontal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: CustomScrollView(
         //   physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                CustomListViewHorizontal(),
                Pagetitle(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BestSellerListViewHome(),
          )
        ],
      )),
    );
  }
}
