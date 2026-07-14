//
//  FormValidatorHelper.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 30/04/26.
//

import Foundation

typealias FormResult = Result<Void, FormValidatorError>

// MARK: - AUTH VALIDATIONS
struct FormValidatorHelper {
    static func isValidName(_ name: String) -> FormResult {
        if case .failure(let error) = verifyEmptyText(name) {
            return .failure(error)
        }
        
        return .success(())
    }
    
    static func isEmailValid(_ email: String) -> FormResult {
        if case .failure(let error) = verifyEmptyText(email) {
            return .failure(error)
        }
        
        if case .failure(let error) = verifyEmailFormatValid(email) {
            return .failure(error)
        }
        
        return .success(())
    }
    
    static func isPasswordValid(_ password: String) -> FormResult {
        if case .failure(let error) = verifyEmptyText(password) {
            return .failure(error)
        }
        
        if case .failure(let error) = verifyPasswordHasMore5Character(password) {
            return .failure(error)
        }
        
        return .success(())
    }
    
    static func isConfirmPasswordValid(password: String, otherPassowrd: String) -> FormResult {
        if case .failure(let error) = verifyPasswordsMatch(password: password, otherPassword: otherPassowrd) {
            return .failure(error)
        }
        
        return .success(())
    }
}

// MARK: - CEP VALIDATION
extension FormValidatorHelper {
    static func isValidCEP(_ cep: String) -> FormResult {
        if case .failure(let error) = verifyHasOnlyNumbers(cep) {
            return .failure(error)
        }
        
        if case .failure(let error) = verifyHasSixDigits(cep) {
            return .failure(error)
        }
        
        return .success(())
    }
}

// MARK: - SPECIFIC VERIFICATIONS AUTH
extension FormValidatorHelper {
    private static func verifyEmptyText(_ text: String) -> FormResult {
        return text.isEmpty
            ? .failure(.emptyText)
            : .success(())
    }
    
    private static func verifyEmailFormatValid(_ email: String) -> FormResult {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
            ? .success(())
            : .failure(.emailFormatInvalid)
    }
    
    private static func verifyPasswordHasMore5Character(_ text: String) -> FormResult {
        return text.count > 5
            ? .success(())
            : .failure(.passwordShort)
    }
    
    private static func verifyPasswordsMatch(password: String, otherPassword: String) -> FormResult {
        return password == otherPassword
            ? .success(())
            : .failure(.passwordsNotMatch)
    }
}

// MARK: - SPECIFIC VERIFICATIONS CEP
extension FormValidatorHelper {
    private static func verifyHasOnlyNumbers(_ text: String) -> FormResult {
        for character in text {
            if character.isNumber == false {
                return .failure(.cepMustHasOnlyNumbers)
            }
        }
        return .success(())
    }
    
    private static func verifyHasSixDigits(_ text: String) -> FormResult {
        return text.count == 8
            ? .success(())
            : .failure(.cepMustHasEightDigits)
    }
}
