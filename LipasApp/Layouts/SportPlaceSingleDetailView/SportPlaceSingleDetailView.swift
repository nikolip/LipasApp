//
//  SportPlaceSingleDetailView.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import UIKit

class SportPlaceSingleDetailView: UIView {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBInspectable var height: CGFloat = 100.0
    
    let nibIdentifier = "SportPlaceSingleDetailView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibIdentifier, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
