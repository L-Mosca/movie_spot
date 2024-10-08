import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../ui/screens/login/sign_up/bloc/sign_up_bloc.dart';
import '../../../ui/screens/login/sign_up/bloc/sign_up_event.dart';

class SignUpRouter {
  const SignUpRouter();

  static BlocProvider get page => BlocProvider<SignUpBloc>(
        create: (_) {
          final signUpBloc = SignUpBloc(Get.find());
          signUpBloc.add(SignUpInitEvent());
          return signUpBloc;
        },
      );
}
