//
//  OnboardingPageView.swift
//  Kizen
//
//  Created by Melvin John on 05/05/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class OnboardingPageView: UIView {
    
    let weightPickerHeight: CGFloat = 60

    let pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    @IBOutlet var exerciseNameLabel: UILabel!
    
    @IBOutlet var decrementButton: UIButton!
    
    @IBOutlet var incrementButton: UIButton!
    
    @IBOutlet var weightLabelButton: UIButton!
    
    @IBOutlet var weightPickerView: UIPickerView!
    
    @IBOutlet var weightPickerSuperViewHeightConstraint: NSLayoutConstraint!
    
    @IBAction func didTapWeightLabelButton(_ sender: Any) {
        
        weightPickerHidden = weightPickerSuperViewHeightConstraint.constant > 0

    }
    
    var weightPickerHidden: Bool = false {
        didSet {
            
            if weightPickerHidden {
                weightPickerSuperViewHeightConstraint.constant = 0
            } else {
                weightPickerSuperViewHeightConstraint.constant = weightPickerHeight
            }
            
            UIView.animate(withDuration: 0.3) { [weak self] in
                
                let weightPickerHidden = self?.weightPickerHidden ?? true
                
                self?.weightPickerView.alpha = weightPickerHidden ? 0 : 1
                self?.layoutIfNeeded()
                
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let pickerViewPreviousY = weightPickerView.frame.origin.y
        let pickerViewHeight = weightPickerView.frame.height

        weightPickerView.frame = CGRect(x: 0,
                                        y: pickerViewPreviousY,
                                        width: frame.width,
                                        height: pickerViewHeight)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
        
        let pickerViewPreviousY = weightPickerView.frame.origin.y
        let pickerViewHeight = weightPickerView.frame.height
        let pickerViewWidth = weightPickerView.frame.width

        weightPickerView.transform = CGAffineTransform(rotationAngle: horizontalPickerViewRotationAngle)
        
        weightPickerView.frame = CGRect(x: 0,
                                        y: pickerViewPreviousY,
                                        width: pickerViewWidth,
                                        height: pickerViewHeight)
        
        weightPickerHidden = true
        
    }
    
    
    var horizontalPickerViewRotationAngle: CGFloat {
        return 90 * (.pi / -180)
    }
}

extension OnboardingPageView: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}

extension OnboardingPageView: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
