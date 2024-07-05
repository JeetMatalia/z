import 'package:flutter/material.dart';

import '../packages/custom_check_box_widget.dart';
import '../packages/custom_radio_button_widget.dart';

enum Color { blue, red, yellow }

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  bool? isChecked = true;
  late Color? _Color = Color.blue;
  bool? _lights = true;
  bool favorite = false;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ======================================
            Text('Check Box',
                style: Theme.of(context).textTheme.headlineMedium),

            // Default check box left to right
            CustomCheckboxListTile(
              title: const Text('Default Checkbox'),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
              tristate: true,
            ),

            CustomCheckboxListTile(
              title: const Text('Error Checkbox'),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
              isError: true,
              tristate: true,
            ),

            CustomCheckboxListTile(
              title: const Text('Disabled Checkbox'),
              value: isChecked,
              onChanged: null,
              isError: true,
              tristate: true,
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Radio Button',
                style: Theme.of(context).textTheme.headlineMedium),

            // Default radio button left to right
            // Color? _Color,

            CustomRadioListTile<Color>(
              title: const Text('Blue'),
              //value: Colors.blue,
              groupValue: _Color,
              onChanged: (Color? value) {
                setState(() {
                  _Color = value;
                });
              },
              value: Color.blue,
            ),

            CustomRadioListTile<Color>(
              title: const Text('Red'),
              //value: Colors.red,
              groupValue: _Color,
              onChanged: (Color? value) {
                setState(() {
                  _Color = value;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
              value: Color.red,
            ),

            CustomRadioListTile<Color>(
              title: const Text('Yellow'),
              //value: Colors.yellow,
              groupValue: _Color,
              onChanged: null, value: Color.yellow,
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Switch', style: Theme.of(context).textTheme.headlineMedium),

            // Switch right to left
            SwitchListTile(
              title: const Text('Lights'),
              value: _lights!,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),

            // Switch left to right
            SwitchListTile(
              title: const Text('Lights'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _lights!,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Date Picker',
                style: Theme.of(context).textTheme.headlineMedium),

            // Date picker
            FilledButton.tonal(
              child: const Text('Show Date Picker'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );
              },
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Time Picker',
                style: Theme.of(context).textTheme.headlineMedium),

            // Time picker
            FilledButton.tonal(
              child: const Text('Show Time Picker'),
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Chip', style: Theme.of(context).textTheme.headlineMedium),

            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                // Default chip
                const Chip(label: Text('Default')),

                // Pill shaped chip
                Chip(
                  label: const Text('Border Radius'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),

                // Action chip
                ActionChip(
                  avatar:
                      Icon(favorite ? Icons.favorite : Icons.favorite_border),
                  label: const Text('Save to favorites'),
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                ),
              ],
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Popup Menu',
                style: Theme.of(context).textTheme.headlineMedium),

            // Popup menu
            PopupMenuButton(
              position: PopupMenuPosition.over,
              initialValue: _Color,
              onSelected: (Color c) {
                setState(() {
                  _Color = c;
                });
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: Color.blue,
                  child: Text('Blue'),
                ),
                const PopupMenuItem(
                  value: Color.red,
                  child: Text('Red'),
                ),
                const PopupMenuItem(
                  value: Color.yellow,
                  child: Text('Yellow'),
                ),
              ],
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // ======================================
            Text('Slider', style: Theme.of(context).textTheme.headlineMedium),

            // Slider
            Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 1,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
