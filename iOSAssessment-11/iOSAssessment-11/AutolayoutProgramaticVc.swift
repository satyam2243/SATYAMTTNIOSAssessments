//
//  AutolayoutProgramaticVc.swift
//  iOSAssessment-11
//
//  Created by Satyam Dixit on 08/10/21.
//

import UIKit

class AutolayoutProgramaticVc: UIViewController {
    
    //IBOutlets for image
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    //IBOutlets for labels
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
//IBOutlets for stackViews ---->>>>
    
//    @IBOutlet weak var mainStackView: UIStackView!
//    @IBOutlet weak var firstVerticalStackView: UIStackView!
//    @IBOutlet weak var secondVerticalStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1.translatesAutoresizingMaskIntoConstraints = false
        img2.translatesAutoresizingMaskIntoConstraints = false
        img3.translatesAutoresizingMaskIntoConstraints = false
        img4.translatesAutoresizingMaskIntoConstraints = false
        lbl1.translatesAutoresizingMaskIntoConstraints = false
        lbl2.translatesAutoresizingMaskIntoConstraints = false
        lbl3.translatesAutoresizingMaskIntoConstraints = false
        lbl4.translatesAutoresizingMaskIntoConstraints = false
       
        
        let img1TopContraint = img1.topAnchor.constraint(equalTo: view1.topAnchor, constant: 10)
        let img1LeadingContraint = img1.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 10)
        let img1BottomContraint = img1.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: 30)
        let img1TrailingContraint = img1.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 10)
//        let img1WidthContraint = img1.widthAnchor.constraint(equalToConstant: 170)
//        let img1HeightContraint = img1.heightAnchor.constraint(equalToConstant: 300)

        NSLayoutConstraint.activate([img1TopContraint, img1LeadingContraint, img1BottomContraint, img1TrailingContraint])
        
        
        
        let img2TopContraint = img2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 10)
        let img2LeadingContraint = img2.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 10)
        let img2BottomContraint = img2.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: 30)
        let img2TrailingContraint = img2.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 10)
//        let img2WidthContraint = img2.widthAnchor.constraint(equalToConstant: 170)
//        let img2HeightContraint = img2.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([img2TopContraint, img2TrailingContraint, img2LeadingContraint, img2BottomContraint])

        
        
        //let img3TopContraint = img3.topAnchor.constraint(equalTo: view3.topAnchor, constant: 10)
        let img3LeadingContraint = img3.leadingAnchor.constraint(equalTo: view3.leadingAnchor, constant: 10)
        let img3BottomContraint = img3.bottomAnchor.constraint(equalTo: view3.bottomAnchor, constant: 30)
       // let img3TrailingContraint = img3.trailingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 10)
        let img3WidthContraint = img3.widthAnchor.constraint(equalToConstant: 170)
        let img3HeightContraint = img3.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([img3BottomContraint, img3LeadingContraint, img3WidthContraint, img3HeightContraint])
        
        
        
//        let img4TopContraint = img4.topAnchor.constraint(equalTo: view4.topAnchor, constant: 10)
//        let img4LeadingContraint = img4.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 10)
        let img4BottomContraint = img4.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 30)
        let img4TrailingContraint = img4.trailingAnchor.constraint(equalTo: view4.trailingAnchor, constant: 10)
        let img4WidthContraint = img4.widthAnchor.constraint(equalToConstant: 170)
        let img4HeightContraint = img4.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([ img4TrailingContraint, img4BottomContraint, img4WidthContraint, img4HeightContraint])

    }
    
    
}
