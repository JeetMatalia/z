
# Lazy programming
Write what you need and no more, but when you write it, do it right.

Avoid implementing features you don’t need. You can’t design a feature without knowing what the constraints are. Implementing features "for completeness" results in unused code that is expensive to maintain, learn about, document, test, etc.

# Limit the length of lines
Lines of code should not exceed 80 characters.

# Use the default dart formatter
Use the default dart formatter and keep the default settings

# Limit the depth of the widget tree
You should not have more than six nested widget and no more than three nested layout widgets inside the widget.
Widgets considered as layout widget are widget that layout a list of child. The most common are:
Stack, Flexible, Row, Column, Wrap, ListView, etc.. 

When too many widgets are nested together it became difficult to read the code.
In such situation, split your widget into smaller ones.

```dart
// GOOD
class QrScanner {

  ...

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Camera(),
        _QrOverlay(
          cameraButton: _QrButton(
            text: context.l10n.qr_scanner_flash_button,
            icon: effectiveFlashIcon,
            onPressed: _handleFlashPressed,
          ),
          flashButton: _QrButton(
            text: context.l10n.qr_scanner_flash_button,
            icon: effectiveFlashIcon,
            onPressed: _handleFlashPressed,
          ),
        ),
      ],
    ),
  }
}

class _QrOverlay { ... }
class _QrButton { ... }
```

# Only exposes what's necessary
In dart, everything that's start with a leading underscore is private.
Take advantage of this feature to hide private widgets from the public API.

This is especially true when splitting widgets. When the only purpose of a widget is to reduce the complexity of a bigger widget then it should be private.

# Don't use curly bracket function inside the widget tree
use lambda or use a method instead
```dart
// Bad
MyButton(
  onPressed: () {
    doSomething();
  }
),

// Good
MyButton(
  onPressed: doSomething,
),
MyButton(
  onPressed: () => doSomethingWithParam(context),
)
```

# Don't put any logic in widget tree
You should extract as much logic as possible from the widget tree.

## Define methods or local functions to handle widgets callback

```dart
// BAD
ElevatedButton(
  onPressed: () {
    //do some stuff
  }
);

// GOOD
ElevatedButton(
  onPressed: _handleOnButtonPressed,
);
```

## Set variables at the beginning of the build before returning widgets

```dart
// BAD
Widget build(BuildContext context) {
  return Container(
    color: someCondition 
      ? Theme.of(context).colorScheme.primaryContainer
      : Theme.of(context).colorScheme.secondaryContainer,
    child: Text(
      'Logicfull',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: someCondition
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary,
      ),
    ),
  );
}

// GOOD
Widget build(BuildContext context) {
  final theme =  Theme.of(context); 
  
  final backgroundColor = someCondition 
      ? theme.colorScheme.primaryContainer
      : theme.colorScheme.secondaryContainer;

  final foregroundColor = someCondition
      ? theme.colorScheme.primary
      : theme.colorScheme.secondary;

  final textStyle = theme.textTheme.headlineMedium?.copyWith(
    color: foregroundColor,
  );

  return Container(
    color: backgroundColor,
    child: Text(
      'Logicless',
      style: textStyle,
    ),
  );
}
```

## Use dart declarative/functional programming feature
Dart functional and declarative feature can greatly improve the readability your code.

```dart
// GOOD
Column(
  children: entries
              .where((entry) => entry.shouldBeDisplayed)
              .map((entry) => DisplayEntry(entry))
              .toList(),
);

class _DisplayEntry extends StatelessWidget {
  _DisplayEntry(this.data);

  final Data data;

  ...
}
```

Dart also feature iterable sugar syntax that can be very expressive but you should keep it simple.
If you need to use complex computation then and use a variable instead and compute it's outside the widget tree.
```dart
// GOOD
Column(
  children: [
    if (header != null) header! else _FallbackHeader(),
    ...entries,
  ]
);

// BAD
Column(
  children: [
    if (header != null && (someProperties == true || someValue > 0))
      header!
    else _FallbackHeader(
      backgroundColor: color,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        height: height,
      ) 
    ),
    ...entries,
  ]
);

// GOOD
// compute the header value based on some properties
final Widget effectiveHeader;
if (header != null && (someProperties == true || someValue > 0)) {
  effectiveHeader = header;
} else {
  effectiveHeader = _FallbackHeader(
    backgroundColor: color,
    textStyle: TextStyle(
      color: Theme.of(context).colorScheme.primary,
      height: height,
    ) 
  );
}

return Column(
  children: [
    effectiveHeader, //then use it inside the widget tree
    ...entries,
  ]
);
```

