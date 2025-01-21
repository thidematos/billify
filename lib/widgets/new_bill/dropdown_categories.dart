import 'package:billify/data/enums.dart';
import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownCategories extends ConsumerStatefulWidget {
  const DropdownCategories({super.key});

  @override
  ConsumerState<DropdownCategories> createState() => _DropdownCategories();
}

class _DropdownCategories extends ConsumerState<DropdownCategories> {
  @override
  Widget build(BuildContext context) {
    final Categories currentCategory =
        ref.watch(FormProvider)[MapKeys.categoria] as Categories;

    return DropdownButtonFormField(
      decoration: InputDecoration(
        label: Text('Categoria', style: TypographyTheme.label),
      ),
      hint: Text('Categoria da conta'),
      items: [
        for (final category in Categories.values)
          DropdownMenuItem(
            value: category,
            child: Text(
              category.displayName,
              style: TypographyTheme.body,
            ),
          )
      ],
      onChanged: (value) {
        ref
            .read(FormProvider.notifier)
            .changeInputValue(MapKeys.categoria, value);
      },
      value: currentCategory,
    );
  }
}
