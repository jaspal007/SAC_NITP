List<String> games = <String>[
  'ALL',
  'TABLE TENNIS',
  'CHESS',
  'ATHLETICS',
  'BASKETBALL',
  'FOOTBALL',
  'VOLLEYBALL',
  'CRICKET',
  'POWER SPORTS',
  'KABADDI(W)',
  'KABADDAI(M)',
  'BADMINTON'
];

List<String> teams = <String>[
  'CSE',
  'Arch',
  'Int. MSc',
  'Civil',
  'Women',
  'Mech',
  'EE',
  'ECE'
];

class GlobalVariable {
  List<String> getGames() => games;
  void setGames(List<String>? value) => games = value!;
  List<String> getTeams() => teams;
  void setTeams(List<String>? value) => teams = value!;
}
