import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../../shared/dark_icon_button.dart';
import 'widgets/like_comment.dart';
import 'widgets/recipe_creator.dart';
import 'widgets/recipe_info.dart';
import 'widgets/recipe_tabbar.dart';

class ViewRecipe extends StatefulWidget {
  const ViewRecipe({super.key});

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              toolbarHeight: 0,
              elevation: 0,
              collapsedHeight: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNxebVRZaEqJkZOUL8cYZYcjUbm2-jhYY7gr0Z8VUH&s',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DarkIconButton(
                                icon: Icons.arrow_back,
                                onTap: () {
                                  context.pop();
                                },
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
                                InkWell(
                                  onTap: () => setState(() {
                                    _scrollController.animateTo(0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  }),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Rendang Daging Sapi',
                                      style: Styles.font.bxl,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Deskripsi',
                      style: Styles.font.bold,
                    ),
                    Text(
                      'Rendang adalah hidangan berbahan dasar daging yang dihasilkan dari proses memasak suhu rendah dalam waktu lama dengan menggunakan aneka rempah-rempah dan santan. ',
                      style: Styles.font.base,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const RecipeInformation(),
                    const SizedBox(
                      height: 10,
                    ),
                    const LikeComment(),
                    const SizedBox(
                      height: 10,
                    ),
                    const RecipeTabbar()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
