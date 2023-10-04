import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> with CodeAutoFill{
  TextEditingController otpCtr = TextEditingController();



  @override
  void codeUpdated() {
    print("Update code $code");
    if(mounted) {
      setState(() {
        otpCtr.text = code ?? '';
        print("codeUpdated");
      });
    }
  }

  @override
  void initState() {
    // SmsAutoFill().listenForCode;
    listenForCode();
    print("OTP listen Called");
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await cancel();
    await unregisterListener();
    print("unregisterListener");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: TextField(
                controller: otpCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Otp",
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
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
