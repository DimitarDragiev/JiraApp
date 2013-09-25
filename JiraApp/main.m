    //
//  main.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NUI/NUISettings.h>
#import "JiraAppAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NUISettings init];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([JiraAppAppDelegate class]));
    }
}
