import 'package:bet_app/presentation/components/default_button.dart';
import 'package:bet_app/presentation/views/login_screen.dart';
import 'package:bet_app/presentation/views/vote_result_screen.dart';
import 'package:flutter/material.dart';

class ButtonDone extends StatelessWidget {
  final String? email;

  const ButtonDone({Key? key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 15);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_done.jpg'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -20),
            blurRadius: 20,
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: SizedBox(
                  width: 190,
                  child: DefaultButton(
                    text: "Done",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VoteResultScreen(email: email)));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
