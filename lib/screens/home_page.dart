import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football21wikiapp/common_widget/text_generator.dart';
import 'package:football21wikiapp/models/country_list.dart';
import 'package:football21wikiapp/models/international_team.dart';
import 'package:football21wikiapp/screens/pageview_screen.dart';
import 'package:football21wikiapp/utils/all_assets.dart';
import 'package:football21wikiapp/utils/app_colors.dart';
import 'package:football21wikiapp/utils/size_helper.dart';
import 'package:football21wikiapp/utils/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextGenerator textGenerator = TextGenerator();
  late CountryList countryList;
  late List<InternationalTeam> team;


  @override
  void initState() {
    // countryList = loadCountries();
    readJson();
    super.initState();
  }

  Future<String> loadCountries() async {
    String jsonString =
        await rootBundle.loadString('jsons/country_team_list.json');
    // final jsonResponse = convert.jsonDecode(jsonString);
    // return CountryList.fromJson(jsonResponse);
    return jsonString;
  }

  Future<String> loadTeam() async {
    String jsonString =
        await rootBundle.loadString('jsons/international_team.json');
    // final jsonResponse = convert.jsonDecode(jsonString) as List<dynamic>;
    // return jsonResponse.map((e) => InternationalTeam.fromJson(e)).toList();
    return jsonString;
  }

  readJson() {
    Future.wait([
      loadCountries(),
      loadTeam(),
    ]).then((List<String> str) {
      final jsonResponse = convert.jsonDecode(str[0]);
      countryList = CountryList.fromJson(jsonResponse);
      // controller.initCountry(CountryList.fromJson(jsonResponse));

      final jsonRes = convert.jsonDecode(str[1]) as List<dynamic>;
      team = jsonRes.map((e) => InternationalTeam.fromJson(e)).toList();
      // controller.initTeam(team);
    });
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
            child: Center(
              child: textGenerator.buildText(
                text: Strings.chooseCountry,
                context: context,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: AllAssets().countriesLogoList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 60,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                var img = AllAssets().countriesLogoList[index];
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PageviewScreen(
                        country: countryList.country[index],
                        team: team[index],
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      img,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/*FutureBuilder<CountryList>(
              future: _countryList,
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.country.length,
                    itemBuilder: (context, index) {
                      var country = snapshot.data!.country[index];
                      print(country);
                      return Column(
                        children: [
                          Text(country.name),
                          // Text(country.internationalTeam.founded.toString()),
                          Image.network(
                              'https://smimgs.com/images/kitteamdesign/kit_1412568413.png'),
                          // Image.network(country.internationalTeam.tShirt[0]),
                        ],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),*/