# Always specify types in function declaration
```dart
/// BAD
_myFunction(type) {
  ...
}

// GOOD
void _myFunction(int param) {
  ...
}
```

# Translation
Always use localized text for user facing texts.
Localization are defined in translations package using l10n package.
mor info here: https://docs.flutter.dev/development/accessibility-and-localization/internationalization

```dart
// BAD
Text('Scan QR code');

// GOOD
Text(context.l10n.scan_qr_code_button);
```

Takes advantage of l10n feature for plurals and parameters:
```
// BAD
Text(number <= 1 ? context.l10n.user_count_single : context.l10n.user_count_plural);

// BAD
Text(context.l10n.page_title_prefix + number + context.l10n.page_title_suffix);

// GOOD
Text(context.l10n.user_number(count));
...
"user_number": "{count,plural, =1{{count} user}, other{{count} users}}",
"@user_number": {
  "placeholders": {
    "count": {
      "type": "int" 
    }
  }
},

// GOOD
Text(context.l10n.page_title(number));
...
"page_title": "You have {number} coin in your wallet",
"@page_title": {
  "placeholders": {
    "number": {
      "type": "int"
    }
  }
},
```

# Colors
Never use const colors inside the view
Colors values should be accessed through the theme.
```dart
// BAD
Container(
  color: Colors.red,
),

// GOOD
Container(
  color: Theme.of(context).colorScheme.primary,
),
```

# TextStyles
Prefer using textTheme token where it's possible.
Avoid using custom TextStyle.
```dart
// BAD
Text(
  'Some headline',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    ...
  )

),

// GOOD
Text(
  'Some text',
  style: Theme.of(context).textTheme.headlineSmall,
),
```

It sometime necessary to create custom TextStyle when a text have an unusual style that is not covered by theme.
In such case it ok to create a custom style, you can use an existing style from theme as a base like so:

```
// GOOD

final styleOverride = Theme.of(context).textTheme.headlineSmall.copyWith(
    color: Theme.of(context).colorScheme.primary,
);
Text(
  'Some text',
  style: styleOverride,
),
```

# Blank Spaces

Use space widget from dimensions_theme package to represent blank space instead of SizedBox with hardcoded values
```dart
// BAD
SizedBox(
  height: 42,
),

// GOOD
SpaceLarge(),
```

# Padding
Use edge insets classes from dimensions_theme package to create padding instead of EdgeInsets with hardcoded values
```dart
// BAD
Padding(
  height: EdgeInsets.symmetric(
    horizontal: 20,
  ),
),

// GOOD
Padding(
  height: EdgeInsetsMedium.of(context).horizontal,
),
```

# const and final
Use const or final where possible.
The preference is the following: const > final > var
Use const constructor where possible
When creating an abstract class, always declare an empty const constructor so child classes can have one too.

# Import
Don't use backward import
Try to keep import path as short as possible
```dart
// BAD
import '../../some_file.dart';

// GOOD
import 'package:my_unbox/feature/some_file.dart';
import 'feature/feature.dart';
import 'some_file.dart';
```

# Barrel export
When you have multiple file regrouped into one folder, create a barrel export with the same name than the folder that export all the files.
```
└── widgets
    └── widgets.dart // barrel export for all widgets
    ├── qr_scanner.dart
    ├── app_bars/
    |   └── app_bars.dart // barrel export for all app_bars
    |   └── home_app_bar.dart
    |   └── scan_app_bar.dart
    ├── some_widget.dart
```
**widgets.dart**
```dart
export 'qr_scanner.dart';
export 'app_bars/app_bars.dart';
export 'some_widget.dart';
```
**app_bars.dart**
```dart
export 'home_app_bar.dart';
export 'scan_app_bar.dart';
```

# Trailing commas
Use a trailing comma for arguments, parameters, and list items, but only if they each have their own line.

Example:
```dart
List<int> myList = [
  1,
  2,
];
myList = <int>[3, 4];

foo1(
  bar,
  baz,
);
foo2(bar, baz);
```
Flutter formatted make extensive use of trailing commas.
Whether to put things all on one line or whether to have one line per item is an aesthetic choice. We prefer whatever ends up being most readable. Typically this means that when everything would fit on one line, put it all on one line, otherwise, split it one item to a line.

# Inserting divider between each widget of a list
Use [intersperse package](https://pub.dev/packages/intersperse) when you need to insert separator widget between each entry of a widget list (for example if you need to insert Space() widget between each child of a list)
```dart
Column(
  children: entries
                .map<Widget>((entry) => _DisplayEntry(entry))
                .intersperse(SpaceSmall())
                .toList();
);
```

# Prefer single quote
Use double quotes for nested strings or (optionally) for strings that contain single quotes. For all other strings, use single quotes.