//
//  AddEventViewController.swift
//  EventMapper
//
//  Created by Gordon Krull on 2018-03-07.
//  Copyright © 2018 GK. All rights reserved.
//

import UIKit
import CoreLocation

class AddEventViewController: UIViewController {
    var coordinate: CLLocationCoordinate2D?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var addEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.title = "Add Event"
    }
    
    private func setupViews() {
        titleLabel.text = "Event Title:"
        subtitleLabel.text = "Event subtitle:"
        titleTextField.placeholder = "Party at Tim's"
        subtitleTextField.placeholder = "Bring your own beer"
        
        addEventButton.setTitle("Add Event", for: .normal)
    }
}
