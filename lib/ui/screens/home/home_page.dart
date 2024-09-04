import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/home/bloc/home_bloc.dart';
import 'package:movie_spot/ui/screens/home/widgets/home_movie_list.dart';
import 'package:movie_spot/ui/system_design/ms_loading.dart';
import 'package:movie_spot/utils/device/device_utils.dart';

import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: _onChange,
      child: Scaffold(
        body: SafeArea(
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: _closeApp,
            child: Center(
              child: _pageContent(),
            ),
          ),
        ),
      ),
    );
  }

  void _onChange(BuildContext context, HomeState state) {}

  Widget _pageContent() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      switch (state.status) {
        case HomeStatus.loading || HomeStatus.initial:
          return const MsLoading();
        case HomeStatus.success:
          return HomeMovieList(movieList: state.movieList);
      }
    });
  }

  void _closeApp(bool canPop, dynamic arg) {
    if (canPop) return;
    final isAndroid = DeviceUtils.isAndroid();

    if (isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
}
