# react-native-draggable-fab

Draggable FAB for react native

## Installation

```sh
npm install react-native-draggable-fab
```

## Usage

```js
import DraggableFab from "react-native-draggable-fab";

// ...

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
      itemLabels={['test1', 'test2', 'test3']}
      onItemTap={onTapItem}
      icon="atm"
      onPress={onPress}
      iconProvider={IconMDI}
      iconColor="#fff"
      backgroundColor="#000000"
    />
  </View>
</CoordinatorLayout>
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
