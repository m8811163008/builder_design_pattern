import 'package:builder_design_pattern/burger/burger.dart';
import 'package:flutter/material.dart';

/// Used as a base class for all the burger builders
/// classes.
abstract class BurgerBuilderBase {
  @protected
  late Burger burger;
  @protected
  late double price;

  /// Initialises a [Burger] class object.
  createBurger() {
    burger = Burger();
  }

  /// Returns the build burger result.
  Burger getBurger() => burger;

  /// Set the price for the burger object.
  void setBurgerPrice() => burger.setPrice(price);

  void addBuns();
  void addCheese();
  void addPatties();
  void addSauces();
  void addSeasoning();
  void addVegetables();
}
