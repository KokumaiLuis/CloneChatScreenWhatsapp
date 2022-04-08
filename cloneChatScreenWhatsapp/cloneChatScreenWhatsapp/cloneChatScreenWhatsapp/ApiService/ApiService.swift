//
//  ApiService.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case invalidUrl
    case noProcessData
    case noDataAvailable
}


protocol ServiceProtocol{
    
    func getContacts(completion: @escaping(Result<[Contacts], UserError>) -> Void)
    
    
}


class ApiService: ServiceProtocol {
    
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/342785d8-399f-41f4-ba78-d91fe4164994"
    
    static var shared: ApiService = {
        let instance = ApiService()
        return instance
    }()
    
    
    func getContacts(completion: @escaping(Result<[Contacts], UserError>) -> Void) {
        
        guard let url = URL(string: url) else { return completion(.failure(.invalidUrl)) }
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                let userResponse = try decoder.decode([Contacts].self, from: jsonData)
                
                completion(.success(userResponse))
                
            } catch {
                completion(.failure(.noProcessData))
            }
            
        }
        
        dataTask.resume()
        
    }
    
    
}
