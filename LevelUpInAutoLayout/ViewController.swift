//
//  ViewController.swift
//  LevelUpInAutoLayout
//
//  Created by windowcow on 9/14/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        let topLeadingLabel = makeLabel(withText: "topLeading")
        let button = makeButton(withText: "bottomCenter")
        
        view.addSubview(topLeadingLabel)
        view.addSubview(button)
        
        
        /** MARK: 5.1. 이렇게 하면 상태바를 침범한다.
         
         상태바, 네비게이션바, 탭 컨트롤이 아래 있는 경우에
         해당 ViewController가 가지고 있는 SafeAreaLayoutGuide를 고려해서 view에도 적용해야한다.
         */
//        topLeadingLabel.topAnchor
//            .constraint(equalTo: view.topAnchor, constant: 8).isActive = true
//        topLeadingLabel.leadingAnchor
//            .constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        topLeadingLabel.topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                        constant: 8).isActive = true
        
        topLeadingLabel.leadingAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                        constant: 8).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        
    }

    // make*Label* 같은 이름으로 짓는다.
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        
        return button
    }
}

#Preview {
    ViewController()
}
