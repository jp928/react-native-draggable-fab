import { requireNativeComponent } from 'react-native';

type EmitEvent = {
  nativeEvent: {
    index: number;
  };
};

export type FabProps = {
  animateType?: LabelAnimation;
  itemLabels?: String[];
  onTapItem?: (event: EmitEvent) => void;
};

const Fab = requireNativeComponent<FabProps>('DraggableFab');

export enum LabelAnimation {
  Pop = 'Pop',
  Fade = 'Fade',
  SlideLeft = 'Slide Left',
  SlideUp = 'Slide Up',
  None = 'none',
}

export default Fab;
