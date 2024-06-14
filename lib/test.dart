import 'package:flutter/material.dart';


class AutocompleteExample extends StatelessWidget {
  final List<String> _options = <String>[
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Eggfruit',
    'Fig',
    'Grape',
    'Honeydew',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }
          return _options.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          print('You just selected $selection');
        },
      ),
    );
  }
}
