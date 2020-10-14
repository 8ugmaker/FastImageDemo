//
//  RCTConvert+FastImage.h
//  FastImageIOS
//
//  Created by huyanxin on 2020/10/14.
//

#import <React/RCTConvert.h>

NS_ASSUME_NONNULL_BEGIN

@class FastImageSource;

@interface RCTConvert (FastImage)

+ (FastImageSource *)FastImageSource:(id)json;

@end

NS_ASSUME_NONNULL_END
