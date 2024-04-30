import 'dart:convert';

import 'package:e_chipta/pages/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../injector_container.dart';
import '../repository/auth_repo.dart';
import 'auth/create_account.dart';
import 'choose_club_page.dart';


class FindMyNextPage extends StatefulWidget {
  const FindMyNextPage({super.key});

  @override
  State<FindMyNextPage> createState() => _FindMyNextPageState();
}

class _FindMyNextPageState extends State<FindMyNextPage> {
  var isLoading = false;


  void setLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void dismissLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void onCheckUser() async {
    setLoading();
    final data = await sl<ApiRepository>().getMe();

      dismissLoading();
      // Retrieve is_filed and team from local storage
      final prefs = await SharedPreferences.getInstance();
      final isFiled = prefs.getBool('is_filed');
      final teamJson = prefs.getString('team');

      print(isFiled);
      print(teamJson);


      Map<String, dynamic>? team;



      if (teamJson != null) {
        team = jsonDecode(teamJson); // Decode JSON to Map
      }

      if (isFiled == null) {
        print('is_filed data not found in local storage');
        // Handle case where is_filed is not found in local storage (optional)
        return;
      }

      if (!isFiled) {
        goCreateAccount();
      } else {
        if (team == null) {
          goChooseClub();
        } else {
          goMyPages();
        }
      }


    data.fold(
          (left) {
        print('error left: ${left.message}');
        dismissLoading();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('error: ${left.message}')));
      },(right){}

    );
  }

  @override
  void initState() {
    onCheckUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: isLoading?CircularProgressIndicator():CircularProgressIndicator(),),
    );
  }

  void goCreateAccount() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CreateAccount()),
    );
  }

  void goMyPages() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyPages()),
    );
  }

  void goChooseClub() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ChooseClubTeam()),
    );
  }

}
