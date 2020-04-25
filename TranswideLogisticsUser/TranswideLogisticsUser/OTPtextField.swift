//
//  OTPtextField.swift
//  TranswideLogisticsUser
//
//  Created by apple on 21/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class OTPtextField: UITextField {
    
    private var digitLabel = [UILabel]()
    private var isconfigured = false
    var defaultcharcterValue = "_"
    
    var didEnterLastdigit:((String)->Void)?
    
    
    private lazy var tapRecognizer:UITapGestureRecognizer = {
     let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
        
    }()
    
    func configure(with slotcount:Int = 6){
        guard isconfigured == false else { return }
        isconfigured.toggle()
        configureTextfield()
        let labelStackView = createLabelsStackView(with: 6)
        addSubview(labelStackView)
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
         ])
        
        
    }
    
    private func configureTextfield(){
        tintColor = .clear
        textColor = .clear
        keyboardType = .phonePad
        //textContentType = .oneTimeCode
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
        
    }
    
    
    
    private func createLabelsStackView(with count:Int = 6) ->UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        for _ in 1 ... count{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
        //    label.backgroundColor = .orange
            label.textColor = .orange
            label.isUserInteractionEnabled = true
            label.text = defaultcharcterValue
            stackView.addArrangedSubview(label)
            digitLabel.append(label)
            
        }
        
        return stackView
        
        
        
        
    }
    @objc
    private func textDidChange(){
        
        
        guard let text = self.text ,text.count <= digitLabel.count else { return }
        
        
        for i in 0..<digitLabel.count {
            let currentLabel = digitLabel[i]
            if i < text.count {
                
                let index  = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            }
            else {
                
                currentLabel.text = defaultcharcterValue
            }
            
        }
        if text.count == digitLabel.count {
            didEnterLastdigit?(text)
            
        }
        
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension OTPtextField:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabel.count || string == ""
        
    }
   
}
