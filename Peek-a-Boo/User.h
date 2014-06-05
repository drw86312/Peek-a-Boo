//
//  User.h
//  Peek-a-Boo
//
//  Created by David Warner on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSData * profilepic;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * premiumMember;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * zipcode;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSSet *photos;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(NSManagedObject *)value;
- (void)removePhotosObject:(NSManagedObject *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end
