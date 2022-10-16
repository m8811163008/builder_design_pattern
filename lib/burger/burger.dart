import 'package:builder_design_pattern/models/ingredient.dart';

/// The [Burger] is a simple class representing the
/// product of a builder. It contains `ingredients`
/// list and `price` property to store corresponding
/// values.
class Burger {
  final List<Ingredient> _ingredients = [];
  late double _price;

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }

  String getFormattedIngredient() =>
      _ingredients.map((i) => i.getName()).join(', ');

  String getFormattedAllergens() {
    final result = [];
    for (var ingredient in _ingredients) {
      result.addAll(ingredient.getAllergens());
    }
    return result.join(', ');
  }

  String getFormattedPrice() => '\$${_price.toStringAsFixed(2)}';

  void setPrice(double price) {
    _price = price;
  }
}
