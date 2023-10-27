import 'package:flutter/material.dart';
import 'package:flutter_todolist/common/common.dart';
import 'package:flutter_todolist/screen/main/tab/calendar/calendar_fragment.dart';
import 'package:flutter_todolist/screen/main/tab/home/home_fragment.dart';
import 'package:flutter_todolist/screen/main/tab/setting/settings_fregment.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: _controller.index == 0
            ? "할일 목록".text.bold.headline6(context).make()
            : _controller.index == 1
                ? "달력".text.bold.headline6(context).make()
                : "설정".text.bold.headline6(context).make(),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/image/logo/easy_todo_logo.png'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        onItemSelected: (index) {
          setState(() {
            _controller.index = index;
          });
        },
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Theme.of(context).colorScheme.background,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() => [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "홈",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.purple),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_today),
        title: "달력",
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            // initialRoute: "/",
            /* routes: {
              "/first": (final context) => const HomeFragment(),
              "/second": (final context) => const CalendarFragment(),
            },*/
            ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "설정",
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            // initialRoute: "/",
            /* routes: {
              "/first": (final context) => const HomeFragment(),
              "/second": (final context) => const CalendarFragment(),
            },*/
            ),
      ),
    ];

List<Widget> _buildScreens() {
  return [
    HomeFragment(),
    CalendarFragment(),
    SettingFragment(),
  ];
}
