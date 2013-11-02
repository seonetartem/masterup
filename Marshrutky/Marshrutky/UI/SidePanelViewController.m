//
//  SidePanelViewController.m
//  Marshrutky
//
//  Created by Artem Paliy on 11/2/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "SidePanelViewController.h"

@interface SidePanelViewController()

@end

@implementation SidePanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [self.storyboard instantiateViewControllerWithIdentifier:@"mapViewController"];
    
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
