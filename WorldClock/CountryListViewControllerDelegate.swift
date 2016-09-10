//
//  CountryListViewControllerDelegate.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//


@objc protocol CountryListViewControllerDelegate: NSObjectProtocol {

    func didSelectCity(city: City)
}
