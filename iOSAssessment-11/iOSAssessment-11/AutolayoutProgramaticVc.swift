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
       
        img1ContraintsSet()
        img2ContraintsSet()
        img3ContraintsSet()
        img4ContraintsSet()
        label1ContraintsSet()
        label2ContraintsSet()
        label3ContraintsSet()
        label4ContraintsSet()
    }
    
    
    private func img1ContraintsSet(){
        
        NSLayoutConstraint.activate([
            img1.topAnchor.constraint(equalTo: view1.topAnchor, constant: 40),
            img1.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 30),
            img1.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -40),
            img1.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -30)
        ])
        
    }
    
    
    private func img2ContraintsSet(){
        
        NSLayoutConstraint.activate([
            img2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 40),
            img2.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 30),
            img2.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: -40),
            img2.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -30)
        ])

    }
    
    
    private func img3ContraintsSet(){
        
        NSLayoutConstraint.activate([
            img3.topAnchor.constraint(equalTo: view3.topAnchor, constant: 40),
            img3.leadingAnchor.constraint(equalTo: view3.leadingAnchor, constant: 30),
            img3.bottomAnchor.constraint(equalTo: view3.bottomAnchor, constant: -40),
            img3.trailingAnchor.constraint(equalTo: view3.trailingAnchor, constant: -30)
        ])
        
    }
    
    private func img4ContraintsSet(){
 
        NSLayoutConstraint.activate([
            img4.topAnchor.constraint(equalTo: view4.topAnchor, constant: 40),
            img4.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 30),
            img4.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: -40),
            img4.trailingAnchor.constraint(equalTo: view4.trailingAnchor, constant: -30)
        ])

    }
    
    private func label1ContraintsSet(){
        
        NSLayoutConstraint.activate([
            lbl1.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 5),
            lbl1.leadingAnchor.constraint(equalTo: img1.leadingAnchor),
            lbl1.trailingAnchor.constraint(equalTo: img1.trailingAnchor)
        ])
        
    }
    
    
    private func label2ContraintsSet(){
        
        NSLayoutConstraint.activate([
            lbl2.topAnchor.constraint(equalTo: img2.bottomAnchor, constant: 5),
            lbl2.leadingAnchor.constraint(equalTo: img2.leadingAnchor),
            lbl2.trailingAnchor.constraint(equalTo: img2.trailingAnchor)
        ])
        
    }
    
    private func label3ContraintsSet(){
        
        NSLayoutConstraint.activate([
            lbl3.topAnchor.constraint(equalTo: img3.bottomAnchor, constant: 5),
            lbl3.leadingAnchor.constraint(equalTo: img3.leadingAnchor),
            lbl3.trailingAnchor.constraint(equalTo: img3.trailingAnchor)
        ])
        
    }
    
    private func label4ContraintsSet(){
        
        NSLayoutConstraint.activate([
            lbl4.topAnchor.constraint(equalTo: img4.bottomAnchor, constant: 5),
            lbl4.leadingAnchor.constraint(equalTo: img4.leadingAnchor),
            lbl4.trailingAnchor.constraint(equalTo: img4.trailingAnchor)
        ])
        
    }
    
}
