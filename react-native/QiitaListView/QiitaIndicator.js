import React, { Component } from 'react';
import { 
  ActivityIndicator,
  StyleSheet,
} from 'react-native';

export default class QiitaIndicator extends Component {

  constructor(props) {
    super(props);
    this.state = {
      animating: true,
    };
  }

  render() {
    return (
      <ActivityIndicator
        animating={this.state.animating}
        style={styles.loading}
        size="large"
      />
    );
  }
}

const styles = StyleSheet.create({
  loading: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});