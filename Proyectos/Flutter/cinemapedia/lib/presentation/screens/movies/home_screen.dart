import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {

  static const name='Home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideshow=ref.watch(moviesSlideshowProvider);
    final popularMovies=ref.watch(popularMoviesProvider);
    final upcomingMovies=ref.watch(upcomingMoviesProvider);
    final topRatedMovies=ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            centerTitle: true,
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return 
        Column(
        children: [      
          MoviesSlideshow(movies: moviesSlideshow),
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Lunes 20',
            loadNextPage: () =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
      
          MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Proximamente',
            subtitle: 'En este mes',
            loadNextPage: () =>ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populares',
            // subtitle: '',
            loadNextPage: () =>ref.read(popularMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Mejor calificadas',
            subtitle: 'Desde siempre',
            loadNextPage: () =>ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
          ),
      SizedBox(height: 25,)
        ],
      );
        },
        childCount: 1
        ))
      ]

    );
  }
}