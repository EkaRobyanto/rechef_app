import 'package:flutter/material.dart';
import '../../../../../constants/styles.dart';
import 'add_ingredients_tab.dart';
import 'add_method.dart';

class CreateRecipeTabBar extends StatefulWidget {
  const CreateRecipeTabBar({
    super.key,
  });

  @override
  State<CreateRecipeTabBar> createState() => _CreateRecipeTabBar();
}

class _CreateRecipeTabBar extends State<CreateRecipeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Styles.color.primary,
          unselectedLabelColor: Styles.color.dark,
          indicatorColor: Styles.color.primary,
          onTap: (index) => FocusScope.of(context).unfocus(),
          tabs: const [
            Tab(
              child: Text(
                'Alat & Bahan',
              ),
            ),
            Tab(
              child: Text(
                'Metode',
              ),
            ),
          ],
          indicatorWeight: 3,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.83,
          child: TabBarView(
            controller: _tabController,
            children: const [
              AddIngredients(),
              AddMethod(),
            ],
          ),
        )
      ],
    );
  }
}
