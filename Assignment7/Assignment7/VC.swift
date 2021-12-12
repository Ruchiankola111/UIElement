//
//  ViewController.swift
//  Assignment7
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class VC: UIViewController {
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleCompose))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        toolBar.items = [item1, space, gallery]
        return toolBar
    }()
    @objc private func handleCompose() {
        print("compose called")
    }
    @objc private func handleGallery() {
        print("Gallery called")
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        let item3 = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 3)
        tabBar.items = [item1,item2,item3]
        return tabBar
    }()
    private let imagePicker: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = false
        return ip
    }()
    private let segdata = ["Female","Male","Child"]
    private let mysegement: UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Female", at: 0, animated: true)
        seg.insertSegment(withTitle: "Male", at: 0, animated: true)
        seg.insertSegment(withTitle: "Child", at: 0, animated: true)
        seg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)], for:.selected)
        seg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        seg.tintColor = UIColor(red: 0.01, green: 0.22, blue: 0.29, alpha: 1.00)
        seg.backgroundColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        seg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        seg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        //seg.addTarget(self, action: #selector(handlesegdata), for: .valueChanged)
        return seg
    }()
/*
    @objc private func handlesegdata() {
        print(mysegement.selectedSegmentIndex)
    }
    */
    private let myimageview:UIImageView = {
        let imgview = UIImageView()
        //imgview.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha:  1.0).cgColor
        //imgview.layer.masksToBounds = false
        imgview.image = UIImage(named: "p4")
        imgview.layer.cornerRadius = imgview.frame.size.height/2
        imgview.contentMode = .scaleAspectFill
        imgview.clipsToBounds = true
        //imgview.layer.borderWidth = 1.0
       /* image.layer.borderWidth=1.0
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.whiteColor().CGColor
        image.layer.cornerRadius = image.frame.size.height/2
        image.clipsToBounds = true*/
        return imgview
    }()
   
    
    private let mylabelQ:UILabel = {
        let lblq = UILabel()
        lblq.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lblq.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lblq.text = "Quantity"
        return lblq
    }()
    
    private let mystepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(handlestepper), for: .valueChanged)
        return stepper
    }()
    @objc func handlestepper() {
        print(mystepper.value)
    }
    
    private let mylabelS:UILabel = {
        let lbls = UILabel()
        lbls.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lbls.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lbls.text = "Size"
        return lbls
    }()
    
    private let myslider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleslider), for: .valueChanged)
        slider.thumbTintColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        slider.minimumTrackTintColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)

        return slider
    }()
    @objc func handleslider() {
        print(myslider.value)
    }
    
    private let mylabelN:UILabel = {
        let lbln = UILabel()
        lbln.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lbln.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lbln.text = "Notification"
        return lbln
    }()
    
    private let myswitch:UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        switcher.addTarget(self, action: #selector(handleswitcher), for: .valueChanged)
        return switcher
    }()
    @objc func handleswitcher() {
        print(myswitch.isOn)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mysegement)
        view.addSubview(toolBar)
        view.addSubview(tabBar)
        tabBar.delegate = self
        view.addSubview(myimageview)
        imagePicker.delegate = self
        view.addSubview(mylabelQ)
        view.addSubview(mystepper)
        view.addSubview(mylabelS)
        view.addSubview(myslider)
        view.addSubview(mylabelN)
        view.addSubview(myswitch)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40.0
        toolBar.frame=CGRect(x:0, y:0, width:view.frame.size.width, height: toolBarHeight)
        mysegement.frame = CGRect(x: 5, y: toolBar.bottom + 5, width: view.width - 10, height: 30)
        myimageview.frame = CGRect(x: 20, y: mysegement.bottom + 40, width: 335, height: 335)
        mylabelQ.frame = CGRect(x: 20, y: myimageview.bottom + 20, width: view.width - 220, height: 20)
        mystepper.frame = CGRect(x: mylabelQ.width + 20, y: myimageview.bottom + 20, width: view.width - 180, height: 30)
        mylabelS.frame = CGRect(x: 20, y: mylabelQ.bottom + 20, width: view.width - 220, height: 20)
        myslider.frame = CGRect(x: mylabelS.width + 20, y: mylabelQ.bottom + 20, width: view.width - 180, height: 30)
        mylabelN.frame = CGRect(x: 20, y: mylabelS.bottom + 20, width: view.width - 220, height: 20)
        myswitch.frame = CGRect(x: mylabelN.width + 20, y: mylabelS.bottom + 20, width: view.width - 180, height: 30)
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49.0
        tabBar.frame=CGRect(x:0, y:view.frame.size.height - tabBarHeight, width:view.frame.size.width, height: tabBarHeight)
        

    }

}

extension VC: UITabBarDelegate {
    
    func tabBar(_tabBar: UITabBar, didSelect item:UITabBarItem){
        print(item.tag)
    }
    
}

extension VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myimageview.image = selectedImage
            
        }
        picker.dismiss(animated: true)
    }
}


