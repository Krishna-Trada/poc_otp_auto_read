import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poc_otp_auto_read/ui/verify_otp.dart';
import 'package:sms_autofill/sms_autofill.dart';

// ignore: must_be_immutable
class SendOTPScreen extends StatelessWidget {
  SendOTPScreen({Key? key}) : super(key: key);

  TextEditingController mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFC2C0C0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: mobileNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Mobile Number",
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  submit(context);
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submit(context) async {
    /// this app signature id is used in the message and it will come with the message.
    String appSignatureID = await SmsAutoFill().getAppSignature;
    print('app signature id is : $appSignatureID');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  VerifyOTPScreen(signatureId: appSignatureID,)),
    );
  }
}
