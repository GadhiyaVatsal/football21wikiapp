import 'package:flutter/material.dart';
import 'package:football21wikiapp/common_widget/list_view_design.dart';
import 'package:football21wikiapp/common_widget/text_generator.dart';
import 'package:football21wikiapp/models/country_list.dart';
import 'package:football21wikiapp/utils/size_helper.dart';
import 'package:football21wikiapp/utils/strings.dart';

class TopPlayerScreen extends StatelessWidget {
  final List<TopPlayer> topPlayer;
  TextGenerator textGenerator = TextGenerator();
  ListViewDesign listViewDesign = ListViewDesign();

  TopPlayerScreen({required this.topPlayer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: displayHeight(context) * 0.1,
          child: Center(
            child: textGenerator.buildText(
              text: Strings.topPlayer,
              context: context,
              fontWeight: FontWeight.w700,
              fontSize: displayHeight(context) * 0.025,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: topPlayer.length,
              itemBuilder: (context, index) {
                var currPlayer = topPlayer[index];
                return listViewDesign.buildTopPlayerList(
                  context: context,
                  playerName: currPlayer.name,
                  club: currPlayer.club,
                  rating: currPlayer.rating.toString(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
