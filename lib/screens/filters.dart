import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

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
      body: Column(children: [
        FilterSwitch(
          title: 'Gluten-free',
          subtitle: 'Only include gluten-free meals.',
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
          },
          value: activeFilters[Filter.glutenFree]!,
        ),
        FilterSwitch(
          title: 'Lactose-free',
          subtitle: 'Only include lactose-free meals.',
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
          },
          value: activeFilters[Filter.lactoseFree]!,
        ),
        FilterSwitch(
          title: 'Vegetarian',
          subtitle: 'Only include vegetarian meals.',
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, isChecked);
          },
          value: activeFilters[Filter.vegetarian]!,
        ),
        FilterSwitch(
          title: 'Vegan',
          subtitle: 'Only include vegan meals.',
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
          },
          value: activeFilters[Filter.vegan]!,
        ),
      ]),
    );
  }
}
