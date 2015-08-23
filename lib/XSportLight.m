//
//  XSportLight.m
//  XSportLight
//
//  Created by xlx on 15/8/22.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

#import "XSportLight.h"

@interface XSportLight ()


@property (nonatomic,  ) int index;

@end
@implementation XSportLight
-(id)init{
    self = [super init];
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    return  self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    _index = 0;
    [self show];
}

-(void)doNext
{
    NSString *message = _messageArray[_index];
    [modalState presentModalMessage:message where:self.navigationController.view];
}

#pragma mark ---------------------------------->>
#pragma mark -------------->>HInt Delegate
-(BOOL)hintStateShouldCloseIfPermitted:(id)hintState
{
    
//        _curType ++;
//    
//        if(_curType >= _index)
//        {
//            _curType = 0;
//            
//            return YES;
//        }
//        [self doNext];
//        return NO;
    
    return YES;
}



-(NSArray*)hintStateRectsToHint:(id)hintState
{
    NSArray* rectArray = nil;
    NSValue *value = _rectArray[_index];
    CGRect rect = value.CGRectValue;
    rectArray = [[NSArray alloc] initWithObjects:[NSValue valueWithCGRect:rect], nil];
    return rectArray;
}
-(void)hintStateWillClose:(id)hintState
{
    NSLog(@"i am about to close: %@",hintState);
}
-(void)hintStateDidClose:(id)hintState
{
    NSLog(@"i closed: %@",hintState);
}




-(void)show{
    modalState = [[EMHint alloc] init];
    [modalState setHintDelegate:self];
    UIView *showView = [modalState presentModalMessage:_messageArray[_index] where:self.view];
    [self.view addSubview:showView];
    
    
   
}









@end
