//
//  CountryListViewController.h
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

#import <UIKit/UIKit.h>
// forward declaring the protocol
@protocol CountryListViewControllerDelegate;

@interface CountryListViewController : UITableViewController
@property (weak, nonatomic)  id<CountryListViewControllerDelegate> countryDelegate;
@end
