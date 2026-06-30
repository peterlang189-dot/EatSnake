import Foundation

public struct FileProgressStore: ProgressPersisting {
    private let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func load() throws -> [VocabularyWord.ID: WordProgress] {
        guard FileManager.default.fileExists(atPath: url.path) else {
            return [:]
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([VocabularyWord.ID: WordProgress].self, from: data)
    }

    public func save(_ progress: [VocabularyWord.ID: WordProgress]) throws {
        let directory = url.deletingLastPathComponent()
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(progress)
        try data.write(to: url, options: [.atomic])
    }
}
