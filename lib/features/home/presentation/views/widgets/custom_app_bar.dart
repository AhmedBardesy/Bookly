import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 40, top: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.Logo,
            height: 20,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchview');
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
    );
  }
}
