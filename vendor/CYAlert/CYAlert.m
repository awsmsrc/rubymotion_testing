// CYAlert.m
#import "CYAlert.h"

@implementation CYAlert

+(void)show:(NSString *)message {
  UIAlertView *alert = [[UIAlertView alloc] init];
  alert.title = message;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
  [alert release];
}

@end
