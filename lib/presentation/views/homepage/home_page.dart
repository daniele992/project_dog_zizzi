import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/authRepository/user_provider.dart';
import '../../widgets/dialog/dialog_add_dog.dart';
import '../../widgets/appbar/homepageAppBar.dart';
import '../listUtents/listUtents.dart';

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
    final isAdmin = ref.watch(userIsAdminProvider);

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
            showDialog(
                context: context,
                builder: (_) => const ShowDialogAddDog(),
            );
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
                  isAdmin.when(
                      data: (isAdmin) => IconButton(
                          onPressed: () => ref.read(pageIndexProvider.notifier).state = 0,
                          icon: Icon( isAdmin ? Icons.people_alt : Icons.pets),
                      ),
                      error: (e, st) => Text('Errore: $e') ,
                      loading: () => const CircularProgressIndicator(),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.article,
                        color: pageIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 1,
                  ),
                  const SizedBox(width: 40), //Space for the FAB
                  IconButton(
                    icon: Icon(
                      Icons.calculate,
                      color: pageIndex == 2 ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 2,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.event,
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


