import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store.dart';
import 'actions.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

 @override
 Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Redux счетчик'),
          ),
          body: Center(
            child: StoreConnector<int, int>(
              converter: (store) => store.state,
              builder: (context, count) {
                return Text(
                 '$count',
                 style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                 onPressed: () => store.dispatch(IncrementAction()),
                 child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                 onPressed: () => store.dispatch(DecrementAction()),
                 child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ),
      ),
    );
 }
}
