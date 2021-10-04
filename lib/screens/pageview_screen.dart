import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football21wikiapp/common_widget/text_generator.dart';
import 'package:football21wikiapp/models/country_list.dart';
import 'package:football21wikiapp/models/international_team.dart';
import 'package:football21wikiapp/screens/pages/all_cups.dart';
import 'package:football21wikiapp/screens/pages/international_team.dart';
import 'package:football21wikiapp/screens/pages/top_clubs.dart';
import 'package:football21wikiapp/screens/pages/top_player.dart';
import 'package:football21wikiapp/utils/all_assets.dart';
import 'package:football21wikiapp/utils/app_colors.dart';
import 'package:football21wikiapp/utils/size_helper.dart';

class PageviewScreen extends StatefulWidget {
  final Country country;
  final InternationalTeam team;

  const PageviewScreen({Key? key, required this.country, required this.team})
      : super(key: key);

  @override
  _PageviewScreenState createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen>
    with SingleTickerProviderStateMixin {
  TextGenerator textGenerator = TextGenerator();
  late TabController _tabController;
  var country;
  var team;
  int currentIndex = 0;

  @override
  void initState() {
    country = widget.country;
    team = widget.team;
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleListner);
    super.initState();
  }

  void _handleListner() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            color: AppColors.appbar,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.titleText,
                          size: 25,
                        ),
                      ),
                    ),
                    textGenerator.buildText(
                      text: widget.country.name,
                      context: context,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: displayHeight(context) * 0.12,
              color: AppColors.tabBar,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.04),
                child: TabBar(
                  controller: _tabController,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: AppColors.appbar,
                  ),
                  labelPadding:
                      EdgeInsets.only(bottom: displayWidth(context) * 0.038),
                  labelColor: AppColors.selectedTab,
                  tabs: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: displayWidth(context) * 0.04),
                      child: SvgPicture.asset(
                        AllAssets.top_player,
                        height: 38,
                        width: 38,
                        color: _tabController.index == 0
                            ? AppColors.selectedTab
                            : AppColors.unselectedTab.withOpacity(0.45),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: displayWidth(context) * 0.04),
                      child: SvgPicture.asset(
                        AllAssets.top_clubs,
                        height: 36,
                        width: 36,
                        color: _tabController.index == 1
                            ? AppColors.selectedTab
                            : AppColors.unselectedTab.withOpacity(0.45),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: displayWidth(context) * 0.04),
                      child: SvgPicture.asset(
                        AllAssets.international,
                        height: 35,
                        width: 35,
                        color: _tabController.index == 2
                            ? AppColors.selectedTab
                            : AppColors.unselectedTab.withOpacity(0.45),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: displayWidth(context) * 0.04),
                      child: SvgPicture.asset(
                        AllAssets.all_cups,
                        height: 35,
                        width: 35,
                        color: _tabController.index == 3
                            ? AppColors.selectedTab
                            : AppColors.unselectedTab.withOpacity(0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                dragStartBehavior: DragStartBehavior.down,
                children: [
                  TopPlayerScreen(topPlayer: widget.country.topPlayer),
                  TopClubsScreen(topClubs: widget.country.topClubs),
                  InternationalTeamScreen(team: widget.team),
                  AllCupsScreen(allCups: widget.country.allCups),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
