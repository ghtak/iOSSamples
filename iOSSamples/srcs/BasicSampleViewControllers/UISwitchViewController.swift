//
//  UISwitchViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/30.
//

import UIKit

class UISwitchViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    func setupUI(){
        self.navigationItem.title = "UISwitch"
        let sw = UISwitch()
        self.view.addSubview(sw)
        sw.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.center.equalTo(self.view)
        }
        
        sw.rx.value.asDriver(onErrorJustReturn: false)
            .skip(1)
            .drive(
                onNext: {
                    print($0)
                }
            )
            .disposed(by: disposeBag)
        
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
