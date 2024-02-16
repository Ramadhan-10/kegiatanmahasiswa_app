import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kegiatanmahasiswa_app/layout/addinfo.dart';

import 'package:kegiatanmahasiswa_app/layout/addinfoform.dart';
import 'package:kegiatanmahasiswa_app/layout/listinfostate.dart';
import '../bloc/login_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  final String sessionToken;
  final String name;
  const WelcomeScreen({required this.sessionToken, required this.name});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.podcasts)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.plus_one),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        // Card(
        //   shadowColor: Colors.transparent,
        //   margin: const EdgeInsets.all(8.0),
        //   child: SizedBox.expand(
        //     child: Center(
        //       child: Text(
        //         'Session Token: ${widget.sessionToken}\n'
        //         'Session Token: ${widget.name}\n',
        //         style: theme.textTheme.titleLarge,
        //       ),
        //     ),
        //   ),
        // ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome!'),
              Text('Session Token: ${widget.sessionToken}\n'
                  'Session Token: ${widget.name}\n'),
            ],
          ),
        ),

        /// Notifications page
        const ListInfoState(),

        /// Messages page
        const InfoForm(),

        //about
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('copyright Ramadhan Hidayatulloh - 21552011045'),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(const ProsesLogout());
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ][currentPageIndex],
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Welcome')),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('Welcome!'),
    //         Text('Session Token: ${widget.sessionToken}'),
    // ElevatedButton(
    //   onPressed: () {
    //     context.read<LoginBloc>().add(const ProsesLogout());
    //   },
    //   child: Text('Logout'),
    // ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => AddInfoForm()),
    //             );
    //           },
    //           child: Text('add Information'),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => ListInfoState()),
    //             );
    //           },
    //           child: Text('Information'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
