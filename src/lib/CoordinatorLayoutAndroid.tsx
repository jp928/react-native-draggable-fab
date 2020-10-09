
import React from 'react';

import {
  StyleSheet,
  requireNativeComponent,
} from 'react-native';

const CoordinatorLayout = requireNativeComponent<any>('CoordinatorLayout');

const CoordinatorLayoutAndroid: any = ({ ...props }) => {
  return (
    <CoordinatorLayout style={props.style || styles.container}>
      {props.children}
    </CoordinatorLayout>
  );
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
})

export default CoordinatorLayoutAndroid
