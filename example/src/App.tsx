import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import {
  LabelAnimation,
  Fab,
  CoordinatorLayout,
} from 'react-native-draggable-fab';

export default function App() {
  const [tappedItem, setTappedItem] = React.useState(0);

  const onTapItem = ({ nativeEvent }) => {
    console.log(nativeEvent);
    setTappedItem(nativeEvent.index);
  };

  const onPress = (...params) => {
    console.log(params);
  };

  return (
    <CoordinatorLayout
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        // backgroundColor: 'red',
      }}
    >
      <View style={styles.container}>
        <Text>Tapped Item: {tappedItem}</Text>
        <Fab
          animateType={LabelAnimation.SlideLeft}
          itemLabels={['test1', 'test2', 'test3']}
          onItemTap={onTapItem}
          icon="directions"
          // onPress={onPress}
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
