//
//  JSONParser.swift
//  My Movie List
//
//  Created by Raiyan Rahman on 2018-10-25.
//  Copyright © 2018 Raiyan Rahman. All rights reserved.
//

import Foundation


class JSONParser {
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options) as? [String: AnyObject]
            return json!
        } catch (let parseError){
            print("There was an error parsing the JSON: \"\(parseError.localizedDescription)\"")
        }
        return nil
    }
}
