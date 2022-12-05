import 'package:bet_app/repo/votes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef OnChangeCallback = void Function(dynamic value);

class SelectIdDropdown extends StatefulWidget {
  SelectIdDropdown({Key? key, required this.onChanged}) : super(key: key);
  final OnChangeCallback onChanged;

  @override
  State<SelectIdDropdown> createState() => _SelectIdDropdownState();
}

class _SelectIdDropdownState extends State<SelectIdDropdown> {
  List<QueryDocumentSnapshot<Object?>> list = [];
  String? dropdownValue;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    final DataRepository repository = DataRepository();
    repository.getid().then((value) => setState(() {
      list = value;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: const Text(
          '- Enter ID -',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        dropdownColor: const Color.fromARGB(255, 93, 34, 59),
        elevation: 20,
        style: const TextStyle(color: Colors.white),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.onChanged(value);
        },
        items: list.map<DropdownMenuItem<String>>((QueryDocumentSnapshot value) {
          Map<String, dynamic> data =
          value.data()! as Map<String, dynamic>;
          return DropdownMenuItem<String>(
            value: value.id,
            child: Text('${DateFormat.d().format(data['timematches'].toDate())}/${DateFormat.M().format(data['timematches'].toDate())} ${data['team1']} - ${data['team2']}'),
          );
        }).toList(),
      ),
    );
  }
}
