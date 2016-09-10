//
//  ClockViewController.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

import UIKit


class ClockViewController: UIViewController, CountryListViewControllerDelegate {

    @IBOutlet var clock: Clock!
    @IBOutlet var cityNameLabel: UILabel!
    var currentCity: City!{
        didSet{
           clock.city = currentCity
           cityNameLabel.text = currentCity.name
        }
    }
    // MARK: CountryListViewController Delegate
    func didSelectCity(city: City) {
        currentCity = city
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCity = TableViewDataSource.createSampleData().first!
        cityNameLabel.textColor = ClockStyleKit.lightHandColor
        
    }
    override func addChildViewController(childController: UIViewController) {
        super.addChildViewController(childController)
        childController.setValue(self, forKey: "countryDelegate")
    }
}
