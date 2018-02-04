/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Payload {
	public var ref : String?
	public var ref_type : String?
	public var master_branch : String?
	public var description : String?
	public var pusher_type : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let payload_list = Payload.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Payload Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Payload]
    {
        var models:[Payload] = []
        for item in array
        {
            models.append(Payload(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let payload = Payload(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Payload Instance.
*/
	required public init?(dictionary: NSDictionary) {

		ref = dictionary["ref"] as? String
		ref_type = dictionary["ref_type"] as? String
		master_branch = dictionary["master_branch"] as? String
		description = dictionary["description"] as? String
		pusher_type = dictionary["pusher_type"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.ref, forKey: "ref")
		dictionary.setValue(self.ref_type, forKey: "ref_type")
		dictionary.setValue(self.master_branch, forKey: "master_branch")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.pusher_type, forKey: "pusher_type")

		return dictionary
	}

}