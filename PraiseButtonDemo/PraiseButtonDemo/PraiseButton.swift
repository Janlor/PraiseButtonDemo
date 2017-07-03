//
//  PraiseButton.swift
//  PraiseButtonDemo
//
//  Created by Janlor on 03/07/2017.
//  Copyright © 2017 Janlor. All rights reserved.
//

import UIKit

class PraiseButton: UIButton {
    
    // MARK: - Override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layout()
    }
    
    override var isHighlighted: Bool {
        set { }
        get { return false }
    }
    
    // MARK: - Private Functions
    
    func layout() {
        setTitleColor(.gray, for: .normal)
        setTitleColor(.orange, for: .selected)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 12)

        setImage(#imageLiteral(resourceName: "praise"), for: .normal)
        setImage(#imageLiteral(resourceName: "praise_touch"), for: .selected)
        
        titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0)

        addTarget(self, action: #selector(praiseButtonDidClicked(button:)), for: .touchUpInside)
    }
    
    @objc private func praiseButtonDidClicked(button: UIButton) {
        isSelected = true
        // 展示动效
        popOutsideWithDuration(duration: 0.5)
        // 模拟数据
        let title = titleLabel?.text ?? ""
        var praiseNum = Int(title) ?? 0
        praiseNum += 1
        setTitle("\(praiseNum)", for: .normal)
    }
    
    private func popOutsideWithDuration(duration: TimeInterval) {
        imageView?.transform = .identity
        
        if let imageView = imageView, imageView.isAnimating {
            imageView.stopAnimating()
        }
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeLinear, animations: { [weak self] in
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 2, animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.imageView?.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
            })
            UIView.addKeyframe(withRelativeStartTime: 1 / 2, relativeDuration: 1 / 2, animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.imageView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                strongSelf.imageView?.stopAnimating()
            })
        }, completion: nil)
    }
}
