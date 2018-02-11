/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Login {
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
	public var name : String?
	public var company : String?
	public var blog : String?
	public var location : String?
	public var email : String?
	public var hireable : Bool?
	public var bio : String?
	public var public_repos : Int?
	public var public_gists : Int?
	public var followers : Int?
	public var following : Int?
	public var created_at : String?
	public var updated_at : String?
	public var private_gists : Int?
	public var total_private_repos : Int?
	public var owned_private_repos : Int?
	public var disk_usage : Int?
	public var collaborators : Int?
	public var two_factor_authentication : Bool?
	public var plan : Plan?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Json4Swift_Base]
    {
        var models:[Json4Swift_Base] = []
        for item in array
        {
            models.append(Json4Swift_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
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
		name = dictionary["name"] as? String
		company = dictionary["company"] as? String
		blog = dictionary["blog"] as? String
		location = dictionary["location"] as? String
		email = dictionary["email"] as? String
		hireable = dictionary["hireable"] as? Bool
		bio = dictionary["bio"] as? String
		public_repos = dictionary["public_repos"] as? Int
		public_gists = dictionary["public_gists"] as? Int
		followers = dictionary["followers"] as? Int
		following = dictionary["following"] as? Int
		created_at = dictionary["created_at"] as? String
		updated_at = dictionary["updated_at"] as? String
		private_gists = dictionary["private_gists"] as? Int
		total_private_repos = dictionary["total_private_repos"] as? Int
		owned_private_repos = dictionary["owned_private_repos"] as? Int
		disk_usage = dictionary["disk_usage"] as? Int
		collaborators = dictionary["collaborators"] as? Int
		two_factor_authentication = dictionary["two_factor_authentication"] as? Bool
		if (dictionary["plan"] != nil) { plan = Plan(dictionary: dictionary["plan"] as! NSDictionary) }
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
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.company, forKey: "company")
		dictionary.setValue(self.blog, forKey: "blog")
		dictionary.setValue(self.location, forKey: "location")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.hireable, forKey: "hireable")
		dictionary.setValue(self.bio, forKey: "bio")
		dictionary.setValue(self.public_repos, forKey: "public_repos")
		dictionary.setValue(self.public_gists, forKey: "public_gists")
		dictionary.setValue(self.followers, forKey: "followers")
		dictionary.setValue(self.following, forKey: "following")
		dictionary.setValue(self.created_at, forKey: "created_at")
		dictionary.setValue(self.updated_at, forKey: "updated_at")
		dictionary.setValue(self.private_gists, forKey: "private_gists")
		dictionary.setValue(self.total_private_repos, forKey: "total_private_repos")
		dictionary.setValue(self.owned_private_repos, forKey: "owned_private_repos")
		dictionary.setValue(self.disk_usage, forKey: "disk_usage")
		dictionary.setValue(self.collaborators, forKey: "collaborators")
		dictionary.setValue(self.two_factor_authentication, forKey: "two_factor_authentication")
		dictionary.setValue(self.plan?.dictionaryRepresentation(), forKey: "plan")

		return dictionary
	}

}
