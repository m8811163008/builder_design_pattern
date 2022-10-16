import 'package:builder_design_pattern/burger/burger.dart';
import 'package:builder_design_pattern/widgets/burger_information_label.dart';
import 'package:flutter/material.dart';

class BurgerInformationColumn extends StatelessWidget {
  final Burger burger;

  const BurgerInformationColumn({
    required this.burger,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const BurgerInformationLabel('Price'),
        Text(burger.getFormattedPrice()),
        const SizedBox(height: 12.0),
        const BurgerInformationLabel('Ingredients'),
        Text(
          burger.getFormattedIngredient(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 12.0),
        const BurgerInformationLabel('Allergens'),
        Text(
          burger.getFormattedAllergens(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
