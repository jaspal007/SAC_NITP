import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/resources/dept_info_card.dart';
import 'package:sac_nitp/resources/team_info_card.dart';
import 'utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
List<String> games = _globalVariable.getCoord();
List<String> department = _globalVariable.getTeams();

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Text(
                'Sports',
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                'Department',
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return MyTeamCard(game: games[index]);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: department.length,
                itemBuilder: (context, index) {
                  return MyDeptCard(dept: department[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
