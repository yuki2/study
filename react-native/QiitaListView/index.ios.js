import React, { Component } from 'react';
import { 
  AppRegistry,
  StyleSheet,
  NavigatorIOS,
} from 'react-native';

import QiitaList from './QiitaList';

export default class ReactQiitaNavigator extends Component {
  render() {
    return <NavigatorIOS
        style={styles.navigator}
        initialRoute={{
          component: QiitaList,
          title: 'ReactQiita',}}
          />
  }
}

const styles = StyleSheet.create({
  navigator: {
    flex: 1,
  }
});
// App registration and rendering
AppRegistry.registerComponent('QiitaListView', () => ReactQiitaNavigator);