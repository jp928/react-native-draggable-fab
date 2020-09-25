import { NativeModules } from 'react-native';

type DraggableFabType = {
  multiply(a: number, b: number): Promise<number>;
};

const { DraggableFab } = NativeModules;

export default DraggableFab as DraggableFabType;
