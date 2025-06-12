import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Öll störf',
  'Skrifstofustörf',
  'Iðnaðarstörf',
  'Sérfræðistörf',
];

class JobDropdownButton extends StatefulWidget {
  const JobDropdownButton({super.key});

  @override
  State<JobDropdownButton> createState() => _JobDropdownButtonState();
}

class _JobDropdownButtonState extends State<JobDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(34),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      onChanged: (String? value) => setState(() => dropdownValue = value!),
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 14)),
        );
      }).toList(),
    );
  }
}
