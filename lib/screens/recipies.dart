import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_first_flutter_app/api/recipies.dart';
import 'package:my_first_flutter_app/store/reciepes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../widgets/footer.dart';
import '../widgets/menu.dart';

class RecipiesScreen extends StatefulWidget {
  const RecipiesScreen({super.key});

  @override
  State<RecipiesScreen> createState() => _RecipiesScreenState();
}

class _RecipiesScreenState extends State<RecipiesScreen> {
  @override
  void initState() {
    super.initState();
    if (!reciepesStore.isFetched) {
      getRecipies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        drawer: const Menu(),
        backgroundColor: Colors.black,
        bottomNavigationBar: const Footer(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: reciepesStore.inProgress
                ? LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.blue,
                    size: 100,
                  )
                : ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      ...reciepesStore.data.sublist(0, 20).map(
                            (reciepe) => Column(
                              children: [
                                Image.network(
                                  reciepe.thumbnailUrl,
                                  alignment: Alignment.center,
                                  fit: BoxFit.fitWidth,
                                  loadingBuilder:
                                      (_, widget, loadingProgress) => Center(
                                    child: (loadingProgress
                                                    ?.cumulativeBytesLoaded ??
                                                0) <
                                            (loadingProgress
                                                    ?.expectedTotalBytes ??
                                                0)
                                        ? CircularProgressIndicator(
                                            value: (loadingProgress
                                                        ?.cumulativeBytesLoaded ??
                                                    0) /
                                                (loadingProgress
                                                        ?.expectedTotalBytes ??
                                                    1),
                                          )
                                        : widget,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  reciepe.name,
                                  style: Theme.of(context).textTheme.headline3,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                reciepe.prepTime > 0
                                    ? Row(
                                        children: [
                                          Text(
                                            "Prepation time: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            '${reciepe.prepTime.toString()}mins',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 12,
                                ),
                                reciepe.servings > 0
                                    ? Row(
                                        children: [
                                          Text(
                                            "Servings: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            reciepe.servings.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
