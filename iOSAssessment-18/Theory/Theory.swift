//
//  Theory.swift
//  iOSAssessment-18
//
//  Created by satyam dixit on 26/10/21.
//

import Foundation
/*
1-Explain the pod integration cycle.
 i) first we will install cocoapod through terminal.
 ii) Then we will open terminal and goto project folder path
 iii) then we will run command "pod init".
 iv) then we'll open podfile from our project folder and below #use framework
 we will write the name of pod ex- "pod "Alamofire" "
 v) then we will save the podfile and reopen project folder and this time , we will work
 in projectname.xcworkspace

2-How to update only a single pod.
i) change the name of pod in podfile then run pod update.
 ii) if we run pod install then our pod will also update.
 
 
3-Delete a pod from project.
i) remove name of pod from podfile and save it.
 ii) run pod update command.
 
 
4-update to a particular lib version.
 we can update to particular version like
 pod "Alamofire" ~>"5.0"
 
 this ~> sign used to tell that we can use pod version till this version in "".
*/
