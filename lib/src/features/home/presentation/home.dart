import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/image_path.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/home/bloc/home_bloc.dart';
import 'package:rechef_app/src/features/home/bloc/home_event.dart';
import 'package:rechef_app/src/features/home/repository/home_repository_impl.dart';
import 'package:rechef_app/src/shared/error_screen.dart';
import 'package:rechef_app/src/shared/loading_screen.dart';
import 'package:rechef_app/src/shared/shrink_widget.dart';

import '../bloc/home_state.dart';
import 'widgets/recomendation_card.dart';
import 'widgets/search_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          homeRepository: RepositoryProvider.of<HomeRepositoryImpl>(context))
        ..add(
          //Todo token
          LoadHome(''),
        ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const LoadingScreen();
          } else if (state is HomeLoadError) {
            return ErrorScreen(
              error: state.error,
              onRetry: () => context.read<HomeBloc>().add(
                    //Todo token
                    LoadHome(''),
                  ),
            );
          }
          return const HomeScreen();
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    List<Map<String, dynamic>> categoryItems = [
      {
        'pic': boil,
        'name': 'Rebusan',
      },
      {
        'pic': boil,
        'name': 'Rebusan',
      },
      {
        'pic': boil,
        'name': 'Rebusan',
      },
      {
        'pic': boil,
        'name': 'Rebusan',
      },
    ];
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              bg,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(1.0),
                  Colors.white.withOpacity(1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Populer minggu ini',
                        style: Styles.font.bxl,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: RecomendationCard(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Kategori',
                            style: Styles.font.bxl,
                          ),
                          ShrinkWidget(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.color.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Lihat Semua',
                                style: Styles.font.bsm,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return RecipeCategoryCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 80,
              color: Styles.color.primary.withOpacity(
                (_scrollControllerOffset / 150).clamp(0, 1).toDouble(),
              ),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: SearchBar(
                scrollOffset: _scrollControllerOffset,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCategoryCard extends StatelessWidget {
  const RecipeCategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Styles.color.accent,
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: Image.asset(bakery).image,
              alignment: Alignment.center,
              scale: 4.5,
            ),
          ),
        ),
        Text(
          'Bakery',
          style: Styles.font.bold,
        )
      ],
    );
  }
}

//rebusan, tumisan, gorengan, bakaran, 
// daging, sayuran, buah, produk susu
// non susu, mie dan pasta, saus, snack
// fast food, bakery, chinese, korean, 
// timur tengah, thai, indian, western, 
// japanese, seafood, nasi, minuman