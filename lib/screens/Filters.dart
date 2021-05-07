import 'package:flutter/material.dart';
import 'package:meal_app/widgets/Drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function savefilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.savefilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @required
  initState() {
    _GlutenFree = widget.currentFilter['gluten'];
    _LactoseFree = widget.currentFilter['lactose'];
    _Vegan = widget.currentFilter['vegan'];
    _Vegetarian = widget.currentFilter['vegetarin'];
    super.initState();
  }

  Widget bulidSwitchListTile(
      String title, bool CurrentValue, Function updataValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      value: CurrentValue,
      onChanged: updataValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectFliters = {
                  'gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegetarin': _Vegetarian,
                  'vegan': _Vegan,
                };
                widget.savefilters(selectFliters);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "  اختيار نوع الطعام# ",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  bulidSwitchListTile(
                    "خالي من الجلاتين",
                    _GlutenFree,
                    (newValue) {
                      setState(() {
                        _GlutenFree = newValue;
                      });
                    },
                  ),
                  bulidSwitchListTile(
                    "خالي من اللاكتوز",
                    _LactoseFree,
                    (newValue) {
                      setState(() {
                        _LactoseFree = newValue;
                      });
                    },
                  ),
                  bulidSwitchListTile(
                    "نباتي",
                    _Vegetarian,
                    (newValue) {
                      setState(() {
                        _Vegetarian = newValue;
                      });
                    },
                  ),
                  bulidSwitchListTile(
                    "فيجن",
                    _Vegan,
                    (newValue) {
                      setState(() {
                        _Vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
