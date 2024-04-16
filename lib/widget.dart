// counter_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store.dart';
import 'actions.dart';

class CounterWidget extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Redux Counter'),
          ),
          body: Center(
            child: StoreConnector<int, int>(
              converter: (store) => store.state,
              builder: (context, count) {
                return Text(
                 '$count',
                 style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                 onPressed: () => store.dispatch(IncrementAction()),
                 child: Icon(Icons.add),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                 onPressed: () => store.dispatch(DecrementAction()),
                 child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ),
      ),
    );
 }
}
