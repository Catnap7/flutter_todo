import 'package:flutter/material.dart';
import 'package:flutter_todolist/screen/main/tab/calendar/f_calendar.dart';
import 'package:flutter_todolist/screen/main/tab/home/f_home.dart';
import 'package:flutter_todolist/screen/main/tab/setting/f_setting.dart';
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
        title: const Text('도마도'),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/image/logo/domado_logo.png'),
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
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
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