import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  var fontstyle = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 40),
      child: Row(
        children: [
          Text('Time: ', style: fontstyle),
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
              child:
                  Text('${dateTime.year}/${dateTime.month}/${dateTime.day}')),
          const SizedBox(
            width: 12,
          ),
          ElevatedButton(
              onPressed: () async {
                final time = await pickTime();
                if (time == null) return;
                final newDateTime = DateTime(dateTime.year, dateTime.month,
                    dateTime.day, time.hour, time.minute);
                setState(() => dateTime = newDateTime);
              },
              child: Text('$hours:$minutes'))
        ],
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  // Future! pickDateTime() async {
  //   DateTime? date = await pickDate();
  //   if (date == null) return;
  //   TimeOfDay? time = await pickTime();
  //   if (time == null) return;
  //   final dateTime =
  //       DateTime(date.year, date.month, date.day, time.hour, time.minute);
  //   setState(() => this.dateTime = dateTime);
  // }

}

//  Text('Đội 1'),
//       Container(
//         child: Column(children: [
//           Row(
//             children: [Text('Tên: '), Text('âssadasd')],
//           ),
//           Row(
//             children: [Text('Tên: '), Text('âssadasd')],
//           )
//         ]),
//       ),
//       Text('Đội 2'),
//       Container(
//         child: Column(children: [
//           Row(
//             children: [Text('Tên: '), Text('âssadasd')],
//           ),
//           Row(
//             children: [Text('Tên: '), Text('âssadasd')],
//           )
//         ]),
//       );