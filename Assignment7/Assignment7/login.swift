//
//  login.swift
//  Assignment7
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class login: UIViewController , UIScrollViewDelegate {
        
        let scrollView = UIScrollView()
        let pageCon = UIPageControl()

    private let Mytextfield:UITextField = {
        let txtfield = UITextField()
        txtfield.placeholder = "Enter Your Username"
        txtfield.textAlignment = NSTextAlignment.left
        txtfield.layer.borderWidth = 2.0
        txtfield.layer.borderColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00).cgColor
        txtfield.font =  UIFont.init(name: "AppleSDGothicNeo-Thin", size: 18)
        txtfield.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        txtfield.layer.cornerRadius = 10
        return txtfield
    }()
    private let Mytextfield2:UITextField = {
        let txtfield2 = UITextField()
        txtfield2.placeholder = "Enter Your Password"
        txtfield2.textAlignment = NSTextAlignment.left
        txtfield2.layer.borderWidth = 2.0
        txtfield2.layer.borderColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00).cgColor
        txtfield2.font =  UIFont.init(name: "AppleSDGothicNeo-Thin", size: 18)
        txtfield2.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        txtfield2.layer.cornerRadius = 10
        return txtfield2
    }()
    private let myButton:UIButton = {
        let button=UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleclick), for: .touchUpInside)
        button.backgroundColor = .blue
        button.backgroundColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        button.titleLabel?.textColor = UIColor(red: 0.98, green: 0.78, blue: 0.84, alpha: 1.00)
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Thin" , size: 25)
        button.layer.borderColor = UIColor(red: 0.98, green: 0.78, blue: 0.84, alpha: 1.00).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        return button
    }()
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .blue
        activity.hidesWhenStopped = true
        return activity
    }()
    @objc func handleclick() {
        print(myActivityIndicatorView.isAnimating)
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
            if !self.myActivityIndicatorView.isHidden {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                    self.myActivityIndicatorView.stopAnimating()
                    self.myActivityIndicatorView.isHidden = true
                    let vc = profile()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }

override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.setNavigationBarHidden(true, animated: false)
    view.backgroundColor = .white
    view.addSubview(Mytextfield)
    view.addSubview(Mytextfield2)
    view.addSubview(myButton)
    view.addSubview(myActivityIndicatorView)
    let viewsCount = 4
    var prevView = self.view!
    scrollView.delegate = self
    scrollView.isPagingEnabled = true
    pageCon.numberOfPages = viewsCount
    pageCon.currentPage = 0
    pageCon.tintColor = .green
    pageCon.currentPageIndicatorTintColor = .orange
    pageCon.backgroundColor = .blue
    pageCon.translatesAutoresizingMaskIntoConstraints = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)
    view.insertSubview(pageCon, aboveSubview: scrollView)
    NSLayoutConstraint.activate([
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant:20),
        scrollView.heightAnchor.constraint(equalToConstant: 400),
        pageCon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        pageCon.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant:-20),
        ])
    for i in 0..<viewsCount {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "\(i).png")
        imageV.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageV)
        if prevView == self.view {
            
            imageV.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        }
        else {
            
            imageV.leadingAnchor.constraint(equalTo: prevView.trailingAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            
            imageV.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageV.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageV.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            imageV.heightAnchor.constraint(equalToConstant: 400)
            ])
        
        if i == viewsCount - 1 {
            
            imageV.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        }
        
        prevView = imageV
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageCon.currentPage = Int(scrollView.contentOffset.x / self.view.frame.width)
        
    }
}
override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    Mytextfield.frame = CGRect(x: 20, y: 440, width: view.width - 40, height: 40)
    Mytextfield2.frame = CGRect(x: 20, y: Mytextfield.bottom + 30, width: view.width - 40, height: 40)
    myButton.frame = CGRect(x: 20, y: Mytextfield2.bottom + 30, width: view.width - 40, height: 40)
    myActivityIndicatorView.frame = CGRect(x: 145, y: myButton.bottom - 20 , width: 100, height: 100)

    }
}

