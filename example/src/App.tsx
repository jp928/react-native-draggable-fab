import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import {
  LabelAnimation,
  Fab,
  CoordinatorLayout,
} from 'react-native-draggable-fab';

import IconMDI from 'react-native-vector-icons/MaterialIcons';

export default function App() {
  const [tappedItem, setTappedItem] = React.useState(0);

  const onTapItem = ({ nativeEvent }: any) => {
    console.log(nativeEvent);
    setTappedItem(nativeEvent.index);
  };

  const onPress = (...params: any) => {
    console.log('======>>>>', params);
  };

  return (
    <CoordinatorLayout
      style={{
        flex: 1,
      }}
    >
      <View style={styles.container}>
        <Text>Tapped Item: {tappedItem}</Text>
        <IconMDI name="add" size={42} color="#000" />
        <Fab
          animateType={LabelAnimation.SlideLeft}
          itemLabels={['']}
          onItemTap={onTapItem}
          icon="atm"
          onPress={onPress}
          iconProvider={IconMDI}
          iconColor="#fff"
          backgroundColor="#10395e"
        />
      </View>
    </CoordinatorLayout>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
