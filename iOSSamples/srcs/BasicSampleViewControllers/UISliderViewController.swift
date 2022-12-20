//
//  UISliderViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/20.
//

import UIKit

class UISliderViewController: BasicViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI() {
        self.navigationItem.title = "UISlider"

        let slider = UISlider()
        self.view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview().inset(50)
            make.height.lessThanOrEqualTo(100)
        }
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.5
        slider.minimumTrackTintColor = .black
        slider.maximumTrackTintColor = .gray

        slider.rx.value.map { CGFloat($0) }
            .asDriver(onErrorJustReturn: 0)
            .drive(
                onNext: {
                    print($0)
                    self.view.backgroundColor = UIColor(red: $0, green: 0, blue: 0, alpha: 1)
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
