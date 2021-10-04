import 'package:flutter/material.dart';
import 'package:football21wikiapp/common_widget/text_generator.dart';
import 'package:football21wikiapp/utils/app_colors.dart';
import 'package:football21wikiapp/utils/size_helper.dart';

class ListViewDesign {
  TextGenerator textGenerator = TextGenerator();

  Widget buildTopPlayerList({
    required BuildContext context,
    required String playerName,
    required String club,
    required String rating,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: displayHeight(context) * 0.08,
        width: displayWidth(context),
        color: AppColors.listbg,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textGenerator.buildText(
                text: playerName,
                context: context,
                color: AppColors.playerText,
                fontSize: displayWidth(context) * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textGenerator.buildText(
                    text: club,
                    context: context,
                    color: AppColors.textColor,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.03,
                  ),
                  const VerticalDivider(
                    indent: 8,
                    endIndent: 8,
                    width: 2,
                    color: AppColors.textColor,
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.03,
                  ),
                  textGenerator.buildText(
                    text: rating,
                    context: context,
                    color: AppColors.textColor,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopClubList({
    required BuildContext context,
    required String clubName,
    required String url,
    required String manager,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: displayHeight(context) * 0.08,
        width: displayWidth(context),
        color: AppColors.listbg,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    url,
                    height: displayHeight(context) * 0.04,
                    width: displayHeight(context) * 0.04,
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.03,
                  ),
                  textGenerator.buildText(
                    text: clubName,
                    context: context,
                    color: AppColors.playerText,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ],
              ),
              textGenerator.buildText(
                text: manager,
                context: context,
                color: AppColors.textColor,
                fontSize: displayWidth(context) * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAllCupsList({
    required BuildContext context,
    required String name,
    required String year,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: displayHeight(context) * 0.08,
        width: displayWidth(context),
        color: AppColors.listbg,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textGenerator.buildText(
                text: name,
                context: context,
                color: AppColors.playerText,
                fontSize: displayWidth(context) * 0.04,
              ),
              textGenerator.buildText(
                text: year,
                context: context,
                color: AppColors.playerText,
                fontSize: displayWidth(context) * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTeamDetails({
    required BuildContext context,
    required String title,
    required String detail,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: displayHeight(context) * 0.08,
        width: displayWidth(context),
        color: AppColors.listbg,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textGenerator.buildText(
                text: title,
                context: context,
                color: AppColors.playerText,
                fontSize: displayWidth(context) * 0.04,
              ),
              textGenerator.buildText(
                text: detail,
                context: context,
                color: AppColors.playerText,
                fontSize: displayWidth(context) * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
