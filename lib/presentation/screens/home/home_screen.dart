import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_2023/business/home/home_bloc.dart';
import 'package:flutter_skeleton_2023/business/home/home_event.dart';
import 'package:flutter_skeleton_2023/business/home/home_state.dart';
import 'package:flutter_skeleton_2023/presentation/resources/text_styles.dart';
import 'package:flutter_skeleton_2023/presentation/screens/settings/settings_screen.dart';
import 'package:flutter_skeleton_2023/presentation/widgets/base_class.dart';
import 'package:flutter_skeleton_2023/data/data_store/dependency_injection.dart';
import 'package:flutter_skeleton_2023/data/api/error_handler.dart';
import 'package:flutter_skeleton_2023/data/repository_impl/joke_repository_impl.dart';
import 'package:flutter_skeleton_2023/presentation/widgets/body_loader/build_body_w_loader.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BasePage {
  final HomeScreenBloc _homeScreenBloc = HomeScreenBloc(
    di.get<ErrorHandler>(),
    di.get<JokeRepositoryImpl>(),
  );
  bool _isLoading = false;
  String? jokeString = "Loading...";

  @override
  void initState() {
    super.initState();
    _homeScreenBloc.add(GetRandomJokeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chuck Norris Jokes"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const SettingsScreen());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<HomeScreenBloc, HomeState>(
        bloc: _homeScreenBloc,
        listener: (context, state) {
          if (state is SuccessGetJokeState) {
            jokeString = state.randomJoke.value;
          } else if (state is ErrorState) {
            onErrorShowErrorDialog(context, state);
          }
        },
        builder: (BuildContext context, HomeState state) {
          _isLoading = (state is LoadingState);
          return BuildBodyWLoader(
            isLoading: _isLoading,
            body: buildBody(context),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _homeScreenBloc.add(GetRandomJokeEvent()),
        label: Text("Fetch random joke"),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                jokeString ?? "no joke yet",
                style: TextStyles.body_14_m_white.font,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
