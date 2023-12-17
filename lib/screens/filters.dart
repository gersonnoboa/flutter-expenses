import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final glutenFreeSwitch = FilterSwitch(
    title: 'Gluten-free',
    subtitle: 'Only include gluten-free meals.',
  );

  final lactoseFreeSwitch = FilterSwitch(
    title: 'Lactose-free',
    subtitle: 'Only include lactose-free meals.',
  );

  final vegetarianSwitch = FilterSwitch(
    title: 'Vegetarian',
    subtitle: 'Only include vegetarian meals.',
  );

  final veganSwitch = FilterSwitch(
    title: 'Vegan',
    subtitle: 'Only include vegan meals.',
  );

  @override
  void initState() {
    super.initState();

    glutenFreeSwitch.isSwitchSelected =
        widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeSwitch.isSwitchSelected =
        widget.currentFilters[Filter.lactoseFree]!;
    vegetarianSwitch.isSwitchSelected =
        widget.currentFilters[Filter.vegetarian]!;
    veganSwitch.isSwitchSelected = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();

      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              Filter.glutenFree: glutenFreeSwitch.isSwitchSelected,
              Filter.lactoseFree: lactoseFreeSwitch.isSwitchSelected,
              Filter.vegetarian: vegetarianSwitch.isSwitchSelected,
              Filter.vegan: veganSwitch.isSwitchSelected,
            },
          );

          return false;
        },
        child: Column(children: [
          glutenFreeSwitch,
          lactoseFreeSwitch,
          vegetarianSwitch,
          veganSwitch,
        ]),
      ),
    );
  }
}
