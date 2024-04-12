import 'package:e_chipta/pages/page_navigation.dart';
import 'package:flutter/material.dart';

import '../presentation/styles_manager.dart';
import '../utils/color.dart';

class ChooseClubTeam extends StatefulWidget {
  const ChooseClubTeam({super.key});

  @override
  State<ChooseClubTeam> createState() => _ChooseClubTeamState();
}

class _ChooseClubTeamState extends State<ChooseClubTeam> {
  int _selectedIndex = -1; // Track the selected club index

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                SizedBox(height: height * .05),
                Text(
                  'Jamoangizni tanlang',
                    style: getRegularTextStyle(
                      height * .03,
                    )
                ),
                SizedBox(height: height * .05),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width * .04),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: width * .02,
                      mainAxisSpacing: width * .02,
                      childAspectRatio: .8,
                    ),
                    itemCount: 14,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final isSelected =
                          index == _selectedIndex; // Check for selection
                      return GestureDetector(
                        onTap: () => setState(() => _selectedIndex = index),
                        // Update selection on tap
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: height * .003),
                          width: height * .2,
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * .03),
                            color: isSelected
                                ? primary
                                : greyShade2, // Apply color based on selection
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: width * .1,
                                height: width * .12,
                                child: Image.asset(
                                  'assets/images/teams/neftchi.png',
                                  fit: BoxFit.cover,
                                ),
                                // width: width * .2,
                                // height: height*.11,
                              ),
                              Text(
                                'Neftchi',
                                style: TextStyle(
                                    color: isSelected ? white : primary,fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * .04),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * .5, height * .07),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    if (_selectedIndex != -1) {
                      // Check if a club is selected before navigating
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const MyPages()));
                    } else {
                      // // Handle the case where no club is selected (optional: show a snackbar or dialog)
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Iltimos, jamoa tanlang'),
                      //   ),
                      // );
                    }
                  },
                  child: Text(
                    'Tasdiqlash',
                    style: getRegularTextStyle( height * .02,color: white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
