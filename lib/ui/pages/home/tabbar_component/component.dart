import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'view.dart';

class GlobalBottomTabBarComponent extends Component<Map<String, dynamic>> {
  GlobalBottomTabBarComponent()
      : super(
            effect: buildEffect(),
            view: buildView,
          );
}
