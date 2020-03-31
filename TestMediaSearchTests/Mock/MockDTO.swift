//
//  MockDTO.swift
//  TestMediaSearchTests
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import ObjectMapper

@testable import TestMediaSearch

let bundle = Bundle(for: JSONTestHelper.self)

let mockGithubUsers = Mapper<GithubUsersOverviewDTO>().map(JSONString: JSONTestHelper.jsonStringFromFromBundle(bundle: bundle, name: "GithubUsersMock"))!

let mockItunes = Mapper<ItunesSongOverviewDTO>().map(JSONString: JSONTestHelper.jsonStringFromFromBundle(bundle: bundle, name: "ItunesMock"))!
