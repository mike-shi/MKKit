//
//  GARegexHelper.swift
//  GATest
//
//  Created by mike on 2018/3/27.
//  Copyright © 2018年 mike. All rights reserved.
//

import UIKit

struct RegexResult {
    var resultStr: String = ""
    var resultRange: NSRange?
}

struct RegexHelper {
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression.init(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let matchs = regex.matches(in: input, options: [], range: NSMakeRange(0, input.length()))
        return matchs.count > 0
    }
    
    func matchArr(_ input: String) -> [RegexResult] {
        let matchs = regex.matches(in: input, options: [], range: NSMakeRange(0, input.length()))
        var resultList: [RegexResult] = []
        for matchString in matchs {
            var result = RegexResult.init()
            result.resultRange = matchString.range
            result.resultStr = NSString.init(string: input).substring(with: matchString.range)
            resultList.append(result)
        }
        return resultList
    }
}

precedencegroup MatchPrecedence {
    associativity: none
    higherThan: DefaultPrecedence
}

infix operator =~: MatchPrecedence

func =~(lhs: String, rhs: String) -> Bool {
    do{
        return try RegexHelper(rhs).match(lhs)
    }catch _ {
        return false
    }
}

infix operator =~-: MatchPrecedence

func =~-(lhs: String, rhs: String) -> [RegexResult] {
    do{
        return try RegexHelper(rhs).matchArr(lhs)
    }catch _ {
        return []
    }
}

