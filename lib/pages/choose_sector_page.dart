import 'package:e_chipta/pages/choose_seat_page.dart';
import 'package:e_chipta/pages/sector.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interactable_svg/interactable_svg/src/models/region.dart';
import 'package:interactable_svg/interactable_svg/src/widgets/interactable_svg.dart';
import 'package:path_drawing/path_drawing.dart';

class ChooseSectorPage extends StatefulWidget {
  const ChooseSectorPage({super.key});

  @override
  State<ChooseSectorPage> createState() => _ChooseSectorPageState();
}

final GlobalKey<InteractableSvgState> mapKey = GlobalKey();

class _ChooseSectorPageState extends State<ChooseSectorPage> {
  Region? selectedRegion;
  List<Sector> sectors = []; // Declare an empty list of Sector objects

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          'Sektor tanlash',
          style: TextStyle(color: white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: height * .04,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * .15,
              color: red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              width: height * .07,
                              height: height * .07,
                              child: Image.asset(
                                  'assets/images/teams/neftchi.png')),
                          Text(
                            'Neftchi',
                            style: TextStyle(
                              color: white,
                              fontSize: height * .02,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '17:00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * .04,
                              color: white,
                            ),
                          ),
                          Text(
                            '30-mart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * .02,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                              width: height * .07,
                              height: height * .07,
                              child: Image.asset(
                                  'assets/images/teams/neftchi.png')),
                          Text(
                            'Neftchi',
                            style: TextStyle(
                              color: white,
                              fontSize: height * .02,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: grey,
                      ),
                      Text(
                        'Bobur Arena',
                        style: TextStyle(
                          color: white,
                          fontSize: height * .02,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (selectedRegion != null) {
                  mapKey.currentState?.toggleButton(selectedRegion!);
                }
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ChooseSeatPage(
                //               sectorId: null,
                //             )));
              },
              child: Container(
                width: width,
                height: height * .4,
                child: InteractiveViewer(
                  scaleEnabled: true,
                  panEnabled: true,
                  constrained: true,
                  child: InteractableSvg(
                    svgAddress: "assets/svg/floor_map.svg",
                    onChanged: (region) {
                      setState(() {
                        selectedRegion = region;
                      });
                    },
                    width: double.infinity,
                    height: double.infinity,
                    toggleEnable: true,
                    isMultiSelectable: false,
                    dotColor: Colors.black,
                    selectedColor: Colors.red.withOpacity(0.5),
                    strokeColor: Colors.blue,
                    unSelectableId: "bg",
                    centerDotEnable: true,
                    centerTextEnable: true,
                    strokeWidth: 2.0,
                    centerTextStyle:
                        const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height*.05 ,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    color: teal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Birinchi',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.lightGreenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ikkinchi',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: primary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Uchinchi',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'VIP',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FAN',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: red,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Mehmon',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _getClippedImage({
//   required Clipper clipper,
//   required Color color,
//   required Sector sector,
//   final Function(Sector sector)? onSectorSelected,
// }) {
//   return ClipPath(
//     clipper: Clipper(svgPath: 'assets/svg/stadion.svg'), // Update svgPath here
//     child: GestureDetector(
//       onTap: () => onSectorSelected?.call(sector),
//       child: Container( // Adjust size constraints if needed
//           color: color,
//           child: Container(color: Colors.blue,width: 200,height: 200,)// Your sector-specific content (replace with your layout)
//       ),
//     ),
//   );
// }