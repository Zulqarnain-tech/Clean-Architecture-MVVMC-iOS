//
//  NetworkService.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("b8d75d66fcmsh5d303e28be24939p150dfbjsnd0515bd02f8c", forHTTPHeaderField: "X-RapidAPI-Key")
        urlRequest.addValue("tasty.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0)
            {
                do {
                    guard let data = data else { return }
                    
                    let response = try JSONDecoder().decode(T.self, from: data)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                    
                }
            }
        }.resume()
    }
}
