import 'package:e_chipta/pages/payment_status_page.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:flutter/material.dart';

import '../injector_container.dart';
import '../repository/auth_repo.dart';
import '../utils/color.dart';

enum PaymentMethod { Click, Account, AlifNasiya, CreditCard }

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.Click;


  var isLoading = true;

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



  @override
  void initState() {

    super.initState();
  }

  Future<void> _payForTicket() async {
    setLoading();
    final result = await sl<ApiRepository>().ticketPayment(matchId: 1, sector: '1A', row: 1, seat: 1, paymentType: 'balance');
    setState(() {
      if (result.isRight) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("To'lov muvaffaqqiyatli amalga oshirildi")));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("To'lov qilishda xatolik bo'ldi")));

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: txtFieldBack,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          "To'lov qilish",
          style: TextStyle(
              fontSize: height * .022,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins'),
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
        // Wrap content to avoid overflow on small screens
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .09, vertical: height * .05),
          child: Column(
            children: [
              Text(
                "To'lov usulini tanlang",
                style: TextStyle(
                    fontSize: height * .022,
                    fontWeight: FontWeight.bold,
                    color: grey,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(height: height * .02),
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
                height: height * .1,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: 60,
                        height: 50,
                        child: Image.asset('assets/images/splash1.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Kartadan to'lov qilish"),
                        Text("****0625"),
                      ],
                    ),
                    Radio<PaymentMethod>(
                      value: PaymentMethod.CreditCard,
                      groupValue: _selectedPaymentMethod,
                      onChanged: (PaymentMethod? newValue) {
                        setState(() {
                          _selectedPaymentMethod = newValue!;
                        });
                      },
                    ),
                    // Text(
                    //   label,
                    //   style: TextStyle(
                    //     fontSize: MediaQuery.of(context).size.height * .018,
                    //     fontFamily: 'Poppins',
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
                height: height * .1,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: 60,
                        height: 50,
                        child: Image.asset('assets/images/splash1.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Profil balansi orqali to'lash"),
                        Text("Balans"),
                        Text("500 000uzs"),
                      ],
                    ),
                    Radio<PaymentMethod>(
                      value: PaymentMethod.Account,
                      groupValue: _selectedPaymentMethod,
                      onChanged: (PaymentMethod? newValue) {
                        setState(() {
                          _selectedPaymentMethod = newValue!;
                        });
                      },
                    ),
                    // Text(
                    //   label,
                    //   style: TextStyle(
                    //     fontSize: MediaQuery.of(context).size.height * .018,
                    //     fontFamily: 'Poppins',
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
              Container(

                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
                height: height * .1,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: 60,
                        height: 50,
                        child: Image.asset('assets/images/splash1.png'),
                      ),
                    ),
                    Text("Click",style: getRegularTextStyle(height*.03,color: Colors.white),),
                    Radio<PaymentMethod>(
                      value: PaymentMethod.Click,
                      activeColor: Colors.green,
                      groupValue: _selectedPaymentMethod,
                      onChanged: (PaymentMethod? newValue) {
                        setState(() {
                          _selectedPaymentMethod = newValue!;
                        });
                      },
                    ),
                    // Text(
                    //   label,
                    //   style: TextStyle(
                    //     fontSize: MediaQuery.of(context).size.height * .018,
                    //     fontFamily: 'Poppins',
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
                height: height * .1,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                        width: 60,
                        height: 50,
                        child: Image.asset('assets/images/splash1.png'),
                      ),
                    ),
                    Text("alif nasiya",style: getRegularTextStyle(height*.03,),),
                    Radio<PaymentMethod>(
                      value: PaymentMethod.AlifNasiya,
                      activeColor: Colors.green,
                      groupValue: _selectedPaymentMethod,
                      onChanged: (PaymentMethod? newValue) {
                        setState(() {
                          _selectedPaymentMethod = newValue!;
                        });
                      },
                    ),
                    // Text(
                    //   label,
                    //   style: TextStyle(
                    //     fontSize: MediaQuery.of(context).size.height * .018,
                    //     fontFamily: 'Poppins',
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: height * .04),
              ElevatedButton(
                onPressed: () {
                  _payForTicket();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PaymentStatusPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  minimumSize: Size(
                    width,
                    height * .06,
                  ),
                ),
                child: isLoading?CircularProgressIndicator(color: Colors.white,): Text(
                  "To'lov qilish",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    fontSize: height * .02,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
