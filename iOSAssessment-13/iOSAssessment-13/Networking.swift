//
//  Networking.swift
//  iOSAssessment-13
//
//  Created by Satyam Dixit on 18/10/21.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    // ToDo: Declare URLSession instances
    var defaultSession: URLSession
    
    init() {
        // ToDo: Initialize the URLSession instances
        defaultSession = URLSession.init(configuration: .default)
    }

    
    func request(completionBlock: @escaping (_ response: Any?,_ error: Error?) -> Void) {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
        
            let dataTask = defaultSession.dataTask(with: url) { data, response, error in
                guard let responseData = data else {
                    completionBlock(nil, error)
                    return
                }

                // Codable approach
                do {
                    let decoder = JSONDecoder()
                    
                        let decodedData = try decoder.decode([EmployeePosts].self, from: responseData)

                        completionBlock(decodedData, nil)

                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    completionBlock(nil, error)
                }
            }
            
            dataTask.resume()
        }
    }
    
    
    func requestComment(completionBlock: @escaping (_ response: Any?,_ error: Error?) -> Void) {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") {
        
            let dataTask = defaultSession.dataTask(with: url) { data, response, error in
                guard let responseData = data else {
                    completionBlock(nil, error)
                    return
                }

                // Codable approach
                do {
                    let decoder = JSONDecoder()
                    
                        let decodedData = try decoder.decode([EmployeeComments].self, from: responseData)

                        completionBlock(decodedData, nil)

                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    completionBlock(nil, error)
                }
            }
            
            dataTask.resume()
        }
    }
}
