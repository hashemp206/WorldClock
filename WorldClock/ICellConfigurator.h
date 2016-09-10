//
//  ICellConfiguratior.h
//  iNote
//
//  Created by Hashem Aboonajmi on 9/12/15.
//  Copyright (c) 2015 Hashem Aboonajmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICellConfigurator <NSObject>

- (void)configureForItem:(id)item;

@end
