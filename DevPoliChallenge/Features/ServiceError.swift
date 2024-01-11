//
//  ServiceError.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation


enum ServiceError: Error{
    case decodeFail(Error)
}
