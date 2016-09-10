//
//  CityCell.swift
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//
import UIKit

class CityCell: UITableViewCell, ICellConfigurator {
    
    @IBOutlet private var cityNameLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.hidesWhenStopped = true
    }
    func configureForItem(item: AnyObject!) {
        let city = item as! City
        cityNameLabel.text = city.name
    }
}
