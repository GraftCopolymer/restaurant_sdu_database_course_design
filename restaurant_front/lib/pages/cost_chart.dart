import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/network/cost_service.dart';
import 'package:restaurant_management/providers/cost_chart_data_provider.dart';
import 'package:restaurant_management/src/generated/cost_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/types.pbenum.dart';
import 'package:restaurant_management/utils/data_extends.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/chart_indicator.dart';
import 'package:restaurant_management/widgets/form_section.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// 成本可视化页面
@RoutePage()
class CostChartPage extends ConsumerStatefulWidget {
  const CostChartPage({super.key});

  @override
  ConsumerState<CostChartPage> createState() => _CostChartPageState();
}

class _CostChartPageState extends ConsumerState<CostChartPage> {
  AutoDisposeAsyncNotifierProvider<CostChartDataNotifier, CostChartData>
  get provider => costChartDataNotifierProvider;

  Widget _buildBody(MediaQueryData mediaQueryData) {
    final asyncChartData = ref.watch(provider);
    return asyncChartData.when(
      data: (chartData) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CostDistributionPieChart(chartData: chartData),
                      SalaryRankChart(chartData: chartData),
                      TotalCostLineChart(chartData: chartData),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        Utils.report(error, stackTrace);
        return Center(
          child: Text("加载错误${error is GrpcError ? ": ${error.message}" : ""}"),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("成本可视化"), leading: BackButton()),
        body: _buildBody(mediaQueryData),
      ),
    );
  }
}

/// 成本分布饼状图
class CostDistributionPieChart extends StatefulWidget {
  const CostDistributionPieChart({super.key, required this.chartData});

  final CostChartData chartData;

  @override
  State<CostDistributionPieChart> createState() =>
      _CostDistributionPieChartState();
}

class _CostDistributionPieChartState extends State<CostDistributionPieChart> {
  int touchedIndex = -1;

  /// 缓存随机出来的颜色, 防止rebuild时颜色变化
  final Map<CostType, Color> _costDistributionPieColors = {};

  Widget _buildCostDistributionPieChart(
    MediaQueryData mediaData,
    CostChartData chartData,
  ) {
    // 数据
    final List<PieChartSectionData> sectionDataList = [];
    // 图例
    List<ChartIndicator> indicators = [];
    final width = mediaData.size.width;
    final double height = 300;
    int index = 0;
    double sectionRadius = 40;
    for (final costDistributionData
        in chartData.costDistribution.costDistributionList) {
      final double? value = double.tryParse(costDistributionData.total);
      if (value == null || value == 0) {
        continue;
      }
      Color? color = _costDistributionPieColors[costDistributionData.costType];
      if (color == null) {
        _costDistributionPieColors[costDistributionData.costType] =
            Utils.randomColor();
        color = _costDistributionPieColors[costDistributionData.costType];
      }
      sectionDataList.add(
        PieChartSectionData(
          color: color,
          value: value,
          radius: touchedIndex == index ? sectionRadius + 20 : sectionRadius,
        ),
      );
      int _index = index;
      indicators.add(
        ChartIndicator(
          color: color!,
          text: costDistributionData.desc,
          size: touchedIndex == index ? 20 : 16,
          isSquare: false,
          onTap: () {
            setState(() {
              touchedIndex = _index;
            });
          },
        ),
      );
      index++;
    }
    return FormSection(
      title: Text("成本分布"),
      content: Column(
        children: [
          Wrap(spacing: 10, direction: Axis.horizontal, children: indicators),
          SizedBox(
            width: width,
            height: height,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                startDegreeOffset: 0,
                sectionsSpace: 0,
                centerSpaceRadius: 50,
                sections: sectionDataList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCostDistributionPieChart(
      MediaQuery.of(context),
      widget.chartData,
    );
  }
}

/// 薪资排行 top5
class SalaryRankChart extends StatefulWidget {
  const SalaryRankChart({super.key, required this.chartData});

  final CostChartData chartData;

  @override
  State<SalaryRankChart> createState() => _SalaryRankChartState();
}

class _SalaryRankChartState extends State<SalaryRankChart> {
  List<BarChartGroupData> _buildBarGroupDataList() {
    final List<BarChartGroupData> ret = [];
    int index = 0;
    for (final salaryRankItem in widget.chartData.salaryRank.salaryRankList) {
      ret.add(
        BarChartGroupData(
          x: index,
          barRods: [BarChartRodData(toY: salaryRankItem.salary.d().toDouble())],
        ),
      );
      index++;
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FormSection(
      title: Text("薪资人力成本 - 薪资排行"),
      content: SizedBox(
        width: width,
        height: 300,
        child: BarChart(
          BarChartData(
            barGroups: _buildBarGroupDataList(),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    return Text(
                      widget.chartData.salaryRank.salaryRankList[index].name,
                    );
                  },
                  showTitles: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 总成本变化趋势
class TotalCostLineChart extends ConsumerStatefulWidget {
  const TotalCostLineChart({super.key, required this.chartData});

  final CostChartData chartData;

  @override
  ConsumerState<TotalCostLineChart> createState() => _TotalCostLineChartState();
}

class _TotalCostLineChartState extends ConsumerState<TotalCostLineChart> {
  int _selectedYear = DateTime.now().year; // 默认使用当前年份
  late int _tempYear = _selectedYear;

  late final family =
      FutureProvider.family<MonthlyCostList, int>((ref, year) async {
        final req = GetMonthlyCostTrendReq(year: year);
        return (await CostService.client.getMonthlyCostTrend(
          req,
        )).monthlyCostTrend;
      });

  FutureProvider<MonthlyCostList> get provider => family(_selectedYear);

  List<Color> gradientColors = [Colors.cyan, Colors.blue, Colors.red];
  Widget _buildYearSelector() {
    return FilledButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedYear = _tempYear;
                        });
                        // 关闭
                        router.pop();
                      },
                      child: Text("确定"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedYear - 2000,
                    ),
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      _tempYear = 2000 + index;
                    },
                    children: List.generate(
                      50,
                      (index) => Center(child: Text('${2000 + index}')),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Text("年份: $_selectedYear"),
    );
  }

  Widget _buildLineChart() {
    final asyncMonthlyTrendData = ref.watch(provider);
    return asyncMonthlyTrendData.when(
      data: (monthlyTrendData) {
        List<FlSpot> spotList = [];
        for (final monthData in monthlyTrendData.monthlyCostList) {
          spotList.add(
            FlSpot(monthData.month.toDouble(), monthData.value.d().toDouble())
          );
        }
        return LineChart(
          LineChartData(
            minX: 0,
            minY: 0,
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                gradient: LinearGradient(colors: gradientColors),
                barWidth: 4,
                spots: spotList,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withValues(alpha: 0.3))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (e, s) {
        Utils.report(e, s);
        return Text("加载失败${e is GrpcError ? ": ${e.message}" : ''}");
      },
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FormSection(
      title: Text("成本趋势"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 年份选择器
          _buildYearSelector(),
          SizedBox(width: width, height: 300, child: _buildLineChart()),
        ],
      ),
    );
  }
}
