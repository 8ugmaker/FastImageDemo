//
//  FastImageSource.h
//  FastImageIOS
//
//  Created by huyanxin on 2020/10/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FPriority) {
    FPriorityLow,
    FPriorityNormal,
    FPriorityHigh
};

typedef NS_ENUM(NSInteger, FCacheControl) {
    FCacheControlImmutable,
    FCacheControlWeb,
    FCacheControlCacheOnly
};

// Object containing an image uri and metadata.
@interface FastImageSource : NSObject

// uri for image, or base64
@property (nonatomic) NSURL* url;
// priority for image request
@property (nonatomic) FPriority priority;
// headers for the image request
@property (nonatomic) NSDictionary *headers;
// cache control mode
@property (nonatomic) FCacheControl cacheControl;

- (instancetype)initWithURL:(NSURL *)url
                   priority:(FPriority)priority
                    headers:(NSDictionary *)headers
               cacheControl:(FCacheControl)cacheControl;

@end

NS_ASSUME_NONNULL_END
