import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  TextEditingController otpCtr = TextEditingController();



  // @override
  // void codeUpdated() {
  //   print("Update code $code");
  //   setState(() {
  //     print("codeUpdated");
  //   });
  // }

  @override
  void initState() {
    SmsAutoFill().listenForCode;
    print("OTP listen Called");
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: PinFieldAutoFill(
                controller: otpCtr,
                codeLength: 4,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Verify OTP")),
          ],
        ),
      ),
    );
  }
}
