import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import Fab from 'react-native-draggable-fab';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Result: Hello World</Text>
      <Fab />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
