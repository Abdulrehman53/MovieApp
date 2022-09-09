import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/router.dart';
import '../../../models/movie_model.dart';
import 'bloc/movie_bloc.dart';
import 'bloc/movie_bloc_state.dart';
import 'movie_list_item.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  List<String> tagList = ['funny', 'animals', 'music', 'football'];
  late MovieBloc _homeBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = MovieBloc();
    _tabController = TabController(length: tagList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tagList.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Movies'),
            bottom: TabBar(
              onTap: (index) {
                _homeBloc.getMovieByCategory(tag: tagList[index]);
              },
              tabs: tagList.map((tag) => Text(tag)).toList(),
            ),
          ),
          body: tabItem()),
    );
  }

  Widget tabItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: BlocProvider(
        create: (context) => _homeBloc,
        child: BlocBuilder<MovieBloc, MovieBlocState>(
          builder: (context, MovieBlocState state) {
            if (state.movieModel.data!.posts!.isEmpty) {
              return const Center(child: const CircularProgressIndicator());
            }
            List<Post> posts = state.movieModel.data!.posts!;

            return ListView.separated(
                itemCount: posts.length,
                separatorBuilder: ((context, index) => const Divider(
                      height: 16.0,
                      color: Colors.grey,
                    )),
                itemBuilder: (context, index) => PostVideo(
                      posts[index].images!.image460Sv!.url!,
                      postId: posts[index].id!,
                      discription: posts[index].title,
                    ));
          },
        ),
      ),
    );
  }
}
