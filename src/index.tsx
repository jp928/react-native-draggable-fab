import { Platform, View } from 'react-native';
import CoordinatorLayoutAndroid from './lib/CoordinatorLayoutAndroid';

// @ts-ignore
import Fab, { LabelAnimation } from './lib/DraggableFab';

const CoordinatorLayout = Platform.select({
  android: CoordinatorLayoutAndroid,
  ios: View,
});

export { Fab, CoordinatorLayout, LabelAnimation };
