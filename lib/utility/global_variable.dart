final games = <String, String>{
  'ALL': 'lib/assets/space.jpg',
  'TABLE TENNIS': 'lib/assets/table_tennis.jpg',
  'CHESS': 'lib/assets/chess.jpg',
  'ATHLETICS': 'lib/assets/athletics.jpg',
  'BASKETBALL': 'lib/assets/basketball.jpg',
  'FOOTBALL': 'lib/assets/football.jpg',
  'VOLLEYBALL': 'lib/assets/volleyball.jpg',
  'CRICKET': 'lib/assets/cricket.jpg',
  'POWER SPORTS': 'lib/assets/power_sports.jpg',
  'KABADDI(W)': 'lib/assets/kabaddi.jpg',
  'KABADDI(M)': 'lib/assets/kabaddi.jpg',
  'BADMINTON': 'lib/assets/badminton.jpg',
};

final coord = <String, String>{
  'TABLE TENNIS': 'Gautum Rishi',
  'CHESS': 'Kaushik Pattinaik',
  'ATHLETICS': 'Vamsi Pendliv',
  'BASKETBALL': 'Avinash Prem',
  'FOOTBALL': 'Sameer Nautial',
  'VOLLEYBALL': 'MD Nawab Azad',
  'CRICKET': 'Ankit Mahto',
  'POWER SPORTS': 'Vijay Sharma',
  'KABADDI(W)': 'Priya Singh',
  'KABADDI(M)': 'Rajaram',
  'BADMINTON': 'Vishal Kumar',
};

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
  final sports = games.keys.toList(growable: false);
  getGames() => sports;
  Map<String, String> getImages() => games;
  final lead = coord.keys.toList(growable: false);
  getCoord() => lead;
  Map<String, String> getCoordNames() => coord;
  //void setGames(List<String>? value) => games.keys.toList() = value!;
  List<String> getTeams() => teams;
  void setTeams(List<String>? value) => teams = value!;
}
