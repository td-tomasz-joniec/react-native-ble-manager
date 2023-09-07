#import <Foundation/Foundation.h>


@interface NotifyBufferContainer : NSObject

@property (nonatomic, strong) NSMutableData *items;
@property NSUInteger capacity;

- (instancetype)initWithSize:(NSUInteger)size;
- (void)resetBuffer;
- (void)put:(NSData *)value;
- (BOOL)isBufferFull;
- (NSUInteger)size;

@end
