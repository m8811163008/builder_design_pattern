import 'package:builder_design_pattern/burger/big_mac_builder.dart';
import 'package:builder_design_pattern/burger/burger.dart';
import 'package:builder_design_pattern/burger/burger_builder_base.dart';
import 'package:builder_design_pattern/burger/burger_maker.dart';
import 'package:builder_design_pattern/burger/cheese_burger_builder.dart';
import 'package:builder_design_pattern/burger/hamburger_builder.dart';
import 'package:builder_design_pattern/burger/mc_chicken_builder.dart';
import 'package:builder_design_pattern/models/burger_menu_item.dart';
import 'package:builder_design_pattern/widgets/burger_information_column.dart';
import 'package:flutter/material.dart';

/// The director class [BurgerMaker] does not care about the
/// specific implementation of the builder - the specific
/// implementation could be changed at run-time, hence providing
/// a different result.
/// Also this kind of implementation allows easily adding a new
/// builder as long as it extends the [BurgerBuilderBase] to
/// provide another different product's representation without
/// breaking the existing code.
class BuilderExample extends StatefulWidget {
  const BuilderExample({Key? key}) : super(key: key);

  @override
  State<BuilderExample> createState() => _BuilderExampleState();
}

class _BuilderExampleState extends State<BuilderExample> {
  final BurgerMaker _burgerMaker = BurgerMaker(HamburgerBuilder());
  final List<BurgerMenuItem> _burgerMenuItems = [];

  late BurgerMenuItem _selectedBurgerMenuItem;
  late Burger _selectedBurger;

  @override
  void initState() {
    super.initState();
    _burgerMenuItems.addAll([
      BurgerMenuItem(
        label: 'Hamburger',
        burgerBuilder: HamburgerBuilder(),
      ),
      BurgerMenuItem(
        label: 'Cheeseburger',
        burgerBuilder: CheeseburgerBuilder(),
      ),
      BurgerMenuItem(
        label: 'Big Mac\u00AE',
        burgerBuilder: BigMacBuilder(),
      ),
      BurgerMenuItem(
        label: 'McChicken\u00AE',
        burgerBuilder: McChickenBuilder(),
      )
    ]);
    _selectedBurgerMenuItem = _burgerMenuItems[0];
    _selectedBurger = _prepareSelectedBurger();
  }

  Burger _prepareSelectedBurger() {
    _burgerMaker.prepareBurger();
    return _burgerMaker.getBurger();
  }

  void _onBurgerMenuItemChanged(BurgerMenuItem? selectedItem) {
    setState(() {
      _selectedBurgerMenuItem = selectedItem!;
      _burgerMaker.changeBurgerBuilder(selectedItem.burgerBuilder);
      _selectedBurger = _prepareSelectedBurger();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Select menu item:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  DropdownButton(
                      value: _selectedBurgerMenuItem,
                      items: _burgerMenuItems
                          .map<DropdownMenuItem<BurgerMenuItem>>(
                              (BurgerMenuItem item) => DropdownMenuItem(
                                    child: Text(item.label),
                                    value: item,
                                  ))
                          .toList(),
                      onChanged: _onBurgerMenuItemChanged)
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: <Widget>[
                  Text(
                    'Information:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              BurgerInformationColumn(burger: _selectedBurger),
            ],
          ),
        ));
  }
}
