//
//  BookNowViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 29/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookNowViewController: BaseViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,TopBarDelegate {
    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var imgDriverNotes: UIImageView!
    @IBOutlet weak var lblSelectVehicle: UILabel!
     @IBOutlet weak var btnSubmit: UIButton!
     @IBOutlet weak var tfDriverNotes: UITextField!
     @IBOutlet weak var lblDriverNotes: UILabel!
     @IBOutlet weak var tfEnterWeight: UITextField!
     @IBOutlet weak var imgEnterWeight: UIImageView!
     @IBOutlet weak var lblEnterWeight: UILabel!
     @IBOutlet weak var tfMaterialPicker: UITextField!
     @IBOutlet weak var imgSelectMaterial: UIImageView!
     @IBOutlet weak var lblSelectMaterial: UILabel!
     @IBOutlet weak var tfSelectVehicle: UITextField!
     @IBOutlet weak var imgSelectVehicle: UIImageView!
     @IBOutlet weak var tfweightType: UITextField!
    
    var picklocation : String!
    var destinationLocation : String!
    let picker1 = UIPickerView()
    
    let vehicles = ["2AX-single","3AX-single","3AX-tendem","4AX-single","4AX-single-tendem"]
    let goods = ["Home Materials","Office Materials","University Materials"]
    let weightType = ["KG","TON"]
    let images:[String] = ["large","small","tow","16wheeler","home"]
    var activeTextField = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfSelectVehicle.delegate = self
               tfMaterialPicker.delegate = self
               tfweightType.delegate = self
               
               createToolbar()
               createPickerView()
              

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if let container = self.mainContainer {
               container.delegate = self
               container.setTitle(title: "Book Now")
               container.setMenuButton(isBack: true)
           }
       }
     func createPickerView()
     {
         picker1.delegate = self
         picker1.dataSource = self
         picker1.delegate?.pickerView?(picker1, didSelectRow: 0, inComponent: 0)
         tfSelectVehicle.inputView = picker1
         tfMaterialPicker.inputView = picker1
         tfweightType.inputView = picker1
         
      
         
     }
     func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
         return 100
     }
     
     func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
         switch activeTextField {
         case 1:
             return 60
         case 2:
             return 40
         case 3:
             return 40
         default:
             return 40
         }
         
     }

     func createToolbar()
     {
         let toolbar = UIToolbar()
         toolbar.sizeToFit()
         let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closePickerView))
         toolbar.setItems([doneButton], animated: true)
         toolbar.isUserInteractionEnabled = true
         tfSelectVehicle.inputAccessoryView = toolbar
         tfMaterialPicker.inputAccessoryView = toolbar
         tfweightType.inputAccessoryView = toolbar
        
        
     }
     
     @objc func closePickerView()
     {
         view.endEditing(true)
     }
     
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
         switch activeTextField
         {
         case 1:
             return vehicles.count
         case 2:
             return goods.count
         case 3:
             return weightType.count
         default:
             return weightType.count
         
         }
     }
     
     
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
     {
         switch activeTextField{
         case 1:
             return vehicles[row]
         case 2:
             return goods[row]
         case 3:
             return weightType[row]
         default:
             return weightType[row]
         }

     }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch activeTextField{
            
            case 1:
                tfSelectVehicle.text =  vehicles[row]
                break
            case 2:
                tfMaterialPicker.text = goods[row]
                break
            case 3:
             tfweightType.text = weightType[row]
            default:
                tfweightType.text =  weightType[row]
                break
                
            }
        }
     
     
     func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
         
         
         switch activeTextField{
         case 1:
             print(activeTextField)
            let parentView = UIView()
               let label = UILabel(frame: CGRect(x: 60, y: 0, width: 80, height: 50))
               let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height:50))
               imageView.image = UIImage(named: images[row])
               label.text = vehicles[row]
               parentView.addSubview(label)
               parentView.addSubview(imageView)
               
               return parentView
          
         case 2:
             var label:UILabel
                      
                      if let v = view as? UILabel{
                          label = v
                      }
                      else{
                          label = UILabel()
                      }
                  label.textAlignment = .left
                      label.font = UIFont(name: "Helvetica", size: 20)
                      label.text = goods[row]
                      return label
       
         case 3:
             var label:UILabel
             if let v = view as? UILabel{
                 label = v
             }
             else{
                 label = UILabel()
             }
             label.textAlignment = .left
             label.font = UIFont(name: "Helvetica", size: 20)
             label.text = weightType[row]
             return label
         default:
             return UILabel()
             
         }
     }
     
       func textFieldDidBeginEditing(_ textField: UITextField) {
             
             switch textField {
             case tfSelectVehicle:
                 activeTextField = 1
                 picker1.reloadAllComponents()
             case tfMaterialPicker:
                 activeTextField = 2
                 picker1.reloadAllComponents()
             case tfweightType:
                 activeTextField = 3
                 picker1.reloadAllComponents()
             default:
                 activeTextField = 0
             }
             
         }
   
     
    
    @IBAction func actionSubmit(_ sender: Any) {
       
        
        let params : ParamsAny = ["userId": "5eb6a9447a7c2d186c8d217c","sourceAddress": self.picklocation!,"destinationAddress": self.destinationLocation!,"requestType":"Current","vehicleName": self.tfSelectVehicle!.text,"goodsType": self.tfMaterialPicker!.text,"weightType": self.tfweightType!.text,"weight": self.tfEnterWeight!.text,"driverNotes": self.tfDriverNotes.text!]
        self.postRequest(params: params)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookNowViewController{
    func postRequest(params : ParamsAny){
        PostRequestService.shared().postRequest(params: params) { (message, success) in
            if(success){
                if let vc = self.storyboard!.instantiateViewController(withIdentifier: "ConfirmRideViewController") as? ConfirmRideViewController{
                vc.pickupAddress = self.picklocation
                   
                    if(self.lblSelectVehicle.text == "2AX-single"){
                        vc.baseFare = 300
                    }
                    else if(self.lblSelectVehicle.text == "3AX-single"){
                         vc.baseFare = 500
                    }
                    else if(self.lblSelectVehicle.text == "3AX-tendem"){
                         vc.baseFare = 700
                    }
                    else if(self.lblSelectVehicle.text == "4AX-single"){
                         vc.baseFare = 900
                    }
                    else if(self.lblSelectVehicle.text == "4AX-single-tendem"){
                         vc.baseFare = 1200
                    }
                    self.navigationController?.pushViewController(vc, animated: true)
                        
                    }
            }
            else{
                self.showAlertVIew(message: message, title: "Transwide User")
            }
        }
    }
}
