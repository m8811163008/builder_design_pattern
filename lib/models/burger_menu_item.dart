import 'package:builder_design_pattern/burger/burger_builder_base.dart';

class BurgerMenuItem {
  final String label;
  final BurgerBuilderBase burgerBuilder;

  const BurgerMenuItem({
    required this.label,
    required this.burgerBuilder,
  });
}
