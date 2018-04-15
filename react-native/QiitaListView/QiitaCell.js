import React, { Component } from 'react';
import { 
  StyleSheet,
  View,
  Text, 
  Image,
  TouchableHighlight,
} from 'react-native';

export default class QiitaCell extends Component {
    constructor(props) {
        super(props)
        this.onSelect = this.props.onSelect
        this.item = this.props.item
    }
    
  render() {
    return (
      <TouchableHighlight  onPress={() => this.onSelect()}>
        <View style={styles.row}>
        <Image
          source={{uri: this.item.user.profile_image_url}}
          style={styles.thumbnail}/>
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{this.item.title}</Text>
          <Text style={styles.name}>{this.item.user.id}</Text>
        </View>
      </View>
      </TouchableHighlight>
    )
  }
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'white',
  },
  rightContainer: {
    flex: 1,
  },
  title: {
    fontSize: 15,
    margin: 8,
    textAlign: 'left',
  },
  name: {
    fontSize: 12,
    margin: 8,
    textAlign: 'left',
  },
  thumbnail: {
    width: 80,
    height: 80,
    margin: 2,
  },
});