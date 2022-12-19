//
//  UITextFieldViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/19.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class UITextFieldViewController: BasicViewController,
    UITextFieldDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UITextField"
        self.setupUI()
    }

    func setupUI() {
        let textfield = UITextField()
        self.view.addSubview(textfield)
        textfield.backgroundColor = .gray
        textfield.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(50)
        }
        //textfield.delegate = self
        
        textfield.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(
                onNext: { text in
                    print(text)
                }
            )
            .disposed(by: disposeBag)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin = \(textField.text ?? "Empty")")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End = \(textField.text ?? "Empty")")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return = \(textField.text ?? "Empty")")
        textField.resignFirstResponder()
        return true
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
