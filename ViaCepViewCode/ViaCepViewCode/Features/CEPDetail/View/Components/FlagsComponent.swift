//
//  FlagsComponent.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

class FlagsComponent: UIView {
    let flag: DSFlag
    
    private lazy var brazilFlagImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = DSFlag.brazil.image
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var stateFlagImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = flag.image
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var stackHorizontal: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = -16
        stack.alignment = .center
        
        return stack
    }()
    
    init(flag: DSFlag) {
        self.flag = flag
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension FlagsComponent {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(stackHorizontal)
        stackHorizontal.addArrangedSubview(brazilFlagImageView)
        stackHorizontal.addArrangedSubview(stateFlagImageView)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            stackHorizontal.topAnchor.constraint(equalTo: topAnchor),
            stackHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackHorizontal.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            brazilFlagImageView.heightAnchor.constraint(equalToConstant: 96),
            brazilFlagImageView.widthAnchor.constraint(equalToConstant: 96),
            
            stateFlagImageView.heightAnchor.constraint(equalToConstant: 96),
            stateFlagImageView.widthAnchor.constraint(equalToConstant: 96),
        ])
    }
}
