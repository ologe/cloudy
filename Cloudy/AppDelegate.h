//
//  AppDelegate.h
//  Cloudy
//
//  Created by Eugeniu Olog on 20/12/2018.
//  Copyright © 2018 Eugeniu Olog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

