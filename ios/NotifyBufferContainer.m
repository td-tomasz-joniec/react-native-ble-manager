#import "NotifyBufferContainer.h"

@implementation NotifyBufferContainer

- (instancetype)initWithSize:(NSUInteger)size {
    self = [super init];
    if (self) {
        self.capacity = size;
        self.items = [NSMutableData dataWithCapacity:size];
    }
    return self;
}

- (void)resetBuffer {
    [self.items setLength:0];
}

- (NSInteger)remaining {
    return self.capacity - self.items.length;
}

- (void)put:(NSData *)value {
    NSInteger restLength = value.length - [self remaining];
    NSData *toInsert = restLength > 0 ? [NSData dataWithData: [value subdataWithRange:NSMakeRange(0, [self remaining])]] : [NSData dataWithData: value];
    [self.items appendData: toInsert];
}

- (BOOL)isBufferFull {
    return (self.items.length >= self.capacity);
}

- (NSUInteger)size {
    return self.items.length;
}


- (void)dealloc {
    self.items = [NSMutableData dataWithLength:0];
}

@end
