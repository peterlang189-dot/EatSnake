import SwiftUI

struct ProgressHeaderView: View {
    @EnvironmentObject private var model: StudyViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("今日复习")
                        .font(.title2.weight(.semibold))
                    Text("\(model.studiedTodayCount) 已学 · \(model.masteredCount)/\(model.totalCount) 已掌握")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("\(Int(model.completionRatio * 100))%")
                    .font(.title3.monospacedDigit().weight(.semibold))
                    .foregroundStyle(.indigo)
            }

            ProgressView(value: model.completionRatio)
                .tint(.indigo)

            HStack(spacing: 10) {
                StatPill(title: "记得", value: model.rememberedCount, tint: .green)
                StatPill(title: "待巩固", value: model.forgottenCount, tint: .orange)
            }
        }
        .padding()
        .background(.background, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct StatPill: View {
    let title: String
    let value: Int
    let tint: Color

    var body: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(tint)
                .frame(width: 8, height: 8)

            Text(title)
                .foregroundStyle(.secondary)

            Text("\(value)")
                .fontWeight(.semibold)
                .monospacedDigit()
        }
        .font(.footnote)
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(tint.opacity(0.12), in: Capsule())
    }
}
