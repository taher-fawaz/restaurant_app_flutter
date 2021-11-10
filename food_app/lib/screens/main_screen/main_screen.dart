import 'package:flutter/material.dart';
import '../cart/cart_page.dart';
import '../home/home.dart';
import '../meals_screen/meal_screen.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _page = 0;

  List icons = [
    Icons.home_outlined,
    Icons.pageview_outlined,
    // Icons.label,
    Icons.add,
    Icons.shopping_cart_outlined,
    Icons.person_outline_outlined,
  ];
  List<Widget> pages = const [
    Home(),
    MealsScreen(),
    UserProfileScreen(),
    CartScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController!,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar:
          //const BottomNavBarWidget(),
          BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(2),
            buildTabIcon(3),
            buildTabIcon(4),
            const SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).colorScheme.primary,
        shape: const CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => _pageController!.jumpToPage(2),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController!.jumpToPage(page);

    //  _pageController.animateToPage(_position, curve: Curves.decelerate, duration: Duration(milliseconds: 300));
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      // ignore: unnecessary_this
      this._page = page;
    });
  }

  buildTabIcon(int index) {
    if (index == 2) {
      return IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
          color: Colors.transparent,
        ),
        onPressed: null,
      );
    } else {
      return IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).textTheme.caption!.color,
        onPressed: () => navigationTapped(index),
      );
    }
  }
}
