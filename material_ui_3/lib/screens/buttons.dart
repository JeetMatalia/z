import 'package:flutter/material.dart';
import 'package:material_ui_3/packages/button_widgets.dart';

import '../packages/floating_action_button_widget.dart';
import '../packages/icon_widget.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Text Buttons
            Text('Text Buttons',
                style: Theme.of(context).textTheme.headlineMedium),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                // Elevated button
                PrimaryButton(
                    text: "Elevated Button",
                    onPressed: () {},
                    type: ButtonType.elevated),

                // Filled button
                PrimaryButton(
                    text: "filled Button",
                    onPressed: () {},
                    type: ButtonType.filled),

                // Tonal button
                PrimaryButton(
                    text: "tonal Button",
                    onPressed: () {},
                    type: ButtonType.tonal),

                // Outlined button
                PrimaryButton(
                    text: "outlined Button",
                    onPressed: () {},
                    type: ButtonType.outlined),

                // Text button
                PrimaryButton(
                    text: "text Button",
                    onPressed: () {},
                    type: ButtonType.text),
              ],
            ),

            const SizedBox(height: 20),

            // Icon + Text Buttons
            Text('Icon + Text Buttons',
                style: Theme.of(context).textTheme.headlineMedium),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                // Icon elevated button
                PrimaryButton(
                  text: "Eleveted Button",
                  onPressed: () {},
                  type: ButtonType.elevated,
                  icon: const Icon(Icons.radio_button_checked),
                ),

                // Icon filled button
                PrimaryButton(
                  text: "filled Button",
                  onPressed: () {},
                  type: ButtonType.filled,
                  icon: const Icon(Icons.radio_button_checked),
                ),

                // Icon tonal button
                PrimaryButton(
                  text: "tonal Button",
                  onPressed: () {},
                  type: ButtonType.tonal,
                  icon: const Icon(Icons.radio_button_checked),
                ),

                // Icon outlined button

                PrimaryButton(
                  text: "outlined Button",
                  onPressed: () {},
                  type: ButtonType.outlined,
                  icon: const Icon(Icons.radio_button_checked),
                ),

                // Icon text button
                PrimaryButton(
                  text: "text Button",
                  onPressed: () {},
                  type: ButtonType.text,
                  icon: const Icon(Icons.radio_button_checked),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Disabled Buttons

            Text('Disabled Buttons',
                style: Theme.of(context).textTheme.headlineMedium),
            const Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                // Disabled elevated button
                PrimaryButton(
                    text: "Elevated Button",
                    onPressed: null,
                    type: ButtonType.elevated),

                // Disabled filled button
                PrimaryButton(
                    text: "Filled Button",
                    onPressed: null,
                    type: ButtonType.filled),

                // Disabled tonal button
                PrimaryButton(
                    text: "Tonal Button",
                    onPressed: null,
                    type: ButtonType.tonal),

                // Disabled outlined button
                PrimaryButton(
                    text: "Outlined Button",
                    onPressed: null,
                    type: ButtonType.outlined),

                // Disabled text button
                PrimaryButton(
                    text: "Text Button", onPressed: null, type: ButtonType.text)
              ],
            ),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // Floating Action Buttons
            Text('Floating Action Buttons',
                style: Theme.of(context).textTheme.headlineMedium),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              // Small floating action button


              CustomFAB(
                onPressed: () {},
                child: Icon(Icons.add),
                size: FloatingActionButtonSize.small,
              ),

              CustomFAB(
                onPressed: () {},
                child: Icon(Icons.add),
              ),

              CustomFAB(
                onPressed: () {},
                child: Icon(Icons.add),
                size: FloatingActionButtonSize.large,
              )

            ]),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // Icon Buttons
            Text('Icon Buttons',
                style: Theme.of(context).textTheme.headlineMedium),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              // Icon button
              CustomIconButton(
                icon: Icons.settings,
                onPressed: () {},
                type: IconButtonType.normal,
              ),

              CustomIconButton(
                icon: Icons.settings,
                onPressed: () {},
                type: IconButtonType.filled,
              ),

              CustomIconButton(
                icon: Icons.settings,
                onPressed: () {},
                type: IconButtonType.filledTonal,
              ),

              CustomIconButton(
                icon: Icons.settings,
                onPressed: () {},
                type: IconButtonType.outlined,
              )
            ]),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Disabled icon button
                  CustomIconButton(
                    icon: Icons.settings,
                    onPressed: null,
                    type: IconButtonType.normal,
                  ),

                  CustomIconButton(
                    icon: Icons.settings,
                    onPressed: null,
                    type: IconButtonType.filled,
                  ),

                  CustomIconButton(
                    icon: Icons.settings,
                    onPressed: null,
                    type: IconButtonType.filledTonal,
                  ),

                  CustomIconButton(
                    icon: Icons.settings,
                    onPressed: null,
                    type: IconButtonType.outlined,
                  )
                ]),

            const Divider(height: 12),
            const SizedBox(height: 20),

            // Segmented Buttons
            Text('Segmented Buttons',
                style: Theme.of(context).textTheme.headlineMedium),

            // Single choice segmented buttons
            const SingleChoice(),
            const SizedBox(height: 12),

            // Multi choice segmented buttons
            const MultipleChoice(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Single choice segmented buttons
enum Calendar { week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.week;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }
}

// Multi choice segmented buttons
enum Sizes { small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text('L')),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
