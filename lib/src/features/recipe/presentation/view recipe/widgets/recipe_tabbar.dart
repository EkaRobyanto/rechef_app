import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import 'ingredient_card.dart';

class RecipeTabbar extends StatefulWidget {
  const RecipeTabbar({
    super.key,
  });

  @override
  State<RecipeTabbar> createState() => _RecipeTabbarState();
}

class _RecipeTabbarState extends State<RecipeTabbar>
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
          height: MediaQuery.of(context).size.height * 0.8,
          child: TabBarView(
            controller: _tabController,
            children: [
              IngredientsTab(),
              MethodTab(),
            ],
          ),
        )
      ],
    );
  }
}

class MethodTab extends StatelessWidget {
  const MethodTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('metode'),
    );
  }
}

class IngredientsTab extends StatelessWidget {
  const IngredientsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      itemCount: 1,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const IngredientCard(),
    );
  }
}
