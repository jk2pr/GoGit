/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Actor {
	public var id : Int?
	public var login : String?
	public var display_login : String?
	public var gravatar_id : String?
	public var url : String?
	public var avatar_url : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let actor_list = Actor.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Actor Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Actor]
    {
        var models:[Actor] = []
        for item in array
        {
            models.append(Actor(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let actor = Actor(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Actor Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? Int
		login = dictionary["login"] as? String
		display_login = dictionary["display_login"] as? String
		gravatar_id = dictionary["gravatar_id"] as? String
		url = dictionary["url"] as? String
		avatar_url = dictionary["avatar_url"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.login, forKey: "login")
		dictionary.setValue(self.display_login, forKey: "display_login")
		dictionary.setValue(self.gravatar_id, forKey: "gravatar_id")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.avatar_url, forKey: "avatar_url")

		return dictionary
	}

}