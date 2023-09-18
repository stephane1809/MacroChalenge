import Foundation

public final class NutriRankKit {
    public static func hello() {
        print("Hello, from your Kit framework")
    }

    public static func test() async {
        let useCase = DefaultCreateChallengeGroupUseCase(challengeGroupRepository: DefaultChallengeGroupRepository.self as! ChallengeGroupRepositoryProtocol)
        var group = ChallengeGroup()
        group.groupName = "teste-database"
        group.description = "testando"
        await useCase.execute(requestValue:group) { result in
            switch result {
            case .success(let group):
                print(group.groupName)
            case .failure(let error):
                print(error)
            }
        }
    }
}
