import 'package:billify/data/enums.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class DropdownCategories extends StatefulWidget {
  const DropdownCategories({super.key});

  @override
  State<DropdownCategories> createState() => _DropdownCategories();
}

class _DropdownCategories extends State<DropdownCategories> {
  Categories _selectedCategory = Categories.alimentacao;

  @override
  Widget build(BuildContext context) {
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
        setState(() {
          _selectedCategory = value!;
        });
      },
      value: _selectedCategory,
    );
  }
}
