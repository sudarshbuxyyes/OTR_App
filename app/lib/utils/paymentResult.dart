import 'package:app/utils/Sizer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class PaymentResult extends StatefulWidget {
  final bool result;
  final String message;
  const PaymentResult(
      {Key? key, required this.result, required String this.message})
      : super(key: key);
  @override
  State<PaymentResult> createState() => _PaymentResultState();
}

class _PaymentResultState extends State<PaymentResult> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            appBar: AppBar(
              title: Text("Payment Result"),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Stack(children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                        false, // start again as soon as the animation is finished
                    colors: const [
                      Colors.white70,
                      Colors.orange,
                      Colors.amber,
                    ], // manually specify the colors to be used
                    // define a custom shape/path.
                  ),
                ),
                Center(
                    child: InkWell(
                  onTap: () {
                    if (widget.result) {
                      _controllerCenter.play();
                    }
                    if (_controllerCenter.state ==
                        ConfettiControllerState.stopped) {
                      Navigator.pop(context);
                    }
                    ;
                  },
                  child: Container(
                    height: Sizer.sbh * 50,
                    width: Sizer.sbh * 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizer.sbh * 5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.result
                            ? Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                                size: Sizer.sbh * 20,
                              )
                            : Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                                size: Sizer.sbh * 20,
                              ),
                        SizedBox(
                          height: Sizer.sbh * 2,
                        ),
                        Text(
                          widget.message,
                          style: TextStyle(
                              fontSize: Sizer.fsm * 1.5,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )),
              ])
            ]))));
  }
}
