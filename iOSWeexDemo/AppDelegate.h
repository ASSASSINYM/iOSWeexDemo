//
//  AppDelegate.h
//  iOSWeexDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

