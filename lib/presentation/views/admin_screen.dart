import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
          flexibleSpace: const Image(
            image: AssetImage('assets/images/bgr_worldcup.png'),
            fit: BoxFit.cover,
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 93, 34, 59),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Row(
                    children: [
                      Text('Time: '),
                      ElevatedButton(
                          // onPressed: pickDateTime(),
                          onPressed: () async {
                            final date = await pickDate();
                            if (date == null) return;
                            final newDateTime = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              dateTime.hour,
                              dateTime.minute,
                            );
                            setState(() => dateTime = newDateTime);
                          },
                          child: Text(
                              '${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes')),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final time = await pickTime();
                            if (time == null) return;
                            final newDateTime = DateTime(
                                dateTime.year,
                                dateTime.month,
                                dateTime.day,
                                time.hour,
                                time.minute);
                            setState(() => dateTime = newDateTime);
                          },
                          child: Text('$hours:$minutes'))
                    ],
                  ),
                ),
                Text('Đội 1'),
                Container(
                  child: Column(children: [
                    Row(
                      children: [Text('Tên: '), Text('âssadasd')],
                    ),
                    Row(
                      children: [Text('Tên: '), Text('âssadasd')],
                    )
                  ]),
                ),
                Text('Đội 2'),
                Container(
                  child: Column(children: [
                    Row(
                      children: [Text('Tên: '), Text('âssadasd')],
                    ),
                    Row(
                      children: [Text('Tên: '), Text('âssadasd')],
                    )
                  ]),
                )
              ]),
            )));
  }

  // Future! pickDateTime() async {
  //   DateTime? date = await pickDate();
  //   if (date == null) return;
  //   TimeOfDay? time = await pickTime();
  //   if (time == null) return;
  //   final dateTime =
  //       DateTime(date.year, date.month, date.day, time.hour, time.minute);
  //   setState(() => this.dateTime = dateTime);
  // }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
