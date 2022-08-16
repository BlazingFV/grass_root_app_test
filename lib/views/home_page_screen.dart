import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grass_root_app/configs/app_styling.dart';
import 'package:grass_root_app/views/widgets/choosing_team_widget.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../configs/custom_scrolling_animation.dart';
import '../shared/widgets/app_bar_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  int bottomNavigationCurrentIndex = 0;
  double? height, width = 0.0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        height = MediaQuery.of(context).size.height;
        width = MediaQuery.of(context).size.width;
      });
      ScreenUtil.init(context,
          designSize: Size(width!, height!),
          minTextAdapt: true,
          splitScreenMode: true);
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("${ScreenUtil.defaultSize}");
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationCurrentIndex,
        onTap: (index) {
          setState(() {
            bottomNavigationCurrentIndex = index;
          });
          if (index == 2) {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.43,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // create a close button and add it to the top right of the sheet
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                });
          }
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                  color: navigationBarMiddleItemColor,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.add,
                color: secondaryColor,
                size: 20,
              ),
            ),
            label: 'Plus',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Set',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Sk',
          ),
        ],
      ),
      appBar: const SharedAppBarWidget(
        leading: Icon(
          Icons.notifications_outlined,
        ),
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: Center(
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AutoSizeText(
                'Wallet',
                style: TextStyle(
                  color: subtitleTextColor,
                  fontWeight: FontWeight.w500,
                ),
                maxFontSize: 18,
                minFontSize: 16,
              ),
              const SizedBox(height: 5),
              const ChoosingTeamTextWidget(),
              const SizedBox(height: 8),
              SizedBox(
                // width: ,
                height: 150,
                child: ListView.builder(
                  cacheExtent: 0,
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return AnimatedScrollViewItem(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              setState(() {
                                _index = index;
                              });
                            } else {
                              showCupertinoDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: const Text('Coming Soon'),
                                  content:
                                      const Text('This feature is coming soon'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: SizedBox(
                            width: 165,
                            child: ItemsCardWidget(
                              isSelected: _index == index,
                              title: returnTitle(index),
                              topIcon: returnTopIcon(index),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              topTabBar(),
              SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        // color: Colors.black,
                        height: 65.h,
                        width: ScreenUtil().screenWidth * 0.83,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            fillColor: textFieldFillColor,
                            filled: true,
                            hintText: 'Search',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintStyle: const TextStyle(
                              color: subtitleTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                              vertical: 10.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: const Icon(
                        Icons.swap_vert,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: SizedBox(
                  height: ScreenUtil().screenHeight * 0.38,
                  width: double.infinity,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const TokensCardWidget();
                      }),
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: ExpandableNotifier(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: true,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                          tapBodyToExpand: true,
                          iconSize: 32,
                          iconColor: subtitleTextColor,
                        ),
                        header: const AutoSizeText(
                          'Hidden tokens (2)',
                          style: TextStyle(
                            color: subtitleTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        collapsed: const Text(
                          '',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          softWrap: true,
                        ),
                        // tapHeaderToExpand: true,
                        // hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: ExpandableNotifier(
                  child: ConstrainedBox(
                    constraints:  BoxConstraints(
                      minHeight: ScreenUtil().screenHeight*0.05,
                      maxHeight: double.infinity,
                    ),
                    // height: ScreenUtil().screenHeight*0.07,
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: true,
                      child: ExpandablePanel(

                        theme: const ExpandableThemeData(

                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                          tapBodyToExpand: true,
                          iconSize: 32,
                          iconColor: subtitleTextColor,
                        ),
                        header: const AutoSizeText(
                          'Suspicious tokens (15)',
                          style: TextStyle(
                            color: subtitleTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        collapsed: const Text(
                          '',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          softWrap: true,
                        ),
                        // tapHeaderToExpand: true,
                        // hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ),
             const SizedBox(height:50),
            ],
          ),
        ),
      ),
    );
  }

  Widget topTabBar() {
    return TabBar(
      controller: _tabController,
      // tabBarColor: Colors.white,
      indicatorColor: secondaryColor,
      indicatorWeight: 2.0,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: MaterialIndicator(
        bottomLeftRadius: 100,
        bottomRightRadius: 100,
        topLeftRadius: 100,
        topRightRadius: 100,
        strokeWidth: 2,
        horizontalPadding: 25,
        color: secondaryColor,
        paintingStyle: PaintingStyle.fill,
        tabPosition: TabPosition.bottom,
      ),
      // enableFeedback: true,
      isScrollable: true,

      labelStyle: const TextStyle(
        // color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelColor: Colors.black,
      // labelColor: AppConfigs.primaryColor,
      unselectedLabelStyle: const TextStyle(
        // color: Colors.black,

        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelColor: subtitleTextColor,
      // length: 2,
      tabs: const [
        Tab(
          height: 45,
          text: 'Tokens',
        ),
        Tab(
          height: 45,
          text: 'Leasing',
        )
      ],
    );
  }

  String returnTitle(int index) {
    switch (index) {
      case 0:
        return 'Your address';
      case 1:
        return 'Aliases';
      case 2:
        return 'Balance';
      case 3:
        return 'Receive';
      default:
        return 'Wallet';
    }
  }

  Widget returnTopIcon(int index) {
    switch (index) {
      case 0:
        return const Icon(
          Icons.qr_code_outlined,
          color: Colors.white,
        );
      case 1:
        return const Icon(
          Icons.person_outline_sharp,
          color: Colors.black,
        );
      case 2:
        return Switch.adaptive(value: true, onChanged: (val) {});
      case 3:
        return const Icon(
          Icons.close_fullscreen_outlined,
          color: Colors.black,
        );

      default:
        return const SizedBox();
    }
  }
}

class TokensCardWidget extends StatelessWidget {
  const TokensCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Coming Soon'),
            content: const Text('This feature is coming soon'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      child: SizedBox(
        height: ScreenUtil().screenHeight * 0.11,
        width: ScreenUtil().screenWidth * 0.83,
        child: PhysicalModel(
          color: Colors.white,
          elevation: 2.3,
          shadowColor: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            margin: const EdgeInsets.only(left: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Icon(
                        Icons.money,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                      // top: 0,
                      right: 3,
                      bottom: 2,
                      child: Container(
                        // padding: const EdgeInsets.all(8),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: subtitleTextColor.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.check, size: 18),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText(
                    'Waves',
                    style: TextStyle(
                      color: subtitleTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxFontSize: 18,
                    minFontSize: 16,
                  ),
                  AutoSizeText(
                    "5.004",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    maxFontSize: 21,
                    minFontSize: 19,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class ItemsCardWidget extends StatelessWidget {
  final String title;
  final Widget topIcon;
  final bool isSelected;
  const ItemsCardWidget({
    Key? key,
    required this.title,
    required this.topIcon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? secondaryColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: topIcon,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : subtitleTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
