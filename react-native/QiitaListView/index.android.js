/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  BackAndroid,
  ToolbarAndroid,
  Navigator,
} from 'react-native';

import QiitaList from './QiitaList';
import QiitaWebView from './QiitaWebView';

var _navigator;
BackAndroid.addEventListener('hardwareBackPress', () => {
  if (_navigator && _navigator.getCurrentRoutes().length > 1) {
    _navigator.pop();
    return true;
  }
  return false;
});

var RouteMapper = function(route, navigationOperations, onComponentRef) {
  _navigator = navigationOperations;
  if (route.name === 'qiitaList') {
    return (
      <View style={{flex: 1}}>
        <ToolbarAndroid
          actions={[]}
          onIconClicked={navigationOperations.pop}
          style={styles.toolbar}
          titleColor="white"
          title={"ReactQiita"} />
        <QiitaList navigator={navigationOperations} />
      </View>
    );
  }
  else if (route.name === 'webView') {
    return (
      <QiitaWebView 
        style={{flex: 1}}
        navigator={navigationOperations}
        item={route.item} />)
  }
};


export default class ReactQiitaNavigator extends Component {
  render() {
    var initialRoute = {name: 'qiitaList'};
    return (
      <Navigator
        style={styles.container}
        initialRoute={initialRoute}
        configureScene={() => Navigator.SceneConfigs.FadeAndroid}
        renderScene={RouteMapper}
      />
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  toolbar: {
    backgroundColor: '#a9a9a9',
    height: 56,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('QiitaListView', () => ReactQiitaNavigator);
