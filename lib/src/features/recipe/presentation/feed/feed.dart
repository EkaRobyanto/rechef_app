import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';
import 'package:rechef_app/src/shared/error_screen.dart';
import 'package:rechef_app/src/shared/loading_screen.dart';
import 'package:rechef_app/src/shared/recipe_card.dart';

import '../../../../core/repository/storage_repository.dart';
import '../../repository/recipe_repository_impl.dart';
import '../../../../utills/material_design_indicator.dart';
import 'bloc/feed_bloc.dart';
import 'bloc/feed_event.dart';
import 'bloc/feed_state.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  final List<String> _tabs = [
    'Semua',
    '', '', '', ''
    // 'Terbaru',
    // 'Mengikuti',
    // 'Pemula',
    // 'Profesional'
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FeedBloc(
          storageRepository: RepositoryProvider.of<StorageRepository>(context),
          recipeRepo: RepositoryProvider.of<RecipeRepositoryImpl>(context),
        )..add(
            LoadFeed(),
          ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<FeedBloc, FeedState>(
                builder: (context, state) {
                  return IgnorePointer(
                    child: TabBar(
                      controller: _tabController,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      labelColor: Colors.black,
                      labelStyle: Styles.font.xsm,
                      labelPadding: const EdgeInsets.all(0),
                      indicator: MaterialDesignIndicator(
                        indicatorHeight: 6,
                        indicatorColor: Styles.color.primary,
                      ),
                      // onTap: null,
                      onTap: (index) {
                        BlocProvider.of<FeedBloc>(context, listen: false).add(
                          LoadFeed(),
                        );
                      },
                      tabs: _tabs
                          .map(
                            (e) => Tab(
                              text: e,
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
              BlocBuilder<FeedBloc, FeedState>(
                builder: (context, state) {
                  if (state is FeedLoading) {
                    return const LoadingScreen();
                  } else if (state is FeedError) {
                    return ErrorScreen(
                      error: state.error,
                      onRetry: () {},
                    );
                  } else if (state is FeedLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.data[0].length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        itemBuilder: (context, index) {
                          log(state.data[0].toString());
                          return RecipeCard(
                            recipe: state.data[0][index],
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
