import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/features/account/blocs/account/account_cubit.dart';
import 'package:rechef_app/src/features/account/blocs/account/account_state.dart';
import 'package:rechef_app/src/features/account/repository/user_repository_impl.dart';
import 'package:rechef_app/src/shared/error_screen.dart';
import 'package:rechef_app/src/shared/loading_screen.dart';

import 'widgets/account_body.dart';
import 'widgets/account_header.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(
        RepositoryProvider.of<UserRepositoryImpl>(context),
      )..loadAccount(''),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          if (state is AccountLoading) {
            return const Scaffold(
              body: LoadingScreen(),
            );
          } else if (state is AccountLoadError) {
            return Scaffold(
              body: ErrorScreen(
                error: state.error,
                onRetry: () {
                  context.read<AccountCubit>().loadAccount('');
                },
              ),
            );
          } else if (state is AccountLoaded) {
            return const AccountCustomScroll();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class AccountCustomScroll extends StatefulWidget {
  const AccountCustomScroll({super.key});

  @override
  State<AccountCustomScroll> createState() => _AccountCustomScrollState();
}

class _AccountCustomScrollState extends State<AccountCustomScroll> {
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
      extendBodyBehindAppBar: true,
      backgroundColor: Styles.color.primary,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 50,
            expandedHeight: 250,
            backgroundColor: Styles.color.primary,
            pinned: true,
            elevation: 0,
            flexibleSpace: const FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 75,
                ),
                child: AccountHeader(),
              ),
            ),
            title: GestureDetector(
              onTap: () {
                setState(() {
                  _scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                });
              },
              child: Opacity(
                opacity: _scrollControllerOffset < 160 ? 0 : 1,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://picsum.photos/200',
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Styles.color.accent,
                                      ),
                                    ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'JohnDower',
                      style: Styles.font.bsm,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 10),
                          Text('Pengaturan'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 10),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ];
                },
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: AccountBody(),
          ),
        ],
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Boxicons.bx_book_alt),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Resep Saya',
            style: Styles.font.bsm,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
