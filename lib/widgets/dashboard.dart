import 'package:flutter/material.dart';
import 'package:unicon/screens/home.dart';
import 'package:unicon/screens/sign.dart';
import 'package:unicon/screens/tasks.dart';
import 'package:unicon/screens/updates.dart';
import 'package:unicon/utils/colors.dart';
import 'package:unicon/utils/themestyling.dart';

class Dashboard extends StatefulWidget {
  final int? currentPageToNavigate;
  Dashboard({Key? key, this.currentPageToNavigate}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class _DashboardState extends State<Dashboard> {
  bool isVisible = true;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  int _selectedIndex = 0;
  final PageController _controller = PageController();
  final List<Widget> _widgetOptions = [
    Home(),
    Tasks(),
    Updates(),
    
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int _selectedIndex) {
    _controller.jumpToPage(_selectedIndex);
  }

  @override
  void initState() {
    _selectedIndex = widget.currentPageToNavigate ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        // SystemChrome.setPreferredOrientations(
        //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
        if (isFirstRouteInCurrentTab == true) {
          exitApp();
          return false;
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        bottomNavigationBar: Visibility(
          visible: isVisible,
          child: ClipRRect(
              borderRadius: ThemeStyling.navigationBarStyle,
              child: Container(
                  decoration: const BoxDecoration(
                border:  Border(
                  top: BorderSide(
                    color: Color(0xffD7D9E4),
                    width: 2.0,
                  )),
              ),
                height: 80,
                child: Visibility(
                  visible: isVisible,
                  child: BottomNavigationBar(
                    selectedFontSize: 13,
                    unselectedFontSize: 13,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: whiteColor,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    items: List.of(
                        DefaultValues().defaultNavigationList.map((item) {
                      return BottomNavigationBarItem(
                          icon: item["icon"],
                          activeIcon: item["activeIcon"],
                          label: item["label"],
                          backgroundColor: greyColor);
                    }).toList()),
                    currentIndex: _selectedIndex,
                    selectedItemColor: bottomNavColor,
                    unselectedItemColor: unSelectedbottomNavColor,
                    onTap: (index) {
                      if (index == _selectedIndex) {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                builder: (context) =>
                                    Dashboard(currentPageToNavigate: index)));
                      }
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              )),
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
      ),
    );
  }

   void exitApp() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'Please Confirm',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Do you want to logout?',
              textAlign: TextAlign.center,
            ),
            actions: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blueColor),
                    onPressed: () {
                      logout();
                    },
                    child: const Text('Yes')),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blueColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No')),
              )
            ],
          );
        });
  }

  logout() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var _email = preferences.getString("email") ?? "";
    // var _remeberMe = preferences.getBool("remember_me") ?? false;
    // await preferences.clear();
    // if (_remeberMe) {
    //   preferences.setString("email", _email);
    //   preferences.setBool("remember_me", _remeberMe);
    // }
    // DefaultValues.themeColor = const Color(0xff7762FF);
    // DefaultValues.buttonTheme = const Color(0xffD662FF);
    // DefaultValues.colorName = "Purple";
    await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  const Sign()),
        (route) => false);
    // Constants.cookieJar.deleteAll();
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [Home(), Tasks(), Updates()]
            .elementAt(index);
      },
    };
  }
    Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}