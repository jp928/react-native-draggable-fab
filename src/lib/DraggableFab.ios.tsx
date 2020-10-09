import React from 'react';
import { requireNativeComponent, ViewStyle } from 'react-native';

type EmitEvent = {
  nativeEvent: {
    index: number;
  };
};


export enum LabelAnimation {
  Pop = 'pop',
  Fade = 'fade',
  SlideLeft = 'slideLeft',
  SlideUp = 'slideUp',
  None = 'none',
}


type FabProps = {
  animateType?: LabelAnimation;
  itemLabels?: String[];
  onItemTap?: (event: EmitEvent) => void;
  on?: boolean;
  icon?: string;
  onPress?: () => void;
  iconProvider?: any;
  iconColor?: string;
  backgroundColor?: string;
  fabColor?: string;
  onOpen?: () => void;
  style?: ViewStyle
};

const DraggableFab = requireNativeComponent<FabProps & { onChange?: () => void }>('DraggableFab');

const Fab : React.FC<FabProps> = ({ onPress, iconProvider, backgroundColor, iconColor, icon, ...props}) => {
 
  return (
    <DraggableFab
      { ...props }
      fabColor={backgroundColor}
      onOpen={onPress}
      style={{ width: 56, height: 56}}
    />
  );

}

export default Fab;
