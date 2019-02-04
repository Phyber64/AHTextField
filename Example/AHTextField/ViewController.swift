//
//  ViewController.swift
//  AHTextField
//
//  Created by Phyber64 on 02/04/2019.
//  Copyright (c) 2019 Phyber64. All rights reserved.
//

import UIKit
import AHTextField

class ViewController: UIViewController {
    
    let appleGreen = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1.0)
    let appleRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
    let appleBlue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
    
    let gradient1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.colors = [UIColor(red: 10/255, green: 89/255, blue: 248/255, alpha: 1.0).cgColor, UIColor(red: 132/255, green: 18/255, blue: 222/255, alpha: 1.0).cgColor]
        return gradient
    }()
    
    let gradient2: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.colors = [UIColor(red: 248/255, green: 10/255, blue: 10/255, alpha: 1.0).cgColor, UIColor(red: 255/255, green: 122/255, blue: 0/255, alpha: 1.0).cgColor]
        return gradient
    }()
    
    lazy var textField: AHTextField = {
        let textField = AHTextField(textPadding: UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 15))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 25
        textField.clearButtonMode = .always
        textField.setBorders(width: 3, gradient: gradient1)
        textField.placeholder = "Name"
        return textField
    }()
    
    lazy var textField2: AHTextField = {
        let textField = AHTextField(textPadding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setBorders(for: [.bottom], width: 3, gradient: gradient2)
        textField.placeholder = "Surname"
        return textField
    }()
    
    lazy var textField3: AHTextField = {
        let textField = AHTextField(textPadding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftViewImage(image: UIImage(named: "lock"), size: CGSize(width: 25, height: 25), tintColor: .gray)
        textField.setRightViewImage(image: UIImage(named: "cancel"), size: CGSize(width: 30, height: 30), tintColor: appleRed)
        textField.leftViewPadding.left = 8
        textField.setBorders(width: 2, color: appleBlue)
        textField.placeholder = "Password"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(textField)
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        
        view.addSubview(textField2)
        textField2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        textField2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75).isActive = true
        
        view.addSubview(textField3)
        textField3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField3.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        textField3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
}

