#import "/config.typ": template, tufted
#show: template.with(title: "考试")

= 考试
#table(
  columns: (1fr, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*科目*], [*时间*], [*地点*],
  ),
  [非线性规划], [6 月 22 日 09:00 -- 11:30], [敬信 F3],
  [微分动力系统], [6 月 28 日 13:30 -- 16:00], [逸夫 7 阶],
  [微分几何], [7 月 1 日 15:30 -- 18:00], [敬信 F3],

)
