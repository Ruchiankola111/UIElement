//
//  login.swift
//  Assignment7
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit


class profile: UIViewController {
    private let mylabelN:UILabel = {
        let lbln = UILabel()
        lbln.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lbln.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lbln.text = "Name"
        return lbln
    }()
    private let Mytextfield:UITextField = {
        let txtfield = UITextField()
        txtfield.placeholder = "Enter Your Name"
        txtfield.textAlignment = NSTextAlignment.left
        txtfield.layer.borderWidth = 2.0
        txtfield.layer.borderColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00).cgColor
        txtfield.font =  UIFont.init(name: "AppleSDGothicNeo-Thin", size: 18)
        txtfield.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        txtfield.layer.cornerRadius = 10
        return txtfield
    }()
    private let mylabelM:UILabel = {
        let lblm = UILabel()
        lblm.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lblm.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lblm.text = "Molibe No."
        return lblm
    }()
    private let Mytextfield2:UITextField = {
        let txtfield2 = UITextField()
        txtfield2.placeholder = "Enter Your Mobile No."
        txtfield2.textAlignment = NSTextAlignment.left
        txtfield2.layer.borderWidth = 2.0
        txtfield2.layer.borderColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00).cgColor
        txtfield2.font =  UIFont.init(name: "AppleSDGothicNeo-Thin", size: 18)
        txtfield2.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        txtfield2.layer.cornerRadius = 10
        return txtfield2
    }()
    private let mylabelD:UILabel = {
        let lbld = UILabel()
        lbld.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lbld.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lbld.text = "Date Of Birth"
        return lbld
    }()
    
    
    private let datePicker:UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        //datepicker.timeZone = timezone(secondsFromGMT: 0)
        picker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        return picker
    }()
    @objc func handleDateChange() {
        print(datePicker.date)
    }
    private let mylabelC:UILabel = {
        let lblc = UILabel()
        lblc.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lblc.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lblc.text = "City"
        return lblc
    }()
    private let mylabelS:UILabel = {
        let lbls = UILabel()
        lbls.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lbls.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lbls.text = "State"
        return lbls
    }()
    private let pickerView = UIPickerView()
    private let pickerData = ["Surat", "Junagadh", "Rajkot","Vapi","Navsari","Bharuch","Baroda","Pune"]
    private let pickerData2 = ["Gujarat","Maharastra","Madyapradesh","Kolkata","Delhi","Chennai","Bangal","Uttarpradesh","Shreelanka"]
    
    private let mylabelA:UILabel = {
        let lbla = UILabel()
        lbla.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        lbla.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        lbla.text = "Address"
        return lbla
    }()
    private let Mytextview:UITextView = {
        let txtview = UITextView()
        txtview.textAlignment = NSTextAlignment.left
        txtview.layer.borderWidth = 2.0
        txtview.layer.borderColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00).cgColor
        txtview.font = UIFont.init(name: "AppleSDGothicNeo-Thin", size: 25)
        //txtview.font = UIFont.systemFont(ofSize: 12)
        txtview.textColor = UIColor(red: 0.00, green: 0.09, blue: 0.20, alpha: 1.00)
        txtview.layer.cornerRadius = 10
        return txtview
    }()
    
    private let myButton:UIButton = {
        let button=UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
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
    
    
    private let myProgressView:UIProgressView = {
        let progressview = UIProgressView()
        progressview.isHidden = true
        progressview.setProgress(0.0, animated: true)
        return progressview
    }()
    @objc func handleClick() {
        myProgressView.frame = CGRect(x: 20, y: view.height - 20, width: view.width - 40, height: 20)

        if self.myProgressView.isHidden {
            myProgressView.isHidden = false
            UIView.animate(withDuration: 300.0) {
                self.myProgressView.setProgress(1.0, animated: true)
            }
            
        }
        let vc = VC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 150.0) {
            self.myProgressView.setProgress(1.0, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        view.addSubview(mylabelN)
        view.addSubview(Mytextfield)
        view.addSubview(mylabelM)
        view.addSubview(Mytextfield2)
        view.addSubview(mylabelD)
        view.addSubview(datePicker)
        view.addSubview(mylabelC)
        view.addSubview(mylabelS)
        view.addSubview(mylabelA)
        view.addSubview(Mytextview)
        view.addSubview(myButton)
        view.addSubview(myProgressView)
        
        view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mylabelN.frame = CGRect(x: 20, y: 40, width: view.width - 40, height: 30)
        Mytextfield.frame = CGRect(x: 20, y: mylabelN.bottom + 10, width: view.width - 40, height: 40)
        mylabelM.frame = CGRect(x: 20, y: Mytextfield.bottom + 10, width: view.width - 40, height: 40)
        Mytextfield2.frame = CGRect(x: 20, y: mylabelM.bottom + 10, width: view.width - 40, height: 40)
        mylabelD.frame = CGRect(x: 20, y: Mytextfield2.bottom + 10, width: view.width - 40, height: 40)
        datePicker.frame = CGRect(x: 20, y: mylabelD.bottom + 10, width: view.width - 40, height: 40)
        mylabelC.frame = CGRect(x: 20, y: datePicker.bottom + 10, width: view.width / 2, height: 30)
        mylabelS.frame = CGRect(x: mylabelC.width, y: datePicker.bottom + 10, width: view.width - 40, height: 30)
        pickerView.frame = CGRect(x: 20, y: mylabelC.bottom + 10, width: view.width - 40, height: 40)
        mylabelA.frame = CGRect(x: 20, y: pickerView.bottom + 10, width: view.width - 40, height: 30)
        Mytextview.frame = CGRect(x: 20, y: mylabelA.bottom + 10, width: view.width - 40, height: 120)
        myButton.frame = CGRect(x: 20, y: Mytextview.bottom + 10, width: view.width - 40, height: 40)
    }
}
extension profile: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2  //number of col
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerData.count
        } else {
            return pickerData2.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickerData[row]
        } else {
            return pickerData2[row]
        }
        
    }
    
}
