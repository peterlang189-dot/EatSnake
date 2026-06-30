import Foundation

public enum TOEICVocabulary {
    public static let words: [VocabularyWord] = [
        word(
            "agenda",
            "/əˈdʒendə/",
            "议程；待办事项",
            "Please review the agenda before the meeting.",
            "请在会议前查看议程。",
            .easy
        ),
        word(
            "appointment",
            "/əˈpɔɪntmənt/",
            "预约；任命",
            "She has an appointment with a client at ten.",
            "她十点和一位客户有预约。",
            .easy
        ),
        word(
            "attendee",
            "/əˌtenˈdiː/",
            "出席者；参加者",
            "Each attendee received a copy of the report.",
            "每位出席者都收到了一份报告。",
            .medium
        ),
        word(
            "briefing",
            "/ˈbriːfɪŋ/",
            "简报会；情况介绍",
            "The manager held a short briefing in the morning.",
            "经理早上开了一个简短的情况介绍会。",
            .medium
        ),
        word(
            "conference",
            "/ˈkɑːnfərəns/",
            "会议；研讨会",
            "The annual conference will be held in Seoul.",
            "年度会议将在首尔举行。",
            .easy
        ),
        word(
            "deadline",
            "/ˈdedlaɪn/",
            "截止日期",
            "The deadline for the application is Friday.",
            "申请截止日期是星期五。",
            .easy
        ),
        word(
            "delegate",
            "/ˈdelɪɡət/",
            "代表；委派",
            "Several delegates arrived early for registration.",
            "几位代表提前到达办理登记。",
            .medium
        ),
        word(
            "minutes",
            "/ˈmɪnɪts/",
            "会议记录",
            "The assistant emailed the minutes after lunch.",
            "助理午饭后发出了会议记录。",
            .medium
        ),
        word(
            "postpone",
            "/poʊstˈpoʊn/",
            "推迟；延期",
            "The training session was postponed until next week.",
            "培训课程被推迟到下周。",
            .medium
        ),
        word(
            "proposal",
            "/prəˈpoʊzəl/",
            "提案；建议书",
            "The team submitted a proposal to reduce costs.",
            "团队提交了一份降低成本的提案。",
            .easy
        ),
        word(
            "reservation",
            "/ˌrezərˈveɪʃən/",
            "预订；保留",
            "I made a reservation for two nights.",
            "我预订了两晚。",
            .easy
        ),
        word(
            "reschedule",
            "/ˌriːˈskedʒuːl/",
            "重新安排时间",
            "Could we reschedule the interview for Monday?",
            "我们能把面试重新安排到周一吗？",
            .medium
        ),
        word(
            "venue",
            "/ˈvenjuː/",
            "会场；举办地点",
            "The venue is close to the subway station.",
            "会场靠近地铁站。",
            .medium
        ),
        word(
            "arrangement",
            "/əˈreɪndʒmənt/",
            "安排；布置",
            "Travel arrangements must be approved in advance.",
            "差旅安排必须提前获批。",
            .medium
        ),
        word(
            "commute",
            "/kəˈmjuːt/",
            "通勤；上下班路程",
            "Her daily commute takes about forty minutes.",
            "她每天通勤大约需要四十分钟。",
            .easy
        ),
        word(
            "departure",
            "/dɪˈpɑːrtʃər/",
            "出发；离开",
            "The departure gate changed at the last minute.",
            "登机口在最后一刻发生了变化。",
            .easy
        ),
        word(
            "itinerary",
            "/aɪˈtɪnəreri/",
            "行程；旅行计划",
            "The itinerary includes visits to three branches.",
            "行程包括参观三个分部。",
            .hard
        ),
        word(
            "luggage",
            "/ˈlʌɡɪdʒ/",
            "行李",
            "Passengers may store luggage in the overhead bin.",
            "乘客可以把行李放在头顶行李架内。",
            .easy
        ),
        word(
            "shuttle",
            "/ˈʃʌtəl/",
            "班车；往返交通工具",
            "A free shuttle runs between the hotel and airport.",
            "酒店和机场之间有免费班车。",
            .medium
        ),
        word(
            "accommodate",
            "/əˈkɑːmədeɪt/",
            "容纳；满足需求",
            "The room can accommodate up to thirty guests.",
            "这个房间最多可容纳三十位客人。",
            .medium
        ),
        word(
            "amenity",
            "/əˈmenəti/",
            "便利设施",
            "The hotel offers several business amenities.",
            "这家酒店提供多项商务便利设施。",
            .hard
        ),
        word(
            "complimentary",
            "/ˌkɑːmplɪˈmentəri/",
            "免费的；赠送的",
            "Complimentary breakfast is served until nine.",
            "免费早餐供应到九点。",
            .hard
        ),
        word(
            "occupancy",
            "/ˈɑːkjəpənsi/",
            "入住率；占用情况",
            "Hotel occupancy rises during the trade fair.",
            "贸易展期间酒店入住率会上升。",
            .hard
        ),
        word(
            "renovation",
            "/ˌrenəˈveɪʃən/",
            "翻新；整修",
            "The lobby is closed for renovation.",
            "大堂因整修而关闭。",
            .medium
        ),
        word(
            "reception",
            "/rɪˈsepʃən/",
            "接待处；招待会",
            "Please leave your key at reception.",
            "请把钥匙留在接待处。",
            .easy
        ),
        word(
            "invoice",
            "/ˈɪnvɔɪs/",
            "发票；账单",
            "The invoice must include the purchase order number.",
            "发票必须包含采购订单号。",
            .medium
        ),
        word(
            "budget",
            "/ˈbʌdʒɪt/",
            "预算",
            "The project stayed within the approved budget.",
            "该项目控制在批准的预算内。",
            .easy
        ),
        word(
            "expense",
            "/ɪkˈspens/",
            "费用；开支",
            "All travel expenses should be recorded.",
            "所有差旅费用都应记录。",
            .easy
        ),
        word(
            "reimbursement",
            "/ˌriːɪmˈbɜːrsmənt/",
            "报销；偿还",
            "Submit the receipts to request reimbursement.",
            "提交收据以申请报销。",
            .hard
        ),
        word(
            "revenue",
            "/ˈrevənuː/",
            "收入；营收",
            "Online sales increased total revenue.",
            "线上销售提高了总营收。",
            .medium
        ),
        word(
            "profit",
            "/ˈprɑːfɪt/",
            "利润；获利",
            "The new service generated a small profit.",
            "这项新服务产生了少量利润。",
            .easy
        ),
        word(
            "quarterly",
            "/ˈkwɔːrtərli/",
            "季度的；每季度",
            "Quarterly results will be announced next Tuesday.",
            "季度业绩将在下周二公布。",
            .medium
        ),
        word(
            "estimate",
            "/ˈestɪmət/",
            "估算；报价",
            "The contractor gave us a detailed estimate.",
            "承包商给了我们一份详细报价。",
            .medium
        ),
        word(
            "inventory",
            "/ˈɪnvəntɔːri/",
            "库存；存货",
            "The store checks inventory every Friday.",
            "商店每周五盘点库存。",
            .medium
        ),
        word(
            "shipment",
            "/ˈʃɪpmənt/",
            "货运；装运",
            "The shipment arrived two days ahead of schedule.",
            "这批货提前两天到达。",
            .medium
        ),
        word(
            "warehouse",
            "/ˈwerhaʊs/",
            "仓库",
            "The warehouse keeps spare parts in labeled bins.",
            "仓库把备用零件放在贴有标签的箱子里。",
            .easy
        ),
        word(
            "supplier",
            "/səˈplaɪər/",
            "供应商",
            "We selected a local supplier for packaging.",
            "我们选择了一家本地包装供应商。",
            .easy
        ),
        word(
            "manufacturer",
            "/ˌmænjəˈfæktʃərər/",
            "制造商",
            "The manufacturer extended the warranty period.",
            "制造商延长了保修期。",
            .medium
        ),
        word(
            "defective",
            "/dɪˈfektɪv/",
            "有缺陷的；故障的",
            "Defective items can be returned within thirty days.",
            "有缺陷的商品可在三十天内退回。",
            .medium
        ),
        word(
            "inspection",
            "/ɪnˈspekʃən/",
            "检查；检验",
            "The inspection found no safety issues.",
            "检查未发现安全问题。",
            .medium
        ),
        word(
            "maintenance",
            "/ˈmeɪntənəns/",
            "维护；保养",
            "Regular maintenance keeps the equipment reliable.",
            "定期维护能让设备保持可靠。",
            .medium
        ),
        word(
            "installation",
            "/ˌɪnstəˈleɪʃən/",
            "安装；装置",
            "Installation of the new printer took one hour.",
            "新打印机的安装花了一小时。",
            .medium
        ),
        word(
            "warranty",
            "/ˈwɔːrənti/",
            "保修；保证书",
            "The warranty covers parts and labor.",
            "保修涵盖零件和人工费用。",
            .medium
        ),
        word(
            "applicant",
            "/ˈæplɪkənt/",
            "申请人；求职者",
            "Each applicant must submit a resume.",
            "每位申请人都必须提交简历。",
            .easy
        ),
        word(
            "candidate",
            "/ˈkændɪdeɪt/",
            "候选人；应聘者",
            "The strongest candidate has ten years of experience.",
            "最强的候选人有十年经验。",
            .easy
        ),
        word(
            "qualification",
            "/ˌkwɑːlɪfɪˈkeɪʃən/",
            "资格；资历",
            "A teaching qualification is required for this role.",
            "这个职位需要教学资格。",
            .medium
        ),
        word(
            "orientation",
            "/ˌɔːriənˈteɪʃən/",
            "入职培训；情况介绍",
            "New employees attend orientation on their first day.",
            "新员工第一天参加入职培训。",
            .hard
        ),
        word(
            "supervisor",
            "/ˈsuːpərvaɪzər/",
            "主管；监督人",
            "Ask your supervisor before changing the schedule.",
            "更改日程前请先询问主管。",
            .easy
        ),
        word(
            "evaluation",
            "/ɪˌvæljuˈeɪʃən/",
            "评估；评价",
            "The annual evaluation includes a goal review.",
            "年度评估包括目标回顾。",
            .medium
        ),
        word(
            "promotion",
            "/prəˈmoʊʃən/",
            "晋升；促销",
            "The promotion was announced at the staff meeting.",
            "晋升消息在员工会议上宣布。",
            .easy
        ),
        word(
            "benefits",
            "/ˈbenəfɪts/",
            "福利；利益",
            "The company offers health benefits to employees.",
            "公司为员工提供健康福利。",
            .easy
        ),
        word(
            "complaint",
            "/kəmˈpleɪnt/",
            "投诉；抱怨",
            "Customer service handled the complaint quickly.",
            "客服迅速处理了投诉。",
            .easy
        ),
        word(
            "refund",
            "/ˈriːfʌnd/",
            "退款",
            "The customer requested a full refund.",
            "顾客要求全额退款。",
            .easy
        ),
        word(
            "subscription",
            "/səbˈskrɪpʃən/",
            "订阅；订购",
            "Your subscription renews automatically each month.",
            "你的订阅每月自动续订。",
            .medium
        ),
        word(
            "promotion-code",
            "/prəˈmoʊʃən koʊd/",
            "促销代码；优惠码",
            "Enter the promotion code at checkout.",
            "结账时输入优惠码。",
            .medium,
            term: "promotion code"
        ),
        word(
            "representative",
            "/ˌreprɪˈzentətɪv/",
            "代表；客服人员",
            "A representative will call you within an hour.",
            "一位客服代表将在一小时内致电你。",
            .medium
        ),
        word(
            "available",
            "/əˈveɪləbəl/",
            "可用的；有空的",
            "The item is available in three colors.",
            "该商品有三种颜色可选。",
            .easy
        ),
        word(
            "outstanding",
            "/aʊtˈstændɪŋ/",
            "未完成的；杰出的",
            "Please pay the outstanding balance by Friday.",
            "请在周五前支付未结清余额。",
            .hard
        ),
        word(
            "negotiate",
            "/nɪˈɡoʊʃieɪt/",
            "协商；谈判",
            "The sales team will negotiate the contract terms.",
            "销售团队将协商合同条款。",
            .medium
        ),
        word(
            "contract",
            "/ˈkɑːntrækt/",
            "合同；契约",
            "Both parties signed the contract yesterday.",
            "双方昨天签署了合同。",
            .easy
        ),
        word(
            "agreement",
            "/əˈɡriːmənt/",
            "协议；一致",
            "The agreement includes a delivery schedule.",
            "协议包含交付时间表。",
            .easy
        ),
        word(
            "authorize",
            "/ˈɔːθəraɪz/",
            "授权；批准",
            "Only a manager can authorize the refund.",
            "只有经理可以批准退款。",
            .medium
        ),
        word(
            "comply",
            "/kəmˈplaɪ/",
            "遵守；符合",
            "All branches must comply with safety rules.",
            "所有分店都必须遵守安全规定。",
            .hard
        ),
        word(
            "policy",
            "/ˈpɑːləsi/",
            "政策；规定",
            "The return policy is printed on the receipt.",
            "退货政策印在收据上。",
            .easy
        ),
        word(
            "confidential",
            "/ˌkɑːnfɪˈdenʃəl/",
            "机密的；保密的",
            "The report contains confidential information.",
            "这份报告包含机密信息。",
            .hard
        ),
        word(
            "efficient",
            "/ɪˈfɪʃənt/",
            "高效的",
            "The new software makes scheduling more efficient.",
            "新软件让排班更高效。",
            .easy
        ),
        word(
            "accurate",
            "/ˈækjərət/",
            "准确的",
            "Accurate records are important for audits.",
            "准确的记录对审计很重要。",
            .easy
        ),
        word(
            "reliable",
            "/rɪˈlaɪəbəl/",
            "可靠的",
            "We need a reliable courier for urgent deliveries.",
            "我们需要一家可靠的快递公司处理紧急配送。",
            .easy
        ),
        word(
            "convenient",
            "/kənˈviːniənt/",
            "方便的；便利的",
            "The downtown location is convenient for visitors.",
            "市中心的位置对访客很方便。",
            .easy
        ),
        word(
            "sufficient",
            "/səˈfɪʃənt/",
            "足够的；充分的",
            "There is sufficient time to finish the survey.",
            "有足够时间完成调查。",
            .medium
        ),
        word(
            "significant",
            "/sɪɡˈnɪfɪkənt/",
            "显著的；重要的",
            "The campaign led to a significant increase in sales.",
            "这次活动使销售额显著增长。",
            .medium
        ),
        word(
            "approximately",
            "/əˈprɑːksɪmətli/",
            "大约；近似地",
            "The repair will take approximately two hours.",
            "维修大约需要两小时。",
            .medium
        ),
        word(
            "immediately",
            "/ɪˈmiːdiətli/",
            "立即；马上",
            "Please contact the front desk immediately.",
            "请立即联系前台。",
            .easy
        ),
        word(
            "previously",
            "/ˈpriːviəsli/",
            "以前；先前",
            "The product was previously sold only online.",
            "该产品以前只在线上销售。",
            .medium
        ),
        word(
            "currently",
            "/ˈkɜːrəntli/",
            "目前；当前",
            "The position is currently vacant.",
            "该职位目前空缺。",
            .easy
        ),
        word(
            "temporarily",
            "/ˌtempəˈrerəli/",
            "暂时地",
            "The elevator is temporarily out of service.",
            "电梯暂时停止使用。",
            .medium
        ),
        word(
            "frequently",
            "/ˈfriːkwəntli/",
            "经常地；频繁地",
            "Frequently asked questions are posted online.",
            "常见问题已发布在网上。",
            .easy
        ),
        word(
            "purchase",
            "/ˈpɜːrtʃəs/",
            "购买；采购",
            "Please keep the receipt after every purchase.",
            "每次购买后请保留收据。",
            .easy
        ),
        word(
            "launch",
            "/lɔːntʃ/",
            "发布；推出",
            "The company will launch a new product in July.",
            "公司将在七月推出一款新产品。",
            .easy
        ),
        word(
            "expand",
            "/ɪkˈspænd/",
            "扩大；扩展",
            "The firm plans to expand into overseas markets.",
            "该公司计划扩展到海外市场。",
            .easy
        ),
        word(
            "conduct",
            "/kənˈdʌkt/",
            "进行；实施",
            "The agency will conduct a customer survey.",
            "该机构将进行客户调查。",
            .medium
        ),
        word(
            "participate",
            "/pɑːrˈtɪsɪpeɪt/",
            "参加；参与",
            "Employees are encouraged to participate in training.",
            "公司鼓励员工参加培训。",
            .medium
        ),
        word(
            "confirm",
            "/kənˈfɜːrm/",
            "确认",
            "Please confirm your attendance by email.",
            "请通过电子邮件确认是否出席。",
            .easy
        ),
        word(
            "notify",
            "/ˈnoʊtɪfaɪ/",
            "通知；告知",
            "We will notify customers of any delays.",
            "如有延误，我们会通知客户。",
            .medium
        ),
        word(
            "resolve",
            "/rɪˈzɑːlv/",
            "解决；处理",
            "The technician resolved the network problem.",
            "技术人员解决了网络问题。",
            .medium
        ),
        word(
            "retain",
            "/rɪˈteɪn/",
            "保留；留住",
            "The company hopes to retain skilled workers.",
            "公司希望留住熟练员工。",
            .hard
        ),
        word(
            "exceed",
            "/ɪkˈsiːd/",
            "超过；超出",
            "Demand may exceed the available supply.",
            "需求可能超过可用供应量。",
            .medium
        )
    ]

    private static func word(
        _ id: String,
        _ pronunciation: String,
        _ meaning: String,
        _ example: String,
        _ exampleMeaning: String,
        _ difficulty: VocabularyWord.Difficulty,
        term: String? = nil
    ) -> VocabularyWord {
        VocabularyWord(
            id: id,
            term: term ?? id,
            pronunciation: pronunciation,
            meaning: meaning,
            example: example,
            exampleMeaning: exampleMeaning,
            difficulty: difficulty
        )
    }
}
