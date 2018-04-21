import React, { Component } from 'react';
import { StyleSheet, View, ListView, Platform } from 'react-native';

import QiitaCell from './QiitaCell';
import QiitaIndicator from './QiitaIndicator';

const QIITA_URL = 'https://qiita.com/api/v2/tags/reactjs/items';

const styles = StyleSheet.create({
  containerIOS: {
    flex: 1,
    marginTop: 64,
    backgroundColor: '#FFFFFF',
  },
  containerAndroid: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
  listView: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
});

export default class QiitaList extends Component {
  // Initialize the hardcoded data
  constructor(props) {
    super(props);
    this.state = {
      items: new ListView.DataSource({
        rowHasChanged: (row1, row2) => row1 !== row2,
      }),
      loaded: false,
    };
  }

  componentDidMount = () => {
    this.fetchData();
  };

  selectItem = () => {};

  fetchData = () => {
    fetch(QIITA_URL)
      .then(response => response.json())
      .then((responseJson) => {
        this.setState({
          items: this.state.items.cloneWithRows(responseJson),
          loaded: true,
        });
      })
      .catch((error) => {
        console.error(error);
      });
  };

  renderLoadingView = () => <QiitaIndicator />;

  renderItem = item => <QiitaCell onSelect={() => this.selectItem(item)} item={item} />;

  renderListView = () => {
    if (Platform.OS === 'ios') {
      return (
        <View style={styles.containerIOS}>
          <ListView
            style={styles.listView}
            dataSource={this.state.items}
            renderRow={this.renderItem}
          />
        </View>
      );
    }
    return (
      <View style={styles.containerAndroid}>
        <ListView
          style={styles.listView}
          dataSource={this.state.items}
          renderRow={this.renderItem}
        />
      </View>
    );
  };

  render = () => {
    if (!this.state.loaded) {
      return this.renderLoadingView();
    }

    return this.renderListView();
  };
}
