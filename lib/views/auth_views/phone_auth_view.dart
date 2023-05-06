import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({super.key});

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  final TextEditingController _countryCodeController =
      TextEditingController(text: "+91");

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool _sendOtp = false;
  bool _isLoading = false;

  _sendOtpClicked() {
    setState(() {
      _isLoading = true;
      Future.delayed(
        const Duration(
          seconds: 2,
        ),
      ).then((value) {
        setState(() {
          _isLoading = false;
          _sendOtp = true;
        });
      });
    });
  }

  _changePhoneNumber() {
    setState(() {
      _isLoading = false;
      _sendOtp = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to ',
                        style: GoogleFonts.montserrat(
                          color: Colors.black45,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'CMS',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      !_sendOtp
                          ? "For using our services, you need to login or signup using your phone number."
                          : "Enter the 6 digit otp sent on your phone number to continue with the verification",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Visibility(
                          visible: !_sendOtp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "+91",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black45,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    // labelText: 'CC',
                                    // floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                  controller: _countryCodeController,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                flex: 8,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Phone Number...',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black45,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    // labelText: 'Phone Number',
                                    // floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                  controller: _phoneController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: _sendOtp,
                          child: SizedBox(
                            height: 55,
                            child: Pinput(
                              length: 6,
                              closeKeyboardWhenCompleted: true,
                              controller: _otpController,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: !_sendOtp ? 30 : 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            _sendOtpClicked();
                          },
                          child: Visibility(
                            visible: !_sendOtp,
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey,
                              ),
                              child: Center(
                                child: Text(
                                  'Send Otp',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Visibility(
                            visible: _sendOtp,
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey,
                              ),
                              child: Center(
                                child: Text(
                                  'Verify Otp',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => _changePhoneNumber(),
                          child: Visibility(
                            visible: _sendOtp,
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueGrey,
                              ),
                              child: Center(
                                child: Text(
                                  'Change Phone Number',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
