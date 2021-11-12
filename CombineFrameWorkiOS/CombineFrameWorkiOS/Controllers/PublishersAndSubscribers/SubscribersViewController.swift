//
//  SubscribersViewController.swift
//  CombineFrameWorkiOS
//
//  Created by satyam dixit on 12/11/21.
//

import UIKit
import Combine

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value  \(input)")
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completion Received")
    }
    
    
    typealias Input = String
    
    typealias Failure = Never
    
    
    
}


class SubscribersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = ["A","B","C","D","E","F","G","H","I","J","K"].publisher
        let subscriber = StringSubscriber()
        publisher.subscribe(subscriber)
    }

}
