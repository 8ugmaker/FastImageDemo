import React, {Component} from 'react';
import FastImage from 'react-native-fast-image';
import {Image, View, Button, Text} from 'react-native';

export default class FastImageDemo extends Component {
  constructor(props) {
    super(props);
    this.state = {
      imageState: false,
    };
  }

  render() {
    return (
      <View
        style={{
          flex: 1,
          justifyContent: 'center',
          alignItems: 'center',
        }}>
        {originImage(this)}
        <Button
          style={{
            width: 50,
            height: 30,
            color: 'red',
          }}
          onPress={() => {
            this.setState(pre => {
              return {
                imageState: !pre.imageState,
              };
            });
          }}
          title="显示image"
        />
        {fastImage(this)}
      </View>
    );
  }
}

const originImage = context => {
  if (context.state.imageState) {
    return (
      <Image
        style={{
          width: 300,
          height: (300 * 193) / 514,
        }}
        source={{
          uri:
            'https://upload.wikimedia.org/wikipedia/commons/d/d9/Van_Gogh_-_Starry_Night_-_Google_Art_Project-x1-y1.jpg',
        }}
        resizeMode={'stretch'}
      />
    );
  } else {
    return null;
  }
};

const fastImage = context => {
  if (context.state.imageState) {
    return (
      <FastImage
        style={{
          width: 300,
          height: (300 * 193) / 514,
        }}
        source={{
          uri:
            'https://upload.wikimedia.org/wikipedia/commons/d/d9/Van_Gogh_-_Starry_Night_-_Google_Art_Project-x1-y1.jpg',
          headers: {Authorization: 'someAuthToken'},
          priority: FastImage.priority.normal,
        }}
        resizeMode={FastImage.resizeMode.contain}
      />
    );
  } else {
    return null;
  }
};
