import React, { Component } from 'react';
import { 
  StyleSheet,
  WebView,
} from 'react-native';

import QiitaIndicator from './QiitaIndicator';

export default class QiitaWebView extends Component {
  constructor(props) {
    super(props)
    this.renderLoadingView = this.renderLoadingView.bind(this)
    console.log(this.props.item.url)
  }
  render() {
    return (
      <WebView
        source={{uri: this.props.item.url}}
        startInLoadingState={true}
        renderLoading={() => this.renderLoadingView()}
        />
    )
  }

  renderLoadingView() {
    return (
        <QiitaIndicator />
    );
  }
}