//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/20/21.
//

import UIKit


class DrawingsViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    @objc var enumCallback:( (PaintingType) -> Void )?
    var paintingType: PaintingType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.layer.shadowOffset = CGSize(width: 0, height: 0)
        navigationView.layer.shadowRadius = 0.5
        navigationView.layer.shadowOpacity = 0.25
        navigationView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    

    @IBAction func planetTapped(_ sender: Any) {
        paintingType = planetPaintingType
    }
    
    @IBAction func headTapped(_ sender: Any) {
        paintingType = headPaintingType
    }
    
    @IBAction func treeTapped(_ sender: Any) {
        paintingType = treePaintingType
    }
    
    @IBAction func landscapeTapped(_ sender: Any) {
        paintingType = landscapePaintingType
    }
    
    @IBAction func back(_ sender: Any) {
        guard let paintingTypeU = paintingType else {
            self.enumCallback?(nonSelectedPaintingType)
            return}
        self.enumCallback?(paintingTypeU)
    }
    
}


