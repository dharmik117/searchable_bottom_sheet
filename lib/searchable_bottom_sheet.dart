import 'package:flutter/material.dart';

class SearchableBottomSheet<T> extends StatelessWidget {
  final List<T> items;
  final String title;
  final Function(T) onItemSelected;
  final List<String> Function(T) searchKey;
  final Widget Function(T) itemBuilder;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final double? elevation;
  final bool? useRootNavigator;
  final bool isDismissible;
  final bool enableDrag;
  final bool? isScrollControlled;
  final Clip? clipBehavior;
  final bool useSafeArea;
  final BoxConstraints? constraints;

  const SearchableBottomSheet({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.searchKey,
    required this.itemBuilder,
    this.title = "Search",
    this.backgroundColor,
    this.shape,
    this.elevation,
    this.useRootNavigator,
    this.isDismissible = true,
    this.enableDrag = true,
    this.isScrollControlled,
    this.clipBehavior,
    this.useSafeArea = false,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return _AutoResizingSearchableBottomSheetContent<T>(
      items: items,
      title: title,
      onItemSelected: onItemSelected,
      searchKey: searchKey,
      itemBuilder: itemBuilder,
    );
  }

  static void show<T>({
    required BuildContext context,
    required List<T> items,
    required Function(T) onItemSelected,
    required List<String> Function(T) searchKey,
    required Widget Function(T) itemBuilder,
    String title = "Search",
    Color? backgroundColor,
    ShapeBorder? shape,
    double? elevation = 0,
    bool? useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? isScrollControlled = true,
    Clip? clipBehavior,
    bool useSafeArea = false,
    BoxConstraints? constraints,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled!,
      useSafeArea: useSafeArea,
      backgroundColor: backgroundColor,
      shape: shape,
      elevation: elevation,
      useRootNavigator: useRootNavigator!,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      clipBehavior: clipBehavior,
      constraints: constraints,
      builder: (_) => SearchableBottomSheet<T>(
        items: items,
        title: title,
        onItemSelected: onItemSelected,
        searchKey: searchKey,
        itemBuilder: itemBuilder,
        backgroundColor: backgroundColor,
        shape: shape,
        elevation: elevation,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        isScrollControlled: isScrollControlled,
        clipBehavior: clipBehavior,
        useSafeArea: useSafeArea,
        constraints: constraints,
      ),
    );
  }
}

class _AutoResizingSearchableBottomSheetContent<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Function(T) onItemSelected;
  final List<String> Function(T) searchKey;
  final Widget Function(T) itemBuilder;

  const _AutoResizingSearchableBottomSheetContent({
    required this.items,
    required this.title,
    required this.onItemSelected,
    required this.searchKey,
    required this.itemBuilder,
  });

  @override
  __AutoResizingSearchableBottomSheetContentState<T> createState() =>
      __AutoResizingSearchableBottomSheetContentState<T>();
}

class __AutoResizingSearchableBottomSheetContentState<T>
    extends State<_AutoResizingSearchableBottomSheetContent<T>> {
  late List<T> filteredItems;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(filterItems);
  }

  void filterItems() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = widget.items.where((item) {
        final searchKeys = widget.searchKey(item);
        return searchKeys.any((key) => key.toLowerCase().contains(query));
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(filterItems);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: widget.title,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onItemSelected(item);
                  },
                  child: widget.itemBuilder(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
