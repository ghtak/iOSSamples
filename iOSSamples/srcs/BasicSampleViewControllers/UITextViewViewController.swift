//
//  UITextViewViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/20.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class UITextViewViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        let textView = UITextView()
        self.view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 5.0
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .gray
        textView.textAlignment = .center
        //textView.dataDetectorTypes = UIDataDetectorTypes.all
        textView.layer.shadowOpacity = 0.5
        //textView.isEditable = false
        textView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalToSuperview().dividedBy(2)
        }
        
        textView.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(
                onNext: {
                    print($0)
                }
            ).disposed(by: disposeBag)
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
