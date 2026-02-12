*——————————————————————————————
* 基准回归结果导出至桌面
*——————————————————————————————

* 1. 设置面板数据
xtset Province Year

* 2. 定义控制变量列表
local controls ///
    pdensity ///
    税负水平 ///
    产业聚集程度 ///
    能源结构 ///
    政府干预程度 ///
    对外开放程度

* 3. 回归并存储五个模型
* 3.1 全国样本 — 仅核心解释变量 ED
eststo m1: xtreg YCC_comb ED i.Year, fe vce(cluster Province)

* 3.2 全国样本 — 加入所有控制变量
eststo m2: xtreg YCC_comb ED `controls' i.Year, fe vce(cluster Province)

* 3.3 东部子样本
eststo m3: xtreg YCC_comb ED `controls' if region==1

* 3.4 中部子样本
eststo m4: xtreg YCC_comb ED `controls' if region==2

* 3.5 西部子样本
eststo m5: xtreg YCC_comb ED `controls' if region==3

* 4. 导出为 Word 三线表（RTF 格式），文件保存在桌面
esttab m1 m2 m3 m4 m5 using "C:\Users\liuch\Desktop\基准回归结果.rtf", replace ///
    title("表1 基准回归结果") ///
    se /// 括号内显示 t 值
    label /// 使用变量标签（如已定义）
    mtitle("全国样本(无控)" "全国样本(有控)" "东部样本" "中部样本" "西部样本") ///
    starlevels(* 0.10 ** 0.05 *** 0.01) ///
    nogaps /// 列间无额外空行
    nonumber /// 去掉模型编号
    alignment(c) /// 居中对齐
    stats(N r2, labels("观测值" "R²") fmt(0 3)) ///
    addnotes("注：括号内为 t 值；* p<0.10, ** p<0.05, *** p<0.01")
