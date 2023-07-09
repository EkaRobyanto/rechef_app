import 'package:flutter/material.dart';
import 'package:rechef_app/src/shared/circle_net_pic.dart';

import '../../../../constants/styles.dart';
import '../../../../shared/dark_icon_button.dart';
import '../../../../shared/sliver_header.dart';
import 'widgets/recipe_creator.dart';

class ViewRecipe extends StatelessWidget {
  const ViewRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNxebVRZaEqJkZOUL8cYZYcjUbm2-jhYY7gr0Z8VUH&s',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
          ),
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(),
              ),
              SliverPersistentHeader(
                delegate: SliverHeader(
                  content: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DarkIconButton(
                            icon: Icons.arrow_back,
                            onTap: () {},
                          ),
                          DarkIconButton(
                            icon: Icons.favorite_border,
                            onTap: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Rendang Daging Sapi',
                                style: Styles.font.bxl,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resep Oleh :',
                        style: Styles.font.sm,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const RecipeCreatorCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
