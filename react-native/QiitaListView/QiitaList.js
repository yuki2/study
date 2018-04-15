import React, { Component } from 'react';
import { 
  ActivityIndicator,
  StyleSheet,
  View,
  ListView,
  WebView,
  Platform,
} from 'react-native';

import QiitaCell from './QiitaCell';
import QiitaIndicator from './QiitaIndicator';
import QiitaWebView from './QiitaWebView';

const QIITA_URL = "https://qiita.com/api/v2/tags/reactjs/items";

export default class QiitaList extends Component {
  // Initialize the hardcoded data
  constructor(props) {
    super(props)
    this.selectItem = this.selectItem.bind(this)
    this.renderItem = this.renderItem.bind(this)
    this.state = {
      items: new ListView.DataSource({
        rowHasChanged: (row1, row2) => row1 !== row2,
      }),
      loaded: false
    };
  }

  componentDidMount() {
    this.fetchData()
  }

  render() {
    
    if (!this.state.loaded){
      return this.renderLoadingView()
    }

    return this.renderListView()
  }

  renderListView() {
    if (Platform.OS === 'ios') {
      return (
      <View style={styles.containerIOS}>
        <ListView
          style={styles.listView}
          dataSource={this.state.items}
          renderRow={this.renderItem}/>
      </View>
      )
    }
    else {
      return (
      <View style={styles.containerAndroid}>
        <ListView
          style={styles.listView}
          dataSource={this.state.items}
          renderRow={this.renderItem}/>
      </View>
      )
    }
  }

  renderLoadingView() {
    return (
        <QiitaIndicator />
    );
  }

  renderItem(item, sectionID, rowID) {
    return (
      <QiitaCell
        onSelect={() => this.selectItem(item)}
        item={item}
      />
    )
  }

  selectItem(item) {
    if (Platform.OS === 'ios') {
      this.props.navigator.push({
        title: item.title,
        component: QiitaWebView,
        passProps: { item: item }
      });
    } else {
      this.props.navigator.push({
        title: item.title,
        name: 'webView',
        item: item,
      });
    }
  }

  fetchData() {
    fetch(QIITA_URL)
    .then((response) => response.json())
      .then((responseJson) => {
        this.setState({
          items: this.state.items.cloneWithRows(responseJson),
          loaded: true,
        });
      })
      .catch((error) => {
        console.error(error);
      });

  }
}

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