import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/authRepository/user_provider.dart';


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends ConsumerState<MyHomePage> {

  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    SizedBox(), // placeholder per FAB
    Center(child: Text("Notifications")),
    Center(child: Text("Profile")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) =>const Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Camera"),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text("Galleria"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Impostazioni"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final userNameAsync = ref.watch(userFullNameProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: userNameAsync.when(
            loading: () => const Text('Caricamento...'),
            error: (_, __) => const Text(tProfile),
            data: (name) => Text(
              name ?? tProfile,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        body: _pages[_selectedIndex],
        floatingActionButton: FloatingActionButton(
            onPressed: _openMoreOptions,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                const SizedBox(width: 40), // spazio FAB
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


