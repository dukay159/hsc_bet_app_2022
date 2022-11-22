import 'package:flutter/material.dart';
typedef OnChangeCallback = void Function(dynamic value);
class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key, required this.onChanged}) : super(key: key);
  final OnChangeCallback onChanged;
  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  var fontstyle = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  DateTime dateTime = DateTime.now();

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
                widget.onChanged(newDateTime);
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
                widget.onChanged(newDateTime);
              },
              child: Text('$hours:$minutes'))
        ],
      ),
    );
  }

  Future<DateTime?> pickDate() =>
      showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() =>
      showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
