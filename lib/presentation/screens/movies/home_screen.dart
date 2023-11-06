import 'package:flutter/material.dart';
import 'package:os_recomienda/presentation/views/home_views/favorite_views.dart';
import 'package:os_recomienda/presentation/views/home_views/home_views.dart';
import 'package:os_recomienda/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  // final Widget childView;
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
