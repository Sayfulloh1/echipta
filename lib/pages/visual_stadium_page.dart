
import 'package:e_chipta/model/games_response.dart';
import 'package:e_chipta/model/ticket_info.dart';
import 'package:e_chipta/pages/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
// import 'package:panorama/panorama.dart';

import '../injector_container.dart';
import '../repository/auth_repo.dart';
import '../utils/color.dart';

class VisualStadiumPage extends StatefulWidget {
  const VisualStadiumPage({super.key, required  this.game, required this.sectorId, required this.seat, required this.row});
  final Match game;
  final String sectorId;
  final String row;
  final String seat;

  @override
  State<VisualStadiumPage> createState() => _VisualStadiumPageState();
}

class _VisualStadiumPageState extends State<VisualStadiumPage> {
  var isLoading = false;

  TicketInfo? ticketInfo;

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

  Future<void> _getTicketInfo() async {
    setLoading();
    final result = await sl<ApiRepository>()
        .getTicketInfo(matchId: widget.game.id, sector: widget.sectorId, row: widget.row, seat: widget.seat);
    setState(() {
      if (result.isRight) {
        ticketInfo = result.right;
      }
    });
  }

  @override
  void initState() {
    _getTicketInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          'Vizual ko\'rinish',
          style: TextStyle(
              fontSize: height * .02,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white),
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
      body: Stack(
        children: [
          /*Positioned(
            top: height * .1,
            left: width * .1,
            child: Image.asset('assets/images/panorama.png'),
          ),*/
          Center(
            child: PanoramaViewer(
              child: Image.network(ticketInfo!.panorama),
            ),
          ),
         /* Positioned(
            top: height * .02,
            left: width * .1,
            child: Image.network(ticketInfo!.panorama),
          ),*/
          Positioned(
            bottom: height * .01,
            left: width * .1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width * .8, height * .07),
                backgroundColor: primary,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentScreen()));
              },
              child: Text(
                "Sotib olish",
                style: TextStyle(
                    fontSize: height * .02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: height * .2,
            left: width * .1,
            child: Column(
              children: [
                Container(
                  width: width * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Sektor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.sectorId,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Qator',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.row,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Joy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.seat,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * .8,
                  alignment: Alignment.center,
                  child: Text(
                    "Joyidan o'yin ko'rinishi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: height * .03,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height * .13,
            left: width * .15,
            child: Image.asset('assets/images/360.png'),
          ),
        ],
      ),
    );
  }
}
