import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/theme.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final Routes _appRouter = Routes();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TourCubit>(
          create: (BuildContext context) => TourCubit(),
        ),
        BlocProvider(create: (BuildContext context) => ProfileCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          initialRoute: '/',
          onGenerateRoute: _appRouter.onGenerateRoute),
    );
  }
}
