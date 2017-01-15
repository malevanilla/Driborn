//
//  Shot.swift
//  Driborn
//
//  Created by Alan on 17/1/12.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class Shot  {
    var id: Int!
    var title: String?
    var description: String!
    var width: Int?
    var height: Int?
    var images: Images?
    var views_count: Int!
    var likes_count: Int!
    var comments_count: Int!
    var attachments_count: Int!
    var rebounds_count: Int!
    var buckets_count: Int!
    var created_at: String!
    var updated_at: String!
    var html_url: String!
    var attachments_url: String!
    var buckets_url: String!
    var comments_url: String!
    var likes_url: String!
    var projects_url: String!
    var rebounds_url: String!
    var animated: Bool!
}

class Images {
    var hidpi: String!
    var normal: String!
    var teaser: String!
}

class user {
    var id: Int!
    var name: String!
    var username: String!
    var html_url: String!
    var avatar_url: String!
    var bio: String!
    var location: String!
    var buckets_count: Int!
    var comments_received_count: Int!
    var followers_count: Int!
    var followings_count: Int!
    var likes_count: Int!
    var likes_received_count: Int!
    var projects_count: Int!
    var rebounds_received_count: Int!
    var shots_count: Int!
    var teams_count: Int!
    var can_upload_shot: Bool!
    var type: String!
    var pro: Bool!
    var buckets_url: String!
    var followers_url: String!
    var following_url: String!
    var likes_url: String!
    var projects_url: String!
    var shots_url: String!
    var teams_url: String!
    var created_at: String!
    var updated_at: String!
}

