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
        
        textView.backgroundColor = .gray
        textView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(100)
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
