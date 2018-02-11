/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Plan {
	public var name : String?
	public var space : Int?
	public var collaborators : Int?
	public var private_repos : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let plan_list = Plan.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Plan Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Plan]
    {
        var models:[Plan] = []
        for item in array
        {
            models.append(Plan(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let plan = Plan(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Plan Instance.
*/
	required public init?(dictionary: NSDictionary) {

		name = dictionary["name"] as? String
		space = dictionary["space"] as? Int
		collaborators = dictionary["collaborators"] as? Int
		private_repos = dictionary["private_repos"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.space, forKey: "space")
		dictionary.setValue(self.collaborators, forKey: "collaborators")
		dictionary.setValue(self.private_repos, forKey: "private_repos")

		return dictionary
	}

}