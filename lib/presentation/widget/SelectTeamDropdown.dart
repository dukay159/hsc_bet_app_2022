import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

typedef OnChangeCallback = void Function(dynamic value);

class SelectTeamDropdown extends StatefulWidget {
  SelectTeamDropdown({Key? key, required this.onChanged}) : super(key: key);

  final OnChangeCallback onChanged;

  @override
  State<SelectTeamDropdown> createState() => _SelectTeamDropdownState();
}

class _SelectTeamDropdownState extends State<SelectTeamDropdown> {
  static const List<String> list = <String>[
    'One',
    'Two',
    'Three',
    'Four',
    'Tw3o',
    'Thre3e',
    'Fou3r',
    'Two4',
    'T5ree',
    'Fou6r',
    'Tw7o',
    'Three8',
    'Fo9ur',
    'Tw0o',
    'Three-',
    'Fou=r'
  ];

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: const Text(
        '- Enter team -',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      icon: const Icon(Icons.arrow_downward),
      dropdownColor: const Color.fromARGB(255, 93, 34, 59),
      elevation: 20,
      style: const TextStyle(color: Colors.white),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
        widget.onChanged(value);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}