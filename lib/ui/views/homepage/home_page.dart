import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/ui/views/listUtents/listUtents.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/authRepository/user_provider.dart';
import '../../widgets/homepageAppBar.dart';

final pageIndexProvider = StateProvider<int>((ref) => 0);


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends ConsumerState<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark; //Dark mode
    final pageIndex = ref.watch(pageIndexProvider);
    final isAdmin = ref.watch(userIsAdmin);

    final List<Widget> pages = [
      const ListUsers(),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: HomepageAppbar(isDark: isDark),
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(image: AssetImage(tLogoImage)),
                currentAccountPictureSize: Size(100, 100),
                accountName: Text('For Support:'),
                accountEmail: Text(tEmailSupport),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.verified_user), title: Text('Profile')),
            ],
          ),
        ),
        body: pages[pageIndex],
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            print(isAdmin);
          },
          tooltip: isAdmin.when(
              loading: () => tLoading,
              data: (value) => value ? tAddPosts : tAddDogs,
              error: (_, __) => "Errore",
          ),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        color: pageIndex == 0 ? Colors.blue : Colors.grey,
                      ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 0,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: pageIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 1,
                  ),
                  const SizedBox(width: 40), //Space for the FAB
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: pageIndex == 2 ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 2,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        color: pageIndex == 3 ? Colors.blue : Colors.grey
                      ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 3,
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}


