import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../ui/screens/login/sign_in/bloc/sign_in_bloc.dart';
import '../../../ui/screens/login/sign_in/bloc/sign_in_event.dart';

class SignInRouter {
  const SignInRouter();

  static BlocProvider get page => BlocProvider<SignInBloc>(
        create: (_) {
          final signInBloc = SignInBloc(Get.find());
          signInBloc.add(SignInInitEvent());
          return signInBloc;
        },
      );
}
