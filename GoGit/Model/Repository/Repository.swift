/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Repository {
	public var id : Int?
	public var name : String?
	public var full_name : String?
	public var owner : Owner?
	public var pri : Bool?
	public var html_url : String?
	public var description : String?
	public var fork : Bool?
	public var url : String?
	public var forks_url : String?
	public var keys_url : String?
	public var collaborators_url : String?
	public var teams_url : String?
	public var hooks_url : String?
	public var issue_events_url : String?
	public var events_url : String?
	public var assignees_url : String?
	public var branches_url : String?
	public var tags_url : String?
	public var blobs_url : String?
	public var git_tags_url : String?
	public var git_refs_url : String?
	public var trees_url : String?
	public var statuses_url : String?
	public var languages_url : String?
	public var stargazers_url : String?
	public var contributors_url : String?
	public var subscribers_url : String?
	public var subscription_url : String?
	public var commits_url : String?
	public var git_commits_url : String?
	public var comments_url : String?
	public var issue_comment_url : String?
	public var contents_url : String?
	public var compare_url : String?
	public var merges_url : String?
	public var archive_url : String?
	public var downloads_url : String?
	public var issues_url : String?
	public var pulls_url : String?
	public var milestones_url : String?
	public var notifications_url : String?
	public var labels_url : String?
	public var releases_url : String?
	public var deployments_url : String?
	public var created_at : String?
	public var updated_at : String?
	public var pushed_at : String?
	public var git_url : String?
	public var ssh_url : String?
	public var clone_url : String?
	public var svn_url : String?
	public var homepage : String?
	public var size : Int?
	public var stargazers_count : Int?
	public var watchers_count : Int?
	public var language : String?
	public var has_issues : Bool?
	public var has_projects : Bool?
	public var has_downloads : Bool?
	public var has_wiki : Bool?
	public var has_pages : Bool?
	public var forks_count : Int?
	public var mirror_url : String?
	public var archived : Bool?
	public var open_issues_count : Int?
	public var license : String?
	public var forks : Int?
	public var open_issues : Int?
	public var watchers : Int?
	public var default_branch : String?

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

		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		full_name = dictionary["full_name"] as? String
		if (dictionary["owner"] != nil) { owner = Owner(dictionary: dictionary["owner"] as! NSDictionary) }
		pri = dictionary["private"] as? Bool
		html_url = dictionary["html_url"] as? String
		description = dictionary["description"] as? String
		fork = dictionary["fork"] as? Bool
		url = dictionary["url"] as? String
		forks_url = dictionary["forks_url"] as? String
		keys_url = dictionary["keys_url"] as? String
		collaborators_url = dictionary["collaborators_url"] as? String
		teams_url = dictionary["teams_url"] as? String
		hooks_url = dictionary["hooks_url"] as? String
		issue_events_url = dictionary["issue_events_url"] as? String
		events_url = dictionary["events_url"] as? String
		assignees_url = dictionary["assignees_url"] as? String
		branches_url = dictionary["branches_url"] as? String
		tags_url = dictionary["tags_url"] as? String
		blobs_url = dictionary["blobs_url"] as? String
		git_tags_url = dictionary["git_tags_url"] as? String
		git_refs_url = dictionary["git_refs_url"] as? String
		trees_url = dictionary["trees_url"] as? String
		statuses_url = dictionary["statuses_url"] as? String
		languages_url = dictionary["languages_url"] as? String
		stargazers_url = dictionary["stargazers_url"] as? String
		contributors_url = dictionary["contributors_url"] as? String
		subscribers_url = dictionary["subscribers_url"] as? String
		subscription_url = dictionary["subscription_url"] as? String
		commits_url = dictionary["commits_url"] as? String
		git_commits_url = dictionary["git_commits_url"] as? String
		comments_url = dictionary["comments_url"] as? String
		issue_comment_url = dictionary["issue_comment_url"] as? String
		contents_url = dictionary["contents_url"] as? String
		compare_url = dictionary["compare_url"] as? String
		merges_url = dictionary["merges_url"] as? String
		archive_url = dictionary["archive_url"] as? String
		downloads_url = dictionary["downloads_url"] as? String
		issues_url = dictionary["issues_url"] as? String
		pulls_url = dictionary["pulls_url"] as? String
		milestones_url = dictionary["milestones_url"] as? String
		notifications_url = dictionary["notifications_url"] as? String
		labels_url = dictionary["labels_url"] as? String
		releases_url = dictionary["releases_url"] as? String
		deployments_url = dictionary["deployments_url"] as? String
		created_at = dictionary["created_at"] as? String
		updated_at = dictionary["updated_at"] as? String
		pushed_at = dictionary["pushed_at"] as? String
		git_url = dictionary["git_url"] as? String
		ssh_url = dictionary["ssh_url"] as? String
		clone_url = dictionary["clone_url"] as? String
		svn_url = dictionary["svn_url"] as? String
		homepage = dictionary["homepage"] as? String
		size = dictionary["size"] as? Int
		stargazers_count = dictionary["stargazers_count"] as? Int
		watchers_count = dictionary["watchers_count"] as? Int
		language = dictionary["language"] as? String
		has_issues = dictionary["has_issues"] as? Bool
		has_projects = dictionary["has_projects"] as? Bool
		has_downloads = dictionary["has_downloads"] as? Bool
		has_wiki = dictionary["has_wiki"] as? Bool
		has_pages = dictionary["has_pages"] as? Bool
		forks_count = dictionary["forks_count"] as? Int
		mirror_url = dictionary["mirror_url"] as? String
		archived = dictionary["archived"] as? Bool
		open_issues_count = dictionary["open_issues_count"] as? Int
		license = dictionary["license"] as? String
		forks = dictionary["forks"] as? Int
		open_issues = dictionary["open_issues"] as? Int
		watchers = dictionary["watchers"] as? Int
		default_branch = dictionary["default_branch"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.full_name, forKey: "full_name")
		dictionary.setValue(self.owner?.dictionaryRepresentation(), forKey: "owner")
		dictionary.setValue(self.pri, forKey: "private")
		dictionary.setValue(self.html_url, forKey: "html_url")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.fork, forKey: "fork")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.forks_url, forKey: "forks_url")
		dictionary.setValue(self.keys_url, forKey: "keys_url")
		dictionary.setValue(self.collaborators_url, forKey: "collaborators_url")
		dictionary.setValue(self.teams_url, forKey: "teams_url")
		dictionary.setValue(self.hooks_url, forKey: "hooks_url")
		dictionary.setValue(self.issue_events_url, forKey: "issue_events_url")
		dictionary.setValue(self.events_url, forKey: "events_url")
		dictionary.setValue(self.assignees_url, forKey: "assignees_url")
		dictionary.setValue(self.branches_url, forKey: "branches_url")
		dictionary.setValue(self.tags_url, forKey: "tags_url")
		dictionary.setValue(self.blobs_url, forKey: "blobs_url")
		dictionary.setValue(self.git_tags_url, forKey: "git_tags_url")
		dictionary.setValue(self.git_refs_url, forKey: "git_refs_url")
		dictionary.setValue(self.trees_url, forKey: "trees_url")
		dictionary.setValue(self.statuses_url, forKey: "statuses_url")
		dictionary.setValue(self.languages_url, forKey: "languages_url")
		dictionary.setValue(self.stargazers_url, forKey: "stargazers_url")
		dictionary.setValue(self.contributors_url, forKey: "contributors_url")
		dictionary.setValue(self.subscribers_url, forKey: "subscribers_url")
		dictionary.setValue(self.subscription_url, forKey: "subscription_url")
		dictionary.setValue(self.commits_url, forKey: "commits_url")
		dictionary.setValue(self.git_commits_url, forKey: "git_commits_url")
		dictionary.setValue(self.comments_url, forKey: "comments_url")
		dictionary.setValue(self.issue_comment_url, forKey: "issue_comment_url")
		dictionary.setValue(self.contents_url, forKey: "contents_url")
		dictionary.setValue(self.compare_url, forKey: "compare_url")
		dictionary.setValue(self.merges_url, forKey: "merges_url")
		dictionary.setValue(self.archive_url, forKey: "archive_url")
		dictionary.setValue(self.downloads_url, forKey: "downloads_url")
		dictionary.setValue(self.issues_url, forKey: "issues_url")
		dictionary.setValue(self.pulls_url, forKey: "pulls_url")
		dictionary.setValue(self.milestones_url, forKey: "milestones_url")
		dictionary.setValue(self.notifications_url, forKey: "notifications_url")
		dictionary.setValue(self.labels_url, forKey: "labels_url")
		dictionary.setValue(self.releases_url, forKey: "releases_url")
		dictionary.setValue(self.deployments_url, forKey: "deployments_url")
		dictionary.setValue(self.created_at, forKey: "created_at")
		dictionary.setValue(self.updated_at, forKey: "updated_at")
		dictionary.setValue(self.pushed_at, forKey: "pushed_at")
		dictionary.setValue(self.git_url, forKey: "git_url")
		dictionary.setValue(self.ssh_url, forKey: "ssh_url")
		dictionary.setValue(self.clone_url, forKey: "clone_url")
		dictionary.setValue(self.svn_url, forKey: "svn_url")
		dictionary.setValue(self.homepage, forKey: "homepage")
		dictionary.setValue(self.size, forKey: "size")
		dictionary.setValue(self.stargazers_count, forKey: "stargazers_count")
		dictionary.setValue(self.watchers_count, forKey: "watchers_count")
		dictionary.setValue(self.language, forKey: "language")
		dictionary.setValue(self.has_issues, forKey: "has_issues")
		dictionary.setValue(self.has_projects, forKey: "has_projects")
		dictionary.setValue(self.has_downloads, forKey: "has_downloads")
		dictionary.setValue(self.has_wiki, forKey: "has_wiki")
		dictionary.setValue(self.has_pages, forKey: "has_pages")
		dictionary.setValue(self.forks_count, forKey: "forks_count")
		dictionary.setValue(self.mirror_url, forKey: "mirror_url")
		dictionary.setValue(self.archived, forKey: "archived")
		dictionary.setValue(self.open_issues_count, forKey: "open_issues_count")
		dictionary.setValue(self.license, forKey: "license")
		dictionary.setValue(self.forks, forKey: "forks")
		dictionary.setValue(self.open_issues, forKey: "open_issues")
		dictionary.setValue(self.watchers, forKey: "watchers")
		dictionary.setValue(self.default_branch, forKey: "default_branch")

		return dictionary
	}

}
