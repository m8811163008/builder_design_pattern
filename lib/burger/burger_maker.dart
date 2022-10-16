import 'package:builder_design_pattern/burger/burger.dart';
import 'package:builder_design_pattern/burger/burger_builder_base.dart';

/// BurgerMaker is a director class that manages the
/// burger's build process.
/// A director class that manages the burger's
/// build process and returns the build result.
/// A specific implementation of the builder is
/// injected into the class via the constructor.
class BurgerMaker {
  // It contains a specific builder implementation
  // as a burgerBuilder property.
  BurgerBuilderBase burgerBuilder;

  BurgerMaker(this.burgerBuilder);

  void changeBurgerBuilder(BurgerBuilderBase burgerBuilder) =>
      this.burgerBuilder = burgerBuilder;

  Burger getBurger() => burgerBuilder.getBurger();

  void prepareBurger() {
    burgerBuilder.createBurger();
    burgerBuilder.setBurgerPrice();
    burgerBuilder.addBuns();
    burgerBuilder.addCheese();
    burgerBuilder.addPatties();
    burgerBuilder.addSauces();
    burgerBuilder.addSeasoning();
    burgerBuilder.addVegetables();
  }
}
