import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_listener/data/datasource/auth_remote_datasource.dart';
import 'package:multiple_listener/data/repository/auth_repository_impl.dart';
import 'package:multiple_listener/domain/usecases/check_phone_usecase.dart';
import 'package:multiple_listener/presentation/bloc/email/email_bloc.dart';
import 'package:multiple_listener/presentation/bloc/phone/phone_bloc.dart';
import 'package:multiple_listener/presentation/page/first_page.dart';

import 'domain/usecases/check_email_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => EmailBloc(CheckEmailUsecase(
                AuthRepositoryImpl(FakeAuthRemoteDataSourceImpl())))),
        BlocProvider(
            create: (_) => PhoneBloc(CheckPhoneUsecase(
                AuthRepositoryImpl(FakeAuthRemoteDataSourceImpl())))),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const FirstPage()),
    );
  }
}
