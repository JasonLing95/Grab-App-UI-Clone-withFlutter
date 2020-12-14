import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grab/constant.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  bool _isVisible = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _isVisible = true;

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          setState(() {
            _isVisible = false;
          });
        } else if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          setState(() {
            _isVisible = true;
          });
        }
      });
  }

  Future<void> _fetchData() async {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);

    return Scaffold(
      body: RefreshIndicator(
        displacement: 100.0,
        color: kGreen,
        onRefresh: () => _fetchData(),
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: kSpacingUnit.w * 0.0,
              collapsedHeight: kSpacingUnit.w * 0.1,
              pinned: true,
              backgroundColor: kLightGreen,
              stretch: true,
              elevation: 0.0,
              expandedHeight: kSpacingUnit.w * 8.5,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kGreen,
                    ),
                  ),
                  SearchBar(width: width, height: height),
                ]),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: kSpacingUnit.w * 6,
                    color: Colors.white,
                    child: Row(
                      children: [
                        FirstTwoTab(
                          image: 'assets/grab.png',
                          text: '9.90',
                        ),
                        Container(
                          color: kGrey,
                          width: kSpacingUnit.w * 0.2,
                        ),
                        FirstTwoTab(
                          image: 'assets/crown.png',
                          text: '401 Points',
                          isPrice: false,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: kSpacingUnit.w * 0.5,
                  ),
                  Container(
                    height: kSpacingUnit.w * 27,
                    color: Colors.white,
                    child: Column(
                      children: [
                        TopUpBar(width: width),
                        GridListColumn(),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: kSpacingUnit.w * 0.5,
                  ),
                  AdvertColumn(),
                  FirstGridCol(),
                  SecondAdvert(),
                  SecondGridCol(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: Container(
                      height: kSpacingUnit.w * 3,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'That\'s all',
                          style: TextStyle(
                            fontSize: kSpacingUnit.w * 1.2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        curve: Curves.easeInOutQuad,
        duration: Duration(milliseconds: 700),
        height: _isVisible ? kSpacingUnit * 6.0 : 0.0,
        child: Wrap(children: [
          BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 8.0,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_activity_outlined),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment_outlined),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            selectedItemColor: kGreen,
            unselectedItemColor: Colors.grey[600],
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
