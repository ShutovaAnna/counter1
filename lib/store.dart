import 'package:redux/redux.dart';
import 'reducers.dart';

final Store<int> store = Store<int>(counterReducer, initialState: 0);
