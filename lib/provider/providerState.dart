
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:testapp/service.dart';

class ProviderState {
  List<SingleChildWidget> providerStatesList = [
    ChangeNotifierProvider<APIService>(create: (_) => APIService()),


  ];
}
