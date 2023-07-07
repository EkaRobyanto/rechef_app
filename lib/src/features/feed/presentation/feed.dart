import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/feed/bloc/feed_event.dart';
import 'package:rechef_app/src/features/feed/repository/feed_repository_impl.dart';
import 'package:rechef_app/src/shared/error_screen.dart';
import 'package:rechef_app/src/shared/loading_screen.dart';
import 'package:rechef_app/src/shared/recipe_card.dart';

import '../../../utills/material_design_indicator.dart';
import '../bloc/feed_bloc.dart';
import '../bloc/feed_state.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  final List<String> _tabs = [
    'Semua',
    'Terbaru',
    'Mengikuti',
    'Pemula',
    'Profesional'
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
          feedRepo: RepositoryProvider.of<FeedRepositoryImpl>(context),
        )..add(
            LoadFeed('', ''),
          ),
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<FeedBloc, FeedState>(
                builder: (context, state) {
                  return TabBar(
                    controller: _tabController,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    labelColor: Colors.black,
                    labelStyle: Styles.font.xsm,
                    labelPadding: const EdgeInsets.all(0),
                    indicator: MaterialDesignIndicator(
                      indicatorHeight: 6,
                      indicatorColor: Styles.color.primary,
                    ),
                    onTap: (index) {
                      BlocProvider.of<FeedBloc>(context, listen: false).add(
                        LoadFeed('', _tabs[index]),
                      );
                      // context.read<FeedBloc>().add(LoadFeed('', _tabs[index]));
                    },
                    tabs: _tabs
                        .map(
                          (e) => Tab(
                            text: e,
                          ),
                        )
                        .toList(),
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
                  } else {
                    return ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      itemBuilder: (context, index) {
                        return const RecipeCard();
                      },
                    );
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
