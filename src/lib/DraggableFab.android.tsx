import React, { useEffect, useState } from 'react';
import { requireNativeComponent } from 'react-native';

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
};

const DraggableFab = requireNativeComponent<FabProps & { onChange?: () => void }>('DraggableFab');

const Fab : React.FC<FabProps> = ({ onPress, iconProvider, iconColor, icon, ...props}) => {
  const [uri, setUri ] = useState();

  useEffect(() => {
    const getUri = async () => {
      try {
        const { uri: _uri } = await iconProvider.getImageSource(icon, 42, iconColor || '#fff' );
        if (_uri !== uri) {
          setUri(_uri);
        }
      } catch {
        console.warn('The icon is not available.');
      }
    }

    if (icon && iconProvider && iconColor) {
      getUri();
    }

  }, [icon, iconProvider, iconColor]);

  return uri ? (
    <DraggableFab
      { ...props }
      icon={uri}
      onChange={onPress}
    />
  ): null;

}

export default Fab;
