class Team {
  List<InternationalTeam> international_team;

  Team({required this.international_team});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      international_team: (json['international_team'] as List)
          .map((e) => InternationalTeam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class InternationalTeam {
  final List<dynamic> tShirt;
  final int id;
  final int founded;
  final String stadium;
  final String location;
  final String manager;

  InternationalTeam({
    required this.tShirt,
    required this.id,
    required this.founded,
    required this.stadium,
    required this.location,
    required this.manager,
  });

  factory InternationalTeam.fromJson(Map<String, dynamic> json) {
    return InternationalTeam(
      tShirt: json['tShirt'],
      id: json['id'],
      founded: json['founded'],
      stadium: json['stadium'],
      location: json['location'],
      manager: json['manager'],
    );
  }
}
