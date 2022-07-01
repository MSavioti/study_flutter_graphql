import 'package:flutter/material.dart';
import 'package:study_flutter_graphql/app/presentation/screens/home/home_screen.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTerm = ModalRoute.of(context)?.settings.arguments as String?;

    return HomeScreen(searchTerm: searchTerm);
  }
}
