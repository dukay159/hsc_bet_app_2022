import 'package:flutter/material.dart';

class NewButton extends StatefulWidget {
  const NewButton({Key? key}) : super(key: key);

  @override
  State<NewButton> createState() => _NewButtonState();
}

class _NewButtonState extends State<NewButton> {
  int isButtonPressed = 1;
  var fontstyle = const TextStyle(
      fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white);

  var fontstyleTeam = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            SizedBox(
                width: 60,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isButtonPressed = 0;
                    });
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                          // color: isButtonPressed == 0
                          //     ? Colors.blue[200]
                          //     : Colors.red[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: isButtonPressed == 0
                              ? [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 250, 240, 240),
                                    offset: const Offset(6, 2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  const BoxShadow(
                                    color: Color.fromARGB(255, 250, 240, 240),
                                    offset: Offset(-6, -2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  )
                                ]
                              : []),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/flags_wc/Japan.png"),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Japan', style: fontstyleTeam),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 60,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isButtonPressed = 1;
                    });
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                          // color: isButtonPressed == 1
                          //     ? Colors.blue[200]
                          //     : Colors.red[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: isButtonPressed == 1
                              ? [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 250, 240, 240),
                                    offset: const Offset(6, 2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  const BoxShadow(
                                    color: Color.fromARGB(255, 250, 240, 240),
                                    offset: Offset(-6, -2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  )
                                ]
                              : []),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/x-mark-5-64.png"),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(' ', style: fontstyleTeam),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: 60,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isButtonPressed = 2;
                    });
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                          // color: isButtonPressed == 2
                          //     ? Colors.blue[200]
                          //     : Colors.red[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: isButtonPressed == 2
                              ? [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 250, 240, 240),
                                    offset: const Offset(6, 2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  const BoxShadow(
                                    color: Color.fromARGB(255, 250, 240, 240),
                                    offset: Offset(-6, -2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  )
                                ]
                              : []),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/flags_wc/Brazil.png"),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Brazil', style: fontstyleTeam),
            ),
          ],
        ),
      ]),
    );
  }
}
