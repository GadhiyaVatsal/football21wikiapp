class CountryList {
  List<Country> country;

  CountryList({required this.country});

  factory CountryList.fromJson(Map<String, dynamic> json) {
    return CountryList(
      country: (json['country'] as List)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Country {
  final String name;
  final int id;
  final List<TopPlayer> topPlayer;
  final List<TopClubs> topClubs;
  final List<AllCups> allCups;

  Country({
    required this.name,
    required this.id,
    required this.allCups,
    required this.topClubs,
    required this.topPlayer,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      id: json['id'],
      allCups: (json['all_cups'] as List)
          .map((e) => AllCups.fromJson(e as Map<String, dynamic>))
          .toList(),
      topPlayer: (json['top_player'] as List)
          .map((e) => TopPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      topClubs: (json['top_clubs'] as List)
          .map((e) => TopClubs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TopPlayer {
  final String name;
  final String club;
  final int rating;

  TopPlayer({
    required this.name,
    required this.club,
    required this.rating,
  });

  factory TopPlayer.fromJson(Map<String, dynamic> json) {
    return TopPlayer(
      name: json['name'],
      club: json['club'],
      rating: json['rating'],
    );
  }
}

class TopClubs {
  final String url;
  final String clubName;
  final String manager;

  TopClubs({
    required this.url,
    required this.clubName,
    required this.manager,
  });

  factory TopClubs.fromJson(Map<String, dynamic> json) {
    return TopClubs(
      url: json['url'],
      clubName: json['club'],
      manager: json['manager'],
    );
  }
}

class AllCups {
  final String name;
  final int year;

  AllCups({required this.name, required this.year});

  factory AllCups.fromJson(Map<String, dynamic> json) {
    return AllCups(
      name: json['name'],
      year: json['year'],
    );
  }
}
