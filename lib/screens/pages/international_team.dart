import 'package:flutter/material.dart';
import 'package:football21wikiapp/common_widget/list_view_design.dart';
import 'package:football21wikiapp/common_widget/text_generator.dart';
import 'package:football21wikiapp/models/international_team.dart';
import 'package:football21wikiapp/utils/size_helper.dart';
import 'package:football21wikiapp/utils/strings.dart';

class InternationalTeamScreen extends StatelessWidget {
  final InternationalTeam team;

  TextGenerator textGenerator = TextGenerator();
  ListViewDesign listViewDesign = ListViewDesign();

  InternationalTeamScreen({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: displayHeight(context) * 0.1,
          child: Center(
            child: textGenerator.buildText(
              text: Strings.internationalTeam,
              context: context,
              fontWeight: FontWeight.w700,
              fontSize: displayHeight(context) * 0.025,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                team.tShirt.length == 1
                    ? SizedBox(
                        height: displayWidth(context) * 0.4,
                        width: displayWidth(context) * 0.4,
                        child: Image.asset(
                          team.tShirt[0],
                          fit: BoxFit.fill,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: displayWidth(context) * 0.4,
                            width: displayWidth(context) * 0.4,
                            child: Image.asset(
                              team.tShirt[0],
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: displayWidth(context) * 0.04,
                          ),
                          SizedBox(
                            height: displayWidth(context) * 0.4,
                            width: displayWidth(context) * 0.4,
                            child: Image.asset(
                              team.tShirt[1],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                listViewDesign.buildTeamDetails(
                  context: context,
                  title: Strings.founded,
                  detail: team.founded.toString(),
                ),
                listViewDesign.buildTeamDetails(
                  context: context,
                  title: Strings.stadium,
                  detail: team.stadium,
                ),
                listViewDesign.buildTeamDetails(
                  context: context,
                  title: Strings.location,
                  detail: team.location,
                ),
                listViewDesign.buildTeamDetails(
                  context: context,
                  title: Strings.manager,
                  detail: team.manager,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
