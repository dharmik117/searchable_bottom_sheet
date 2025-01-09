<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Platform Widgets
A Flutter package for adaptive UI components.

## Introduction

"Seamlessly explore and choose from a neatly organized list available in a user-friendly bottom
sheet."

## Key Features

Model-Based Search: Define a single model, and the package handles the rest for seamless searching.

Highly Customizable UI: Easily modify the bottom sheet design, including colors, text styles, and
layouts.

Optimized Search Functionality: Lightning-fast search performance for large lists, ensuring smooth
user experience.

Dynamic List Handling: Automatically updates the displayed list based on search input.

Multiple Search Key :  Search with multiple search keys

## Getting started

1. Install the package: Add the following line to your pubspec.yaml file:
   dependencies:  searchable_bottom_sheet

2. Import the package: In your Dart code, import the necessary widget:
   import 'package:searchable_bottom_sheet/searchable_bottom_sheet.dart';

## Usage

TODO:
View `/example` folder.

## PlatformButton

```
SearchableBottomSheet.show<FruitListModel>(
              context: context,
              items: fruitList,
              onItemSelected: (selectedFruit) {
                debugPrint("Selected Fruit: ${selectedFruit.fruitName}");
              },
              searchKey: (fruit) => [fruit.fruitName],
              useSafeArea: true,
              itemBuilder: (fruit) => ListTile(
                title: Text(fruit.fruitName),
              ),
            );

```

## Demo

<video src='https://github.com/dharmik117/searchable_bottom_sheet/blob/master/example/bottom_sheet_demo.mp4' width=180/>;

## Benefits

Consistent User Experience: By automatically adapting to the platform's design guidelines,
platform_widgets helps you deliver a more cohesive and familiar user experience across devices.
Simplified Development: No longer do you need to write separate code paths for iOS and Android. With
platform_widgets, you can maintain a single codebase while ensuring platform-specific styling.
Enhanced Visual Appeal: The widgets in this package are meticulously designed to match the native
look and feel of each platform, providing a polished and professional appearance.

## Additional information

Contributing: We welcome your contributions! Feel free to submit bug reports, feature requests, or
pull requests to improve this package.
Issues: Please report any issues you encounter using the GitHub issue
tracker: https://github.com/dharmik117/searchable_bottom_sheet.
License: This package is released under the MIT License (see LICENSE file for details).
Example:

A more elaborate example showcasing both widgets can be found in the /example directory of this
package.
