import 'package:proklinik_contract_sign/providers/px_contract_builder.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviders {
  MainProviders();
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => PxContractBuilder())
  ];
}
