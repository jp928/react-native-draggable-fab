import { requireNativeComponent, Platform, View } from 'react-native';
import CoordinatorLayoutAndroid from './lib/CoordinatorLayoutAndroid';

type EmitEvent = {
  nativeEvent: {
    index: number;
  };
};

export type FabProps = {
  animateType?: LabelAnimation;
  itemLabels?: String[];
  onItemTap?: (event: EmitEvent) => void;
  on?: boolean;
  icon?: string;
};

const Fab = requireNativeComponent<FabProps>('DraggableFab');

export enum LabelAnimation {
  Pop = 'pop',
  Fade = 'fade',
  SlideLeft = 'slideLeft',
  SlideUp = 'slideUp',
  None = 'none',
}

const CoordinatorLayout = Platform.select({
  // android: CoordinatorLayoutAndroid as typeof View,
  android: CoordinatorLayoutAndroid,
  ios: View,
}) as typeof View;

export { Fab, CoordinatorLayout };
