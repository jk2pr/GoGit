/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Owner {
	public var login : String?
	public var id : Int?
	public var avatar_url : String?
	public var gravatar_id : String?
	public var url : String?
	public var html_url : String?
	public var followers_url : String?
	public var following_url : String?
	public var gists_url : String?
	public var starred_url : String?
	public var subscriptions_url : String?
	public var organizations_url : String?
	public var repos_url : String?
	public var events_url : String?
	public var received_events_url : String?
	public var type : String?
	public var site_admin : Bool?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let owner_list = Owner.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Owner Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Owner]
    {
        var models:[Owner] = []
        for item in array
        {
            models.append(Owner(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let owner = Owner(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Owner Instance.
*/
	required public init?(dictionary: NSDictionary) {

		login = dictionary["login"] as? String
		id = dictionary["id"] as? Int
		avatar_url = dictionary["avatar_url"] as? String
		gravatar_id = dictionary["gravatar_id"] as? String
		url = dictionary["url"] as? String
		html_url = dictionary["html_url"] as? String
		followers_url = dictionary["followers_url"] as? String
		following_url = dictionary["following_url"] as? String
		gists_url = dictionary["gists_url"] as? String
		starred_url = dictionary["starred_url"] as? String
		subscriptions_url = dictionary["subscriptions_url"] as? String
		organizations_url = dictionary["organizations_url"] as? String
		repos_url = dictionary["repos_url"] as? String
		events_url = dictionary["events_url"] as? String
		received_events_url = dictionary["received_events_url"] as? String
		type = dictionary["type"] as? String
		site_admin = dictionary["site_admin"] as? Bool
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.login, forKey: "login")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.avatar_url, forKey: "avatar_url")
		dictionary.setValue(self.gravatar_id, forKey: "gravatar_id")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.html_url, forKey: "html_url")
		dictionary.setValue(self.followers_url, forKey: "followers_url")
		dictionary.setValue(self.following_url, forKey: "following_url")
		dictionary.setValue(self.gists_url, forKey: "gists_url")
		dictionary.setValue(self.starred_url, forKey: "starred_url")
		dictionary.setValue(self.subscriptions_url, forKey: "subscriptions_url")
		dictionary.setValue(self.organizations_url, forKey: "organizations_url")
		dictionary.setValue(self.repos_url, forKey: "repos_url")
		dictionary.setValue(self.events_url, forKey: "events_url")
		dictionary.setValue(self.received_events_url, forKey: "received_events_url")
		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.site_admin, forKey: "site_admin")

		return dictionary
	}

}