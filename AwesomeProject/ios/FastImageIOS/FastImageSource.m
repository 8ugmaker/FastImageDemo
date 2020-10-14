//
//  FastImageSource.m
//  FastImageIOS
//
//  Created by huyanxin on 2020/10/14.
//

#import "FastImageSource.h"

@implementation FastImageSource

- (instancetype)initWithURL:(NSURL *)url
                   priority:(FPriority)priority
                    headers:(NSDictionary *)headers
               cacheControl:(FCacheControl)cacheControl
{
    self = [super init];
    if (self) {
        _url = url;
        _priority = priority;
        _headers = headers;
        _cacheControl = cacheControl;
    }
    return self;
}

@end
