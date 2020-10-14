//
//  RCTConvert+FastImage.m
//  FastImageIOS
//
//  Created by huyanxin on 2020/10/14.
//

#import "RCTConvert+FastImage.h"
#import "FastImageSource.h"

@implementation RCTConvert (FastImage)

RCT_ENUM_CONVERTER(FPriority, (@{
                                   @"low": @(FPriorityLow),
                                   @"normal": @(FPriorityNormal),
                                   @"high": @(FPriorityHigh),
                                   }), FPriorityNormal, integerValue);

RCT_ENUM_CONVERTER(FCacheControl, (@{
                                       @"immutable": @(FCacheControlImmutable),
                                       @"web": @(FCacheControlWeb),
                                       @"cacheOnly": @(FCacheControlCacheOnly),
                                       }), FCacheControlImmutable, integerValue);

+ (FastImageSource *)FastImageSource:(id)json {
    if (!json) {
        return nil;
    }
    
    NSString *uriString = json[@"uri"];
    NSURL *uri = [self NSURL:uriString];
    
    FPriority priority = [self FPriority:json[@"priority"]];
    FCacheControl cacheControl = [self FCacheControl:json[@"cache"]];
    
    NSDictionary *headers = [self NSDictionary:json[@"headers"]];
    if (headers) {
        __block BOOL allHeadersAreStrings = YES;
        [headers enumerateKeysAndObjectsUsingBlock:^(NSString *key, id header, BOOL *stop) {
            if (![header isKindOfClass:[NSString class]]) {
                RCTLogError(@"Values of HTTP headers passed must be  of type string. "
                            "Value of header '%@' is not a string.", key);
                allHeadersAreStrings = NO;
                *stop = YES;
            }
        }];
        if (!allHeadersAreStrings) {
            // Set headers to nil here to avoid crashing later.
            headers = nil;
        }
    }
    
    FastImageSource *imageSource = [[FastImageSource alloc] initWithURL:uri priority:priority headers:headers cacheControl:cacheControl];
    
    return imageSource;
}

RCT_ARRAY_CONVERTER(FastImageSource);

@end
