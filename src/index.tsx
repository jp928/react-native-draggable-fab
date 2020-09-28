import { requireNativeComponent } from 'react-native';

type EmitEvent = {
  nativeEvent: {
    index: number;
  };
};

export type FabProps = {
  animateType?: LabelAnimation;
  itemLabels?: String[];
  onItemTap?: (event: EmitEvent) => void;
};

const Fab = requireNativeComponent<FabProps>('DraggableFab');

export enum LabelAnimation {
  Pop = 'pop',
  Fade = 'fade',
  SlideLeft = 'slideLeft',
  SlideUp = 'slideUp',
  None = 'none',
}

export default Fab;
