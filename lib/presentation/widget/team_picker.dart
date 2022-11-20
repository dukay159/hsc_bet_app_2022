import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TeamPicker extends StatefulWidget {
  const TeamPicker({Key? key}) : super(key: key);

  @override
  State<TeamPicker> createState() => _TeamPickerState();
}

class _TeamPickerState extends State<TeamPicker> {
  var fontstyle = const TextStyle(fontSize: 20, color: Colors.white);

  var fontstyleTeam = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 20, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Team 1',
            style: fontstyleTeam,
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2.0, color: Color(0xFFFF7F7F7F)),
              // color: Color.fromARGB(255, 193, 30, 79)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: fontstyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Align(
                          alignment: AlignmentDirectional.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Select Team',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        items: items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected =
                                selectedItems.contains(item);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? selectedItems.remove(item)
                                        : selectedItems.add(item);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    setState(() {});
                                    //This rebuilds the dropdownMenu Widget to update the check mark
                                    menuSetState(() {});
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        _isSelected
                                            ? const Icon(
                                            Icons.check_box_outlined)
                                            : const Icon(
                                            Icons.check_box_outline_blank),
                                        const SizedBox(width: 16),
                                        Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                        value:
                        selectedItems.isEmpty ? null : selectedItems.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return items.map(
                                (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  selectedItems.join(', '),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Image:',
                      style: fontstyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: Image.asset(
                        'assets/flags_wc/Brazil.png',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              'Team 2',
              style: fontstyleTeam,
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2.0, color: Color(0xFFFF7F7F7F)),
              // color: Color.fromARGB(255, 193, 30, 79)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: fontstyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Align(
                          alignment: AlignmentDirectional.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Select Team',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        items: items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected =
                                selectedItems.contains(item);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? selectedItems.remove(item)
                                        : selectedItems.add(item);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    setState(() {});
                                    //This rebuilds the dropdownMenu Widget to update the check mark
                                    menuSetState(() {});
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        _isSelected
                                            ? const Icon(
                                            Icons.check_box_outlined)
                                            : const Icon(
                                            Icons.check_box_outline_blank),
                                        const SizedBox(width: 30),
                                        Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                        value:
                        selectedItems.isEmpty ? null : selectedItems.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return items.map(
                                (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  selectedItems.join(', '),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Image:',
                      style: fontstyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: Image.asset(
                        'assets/flags_wc/Brazil.png',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 130,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () => {}, child: Text('SAVE'))),
                SizedBox(
                    width: 130,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () => {}, child: Text('CANCEL'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}