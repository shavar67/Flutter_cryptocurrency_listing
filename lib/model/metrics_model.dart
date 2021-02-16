import 'dart:ffi';

class MarketDataModel {
  String id;
  String symbol;
  String name;
  String slug;
  String sInternalTempAgoraId;
  MarketData marketData;
  Marketcap marketcap;
  Supply supply;
  BlockchainStats24Hours blockchainStats24Hours;
  MarketDataLiquidity marketDataLiquidity;
  AllTimeHigh allTimeHigh;
  CycleLow cycleLow;
  TokenSaleStats tokenSaleStats;
  StakingStats stakingStats;
  MiningStats miningStats;
  DeveloperActivity developerActivity;
  RoiData roiData;
  RoiByYear roiByYear;
  RiskMetrics riskMetrics;
  MiscData miscData;

  BorrowRates borrowRates;
  LoanData loanData;
  Reddit reddit;
  OnChainData onChainData;
  ExchangeFlows exchangeFlows;
  Null alertMessages;

  MarketDataModel(
      {this.id,
      this.symbol,
      this.name,
      this.slug,
      this.sInternalTempAgoraId,
      this.marketData,
      this.marketcap,
      this.supply,
      this.blockchainStats24Hours,
      this.marketDataLiquidity,
      this.allTimeHigh,
      this.cycleLow,
      this.tokenSaleStats,
      this.stakingStats,
      this.miningStats,
      this.developerActivity,
      this.roiData,
      this.roiByYear,
      this.riskMetrics,
      this.miscData,
      this.borrowRates,
      this.loanData,
      this.reddit,
      this.onChainData,
      this.exchangeFlows,
      this.alertMessages});

  MarketDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    slug = json['slug'];
    sInternalTempAgoraId = json['_internal_temp_agora_id'];
    marketData = json['market_data'] != null
        ? new MarketData.fromJson(json['market_data'])
        : null;
    marketcap = json['marketcap'] != null
        ? new Marketcap.fromJson(json['marketcap'])
        : null;
    supply =
        json['supply'] != null ? new Supply.fromJson(json['supply']) : null;
    blockchainStats24Hours = json['blockchain_stats_24_hours'] != null
        ? new BlockchainStats24Hours.fromJson(json['blockchain_stats_24_hours'])
        : null;
    marketDataLiquidity = json['market_data_liquidity'] != null
        ? new MarketDataLiquidity.fromJson(json['market_data_liquidity'])
        : null;
    allTimeHigh = json['all_time_high'] != null
        ? new AllTimeHigh.fromJson(json['all_time_high'])
        : null;
    cycleLow = json['cycle_low'] != null
        ? new CycleLow.fromJson(json['cycle_low'])
        : null;
    tokenSaleStats = json['token_sale_stats'] != null
        ? new TokenSaleStats.fromJson(json['token_sale_stats'])
        : null;
    stakingStats = json['staking_stats'] != null
        ? new StakingStats.fromJson(json['staking_stats'])
        : null;
    miningStats = json['mining_stats'] != null
        ? new MiningStats.fromJson(json['mining_stats'])
        : null;
    developerActivity = json['developer_activity'] != null
        ? new DeveloperActivity.fromJson(json['developer_activity'])
        : null;
    roiData = json['roi_data'] != null
        ? new RoiData.fromJson(json['roi_data'])
        : null;
    roiByYear = json['roi_by_year'] != null
        ? new RoiByYear.fromJson(json['roi_by_year'])
        : null;
    riskMetrics = json['risk_metrics'] != null
        ? new RiskMetrics.fromJson(json['risk_metrics'])
        : null;

    borrowRates = json['borrow_rates'] != null
        ? new BorrowRates.fromJson(json['borrow_rates'])
        : null;
    loanData = json['loan_data'] != null
        ? new LoanData.fromJson(json['loan_data'])
        : null;
    reddit =
        json['reddit'] != null ? new Reddit.fromJson(json['reddit']) : null;
    onChainData = json['on_chain_data'] != null
        ? new OnChainData.fromJson(json['on_chain_data'])
        : null;
    exchangeFlows = json['exchange_flows'] != null
        ? new ExchangeFlows.fromJson(json['exchange_flows'])
        : null;
    alertMessages = json['alert_messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['_internal_temp_agora_id'] = this.sInternalTempAgoraId;
    if (this.marketData != null) {
      data['market_data'] = this.marketData.toJson();
    }
    if (this.marketcap != null) {
      data['marketcap'] = this.marketcap.toJson();
    }
    if (this.supply != null) {
      data['supply'] = this.supply.toJson();
    }
    if (this.blockchainStats24Hours != null) {
      data['blockchain_stats_24_hours'] = this.blockchainStats24Hours.toJson();
    }
    if (this.marketDataLiquidity != null) {
      data['market_data_liquidity'] = this.marketDataLiquidity.toJson();
    }
    if (this.allTimeHigh != null) {
      data['all_time_high'] = this.allTimeHigh.toJson();
    }
    if (this.cycleLow != null) {
      data['cycle_low'] = this.cycleLow.toJson();
    }
    if (this.tokenSaleStats != null) {
      data['token_sale_stats'] = this.tokenSaleStats.toJson();
    }
    if (this.stakingStats != null) {
      data['staking_stats'] = this.stakingStats.toJson();
    }
    if (this.miningStats != null) {
      data['mining_stats'] = this.miningStats.toJson();
    }
    if (this.developerActivity != null) {
      data['developer_activity'] = this.developerActivity.toJson();
    }
    if (this.roiData != null) {
      data['roi_data'] = this.roiData.toJson();
    }
    if (this.roiByYear != null) {
      data['roi_by_year'] = this.roiByYear.toJson();
    }
    if (this.riskMetrics != null) {
      data['risk_metrics'] = this.riskMetrics.toJson();
    }
    if (this.miscData != null) {
      data['misc_data'] = this.miscData.toJson();
    }

    if (this.borrowRates != null) {
      data['borrow_rates'] = this.borrowRates.toJson();
    }
    if (this.loanData != null) {
      data['loan_data'] = this.loanData.toJson();
    }
    if (this.reddit != null) {
      data['reddit'] = this.reddit.toJson();
    }
    if (this.onChainData != null) {
      data['on_chain_data'] = this.onChainData.toJson();
    }
    if (this.exchangeFlows != null) {
      data['exchange_flows'] = this.exchangeFlows.toJson();
    }
    data['alert_messages'] = this.alertMessages;
    return data;
  }
}

class MarketData {
  double priceUsd;
  int priceBtc;
  double priceEth;
  double volumeLast24Hours;
  double realVolumeLast24Hours;
  double volumeLast24HoursOverstatementMultiple;
  double percentChangeUsdLast1Hour;
  double percentChangeUsdLast24Hours;
  int percentChangeBtcLast24Hours;
  double percentChangeEthLast24Hours;
  OhlcvLast1Hour ohlcvLast1Hour;
  OhlcvLast1Hour ohlcvLast24Hour;
  String lastTradeAt;

  MarketData(
      {this.priceUsd,
      this.priceBtc,
      this.priceEth,
      this.volumeLast24Hours,
      this.realVolumeLast24Hours,
      this.volumeLast24HoursOverstatementMultiple,
      this.percentChangeUsdLast1Hour,
      this.percentChangeUsdLast24Hours,
      this.percentChangeBtcLast24Hours,
      this.percentChangeEthLast24Hours,
      this.ohlcvLast1Hour,
      this.ohlcvLast24Hour,
      this.lastTradeAt});

  MarketData.fromJson(Map<String, dynamic> json) {
    priceUsd = json['price_usd'];
    priceBtc = json['price_btc'];
    priceEth = json['price_eth'];
    volumeLast24Hours = json['volume_last_24_hours'];
    realVolumeLast24Hours = json['real_volume_last_24_hours'];
    volumeLast24HoursOverstatementMultiple =
        json['volume_last_24_hours_overstatement_multiple'];
    percentChangeUsdLast1Hour = json['percent_change_usd_last_1_hour'];
    percentChangeUsdLast24Hours = json['percent_change_usd_last_24_hours'];
    percentChangeBtcLast24Hours = json['percent_change_btc_last_24_hours'];
    percentChangeEthLast24Hours = json['percent_change_eth_last_24_hours'];
    ohlcvLast1Hour = json['ohlcv_last_1_hour'] != null
        ? new OhlcvLast1Hour.fromJson(json['ohlcv_last_1_hour'])
        : null;
    ohlcvLast24Hour = json['ohlcv_last_24_hour'] != null
        ? new OhlcvLast1Hour.fromJson(json['ohlcv_last_24_hour'])
        : null;
    lastTradeAt = json['last_trade_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_usd'] = this.priceUsd;
    data['price_btc'] = this.priceBtc;
    data['price_eth'] = this.priceEth;
    data['volume_last_24_hours'] = this.volumeLast24Hours;
    data['real_volume_last_24_hours'] = this.realVolumeLast24Hours;
    data['volume_last_24_hours_overstatement_multiple'] =
        this.volumeLast24HoursOverstatementMultiple;
    data['percent_change_usd_last_1_hour'] = this.percentChangeUsdLast1Hour;
    data['percent_change_usd_last_24_hours'] = this.percentChangeUsdLast24Hours;
    data['percent_change_btc_last_24_hours'] = this.percentChangeBtcLast24Hours;
    data['percent_change_eth_last_24_hours'] = this.percentChangeEthLast24Hours;
    if (this.ohlcvLast1Hour != null) {
      data['ohlcv_last_1_hour'] = this.ohlcvLast1Hour.toJson();
    }
    if (this.ohlcvLast24Hour != null) {
      data['ohlcv_last_24_hour'] = this.ohlcvLast24Hour.toJson();
    }
    data['last_trade_at'] = this.lastTradeAt;
    return data;
  }
}

class OhlcvLast1Hour {
  double open;
  double high;
  double low;
  double close;
  double volume;

  OhlcvLast1Hour({this.open, this.high, this.low, this.close, this.volume});

  OhlcvLast1Hour.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['volume'] = this.volume;
    return data;
  }
}

class Marketcap {
  double marketcapDominancePercent;
  double currentMarketcapUsd;
  double y2050MarketcapUsd;
  double yPlus10MarketcapUsd;
  double liquidMarketcapUsd;
  double realizedMarketcapUsd;
  double volumeTurnoverLast24HoursPercent;

  Marketcap(
      {this.marketcapDominancePercent,
      this.currentMarketcapUsd,
      this.y2050MarketcapUsd,
      this.yPlus10MarketcapUsd,
      this.liquidMarketcapUsd,
      this.realizedMarketcapUsd,
      this.volumeTurnoverLast24HoursPercent});

  Marketcap.fromJson(Map<String, dynamic> json) {
    marketcapDominancePercent = json['marketcap_dominance_percent'];
    currentMarketcapUsd = json['current_marketcap_usd'];
    y2050MarketcapUsd = json['y_2050_marketcap_usd'];
    yPlus10MarketcapUsd = json['y_plus10_marketcap_usd'];
    liquidMarketcapUsd = json['liquid_marketcap_usd'];
    realizedMarketcapUsd = json['realized_marketcap_usd'];
    volumeTurnoverLast24HoursPercent =
        json['volume_turnover_last_24_hours_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marketcap_dominance_percent'] = this.marketcapDominancePercent;
    data['current_marketcap_usd'] = this.currentMarketcapUsd;
    data['y_2050_marketcap_usd'] = this.y2050MarketcapUsd;
    data['y_plus10_marketcap_usd'] = this.yPlus10MarketcapUsd;
    data['liquid_marketcap_usd'] = this.liquidMarketcapUsd;
    data['realized_marketcap_usd'] = this.realizedMarketcapUsd;
    data['volume_turnover_last_24_hours_percent'] =
        this.volumeTurnoverLast24HoursPercent;
    return data;
  }
}

class Supply {
  double y2050;
  double yPlus10;
  double liquid;
  double circulating;
  double y2050IssuedPercent;
  double annualInflationPercent;
  double stockToFlow;
  double yPlus10IssuedPercent;

  Supply(
      {this.y2050,
      this.yPlus10,
      this.liquid,
      this.circulating,
      this.y2050IssuedPercent,
      this.annualInflationPercent,
      this.stockToFlow,
      this.yPlus10IssuedPercent});

  Supply.fromJson(Map<String, dynamic> json) {
    y2050 = json['y_2050'];
    yPlus10 = json['y_plus10'];
    liquid = json['liquid'];
    circulating = json['circulating'];
    y2050IssuedPercent = json['y_2050_issued_percent'];
    annualInflationPercent = json['annual_inflation_percent'];
    stockToFlow = json['stock_to_flow'];
    yPlus10IssuedPercent = json['y_plus10_issued_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['y_2050'] = this.y2050;
    data['y_plus10'] = this.yPlus10;
    data['liquid'] = this.liquid;
    data['circulating'] = this.circulating;
    data['y_2050_issued_percent'] = this.y2050IssuedPercent;
    data['annual_inflation_percent'] = this.annualInflationPercent;
    data['stock_to_flow'] = this.stockToFlow;
    data['y_plus10_issued_percent'] = this.yPlus10IssuedPercent;
    return data;
  }
}

class BlockchainStats24Hours {
  int countOfActiveAddresses;
  double transactionVolume;
  double adjustedTransactionVolume;
  double nvt;
  double adjustedNvt;
  double medianTxValue;
  double medianTxFee;
  int countOfTx;
  int countOfPayments;
  double newIssuance;
  double averageDifficulty;
  double kilobytesAdded;
  int countOfBlocksAdded;

  BlockchainStats24Hours(
      {this.countOfActiveAddresses,
      this.transactionVolume,
      this.adjustedTransactionVolume,
      this.nvt,
      this.adjustedNvt,
      this.medianTxValue,
      this.medianTxFee,
      this.countOfTx,
      this.countOfPayments,
      this.newIssuance,
      this.averageDifficulty,
      this.kilobytesAdded,
      this.countOfBlocksAdded});

  BlockchainStats24Hours.fromJson(Map<String, dynamic> json) {
    countOfActiveAddresses = json['count_of_active_addresses'];
    transactionVolume = json['transaction_volume'];
    adjustedTransactionVolume = json['adjusted_transaction_volume'];
    nvt = json['nvt'];
    adjustedNvt = json['adjusted_nvt'];
    medianTxValue = json['median_tx_value'];
    medianTxFee = json['median_tx_fee'];
    countOfTx = json['count_of_tx'];
    countOfPayments = json['count_of_payments'];
    newIssuance = (json['new_issuance'] as num).toDouble();
    averageDifficulty = json['average_difficulty'];
    kilobytesAdded = json['kilobytes_added'];
    countOfBlocksAdded = json['count_of_blocks_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_of_active_addresses'] = this.countOfActiveAddresses;
    data['transaction_volume'] = this.transactionVolume;
    data['adjusted_transaction_volume'] = this.adjustedTransactionVolume;
    data['nvt'] = this.nvt;
    data['adjusted_nvt'] = this.adjustedNvt;
    data['median_tx_value'] = this.medianTxValue;
    data['median_tx_fee'] = this.medianTxFee;
    data['count_of_tx'] = this.countOfTx;
    data['count_of_payments'] = this.countOfPayments;
    data['new_issuance'] = this.newIssuance;
    data['average_difficulty'] = this.averageDifficulty;
    data['kilobytes_added'] = this.kilobytesAdded;
    data['count_of_blocks_added'] = this.countOfBlocksAdded;
    return data;
  }
}

class MarketDataLiquidity {
  Null clearingPricesToSell;
  Null marketcap;
  Null assetBidDepth;
  Null usdBidDepth;
  String updatedAt;

  MarketDataLiquidity(
      {this.clearingPricesToSell,
      this.marketcap,
      this.assetBidDepth,
      this.usdBidDepth,
      this.updatedAt});

  MarketDataLiquidity.fromJson(Map<String, dynamic> json) {
    clearingPricesToSell = json['clearing_prices_to_sell'];
    marketcap = json['marketcap'];
    assetBidDepth = json['asset_bid_depth'];
    usdBidDepth = json['usd_bid_depth'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clearing_prices_to_sell'] = this.clearingPricesToSell;
    data['marketcap'] = this.marketcap;
    data['asset_bid_depth'] = this.assetBidDepth;
    data['usd_bid_depth'] = this.usdBidDepth;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AllTimeHigh {
  double price;
  String at;
  int daysSince;
  double percentDown;
  double breakevenMultiple;

  AllTimeHigh(
      {this.price,
      this.at,
      this.daysSince,
      this.percentDown,
      this.breakevenMultiple});

  AllTimeHigh.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    at = json['at'];
    daysSince = json['days_since'];
    percentDown = (json['percent_down'] as num).toDouble();
    breakevenMultiple = json['breakeven_multiple'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['at'] = this.at;
    data['days_since'] = this.daysSince;
    data['percent_down'] = this.percentDown;
    data['breakeven_multiple'] = this.breakevenMultiple;
    return data;
  }
}

class CycleLow {
  double price;
  String at;
  double percentUp;
  int daysSince;

  CycleLow({this.price, this.at, this.percentUp, this.daysSince});

  CycleLow.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    at = json['at'];
    percentUp = json['percent_up'];
    daysSince = json['days_since'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['at'] = this.at;
    data['percent_up'] = this.percentUp;
    data['days_since'] = this.daysSince;
    return data;
  }
}

class TokenSaleStats {
  Null saleProceedsUsd;
  Null saleStartDate;
  Null saleEndDate;
  Null roiSinceSaleUsdPercent;
  Null roiSinceSaleBtcPercent;
  Null roiSinceSaleEthPercent;

  TokenSaleStats(
      {this.saleProceedsUsd,
      this.saleStartDate,
      this.saleEndDate,
      this.roiSinceSaleUsdPercent,
      this.roiSinceSaleBtcPercent,
      this.roiSinceSaleEthPercent});

  TokenSaleStats.fromJson(Map<String, dynamic> json) {
    saleProceedsUsd = json['sale_proceeds_usd'];
    saleStartDate = json['sale_start_date'];
    saleEndDate = json['sale_end_date'];
    roiSinceSaleUsdPercent = json['roi_since_sale_usd_percent'];
    roiSinceSaleBtcPercent = json['roi_since_sale_btc_percent'];
    roiSinceSaleEthPercent = json['roi_since_sale_eth_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sale_proceeds_usd'] = this.saleProceedsUsd;
    data['sale_start_date'] = this.saleStartDate;
    data['sale_end_date'] = this.saleEndDate;
    data['roi_since_sale_usd_percent'] = this.roiSinceSaleUsdPercent;
    data['roi_since_sale_btc_percent'] = this.roiSinceSaleBtcPercent;
    data['roi_since_sale_eth_percent'] = this.roiSinceSaleEthPercent;
    return data;
  }
}

class StakingStats {
  Null stakingYieldPercent;
  Null stakingType;
  Null stakingMinimum;
  Null tokensStaked;
  Null tokensStakedPercent;
  Null realStakingYieldPercent;

  StakingStats(
      {this.stakingYieldPercent,
      this.stakingType,
      this.stakingMinimum,
      this.tokensStaked,
      this.tokensStakedPercent,
      this.realStakingYieldPercent});

  StakingStats.fromJson(Map<String, dynamic> json) {
    stakingYieldPercent = json['staking_yield_percent'];
    stakingType = json['staking_type'];
    stakingMinimum = json['staking_minimum'];
    tokensStaked = json['tokens_staked'];
    tokensStakedPercent = json['tokens_staked_percent'];
    realStakingYieldPercent = json['real_staking_yield_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staking_yield_percent'] = this.stakingYieldPercent;
    data['staking_type'] = this.stakingType;
    data['staking_minimum'] = this.stakingMinimum;
    data['tokens_staked'] = this.tokensStaked;
    data['tokens_staked_percent'] = this.tokensStakedPercent;
    data['real_staking_yield_percent'] = this.realStakingYieldPercent;
    return data;
  }
}

class MiningStats {
  String miningAlgo;
  String networkHashRate;
  double availableOnNicehashPercent;
  double d1HourAttackCost;
  double d24HoursAttackCost;
  double attackAppeal;
  double miningRevenueNative;
  double miningRevenueUsd;
  double averageDifficulty;

  MiningStats(
      {this.miningAlgo,
      this.networkHashRate,
      this.availableOnNicehashPercent,
      this.d1HourAttackCost,
      this.d24HoursAttackCost,
      this.attackAppeal,
      this.miningRevenueNative,
      this.miningRevenueUsd,
      this.averageDifficulty});

  MiningStats.fromJson(Map<String, dynamic> json) {
    miningAlgo = json['mining_algo'];
    networkHashRate = json['network_hash_rate'];
    availableOnNicehashPercent = json['available_on_nicehash_percent'];
    d1HourAttackCost = json['1_hour_attack_cost'];
    d24HoursAttackCost = json['24_hours_attack_cost'];
    attackAppeal = json['attack_appeal'];
    miningRevenueNative = json['mining_revenue_native'];
    miningRevenueUsd = json['mining_revenue_usd'];
    averageDifficulty = json['average_difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mining_algo'] = this.miningAlgo;
    data['network_hash_rate'] = this.networkHashRate;
    data['available_on_nicehash_percent'] = this.availableOnNicehashPercent;
    data['1_hour_attack_cost'] = this.d1HourAttackCost;
    data['24_hours_attack_cost'] = this.d24HoursAttackCost;
    data['attack_appeal'] = this.attackAppeal;
    data['mining_revenue_native'] = this.miningRevenueNative;
    data['mining_revenue_usd'] = this.miningRevenueUsd;
    data['average_difficulty'] = this.averageDifficulty;
    return data;
  }
}

class DeveloperActivity {
  int stars;
  int watchers;
  int commitsLast3Months;
  int commitsLast1Year;
  int linesAddedLast3Months;
  int linesAddedLast1Year;
  int linesDeletedLast3Months;
  int linesDeletedLast1Year;

  DeveloperActivity(
      {this.stars,
      this.watchers,
      this.commitsLast3Months,
      this.commitsLast1Year,
      this.linesAddedLast3Months,
      this.linesAddedLast1Year,
      this.linesDeletedLast3Months,
      this.linesDeletedLast1Year});

  DeveloperActivity.fromJson(Map<String, dynamic> json) {
    stars = json['stars'];
    watchers = json['watchers'];
    commitsLast3Months = json['commits_last_3_months'];
    commitsLast1Year = json['commits_last_1_year'];
    linesAddedLast3Months = json['lines_added_last_3_months'];
    linesAddedLast1Year = json['lines_added_last_1_year'];
    linesDeletedLast3Months = json['lines_deleted_last_3_months'];
    linesDeletedLast1Year = json['lines_deleted_last_1_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stars'] = this.stars;
    data['watchers'] = this.watchers;
    data['commits_last_3_months'] = this.commitsLast3Months;
    data['commits_last_1_year'] = this.commitsLast1Year;
    data['lines_added_last_3_months'] = this.linesAddedLast3Months;
    data['lines_added_last_1_year'] = this.linesAddedLast1Year;
    data['lines_deleted_last_3_months'] = this.linesDeletedLast3Months;
    data['lines_deleted_last_1_year'] = this.linesDeletedLast1Year;
    return data;
  }
}

class RoiData {
  double percentChangeLast1Week;
  double percentChangeLast1Month;
  double percentChangeLast3Months;
  double percentChangeLast1Year;
  int percentChangeBtcLast1Week;
  int percentChangeBtcLast1Month;
  int percentChangeBtcLast3Months;
  int percentChangeBtcLast1Year;
  double percentChangeEthLast1Week;
  double percentChangeEthLast1Month;
  double percentChangeEthLast3Months;
  double percentChangeEthLast1Year;
  double percentChangeMonthToDate;
  double percentChangeQuarterToDate;
  double percentChangeYearToDate;

  RoiData(
      {this.percentChangeLast1Week,
      this.percentChangeLast1Month,
      this.percentChangeLast3Months,
      this.percentChangeLast1Year,
      this.percentChangeBtcLast1Week,
      this.percentChangeBtcLast1Month,
      this.percentChangeBtcLast3Months,
      this.percentChangeBtcLast1Year,
      this.percentChangeEthLast1Week,
      this.percentChangeEthLast1Month,
      this.percentChangeEthLast3Months,
      this.percentChangeEthLast1Year,
      this.percentChangeMonthToDate,
      this.percentChangeQuarterToDate,
      this.percentChangeYearToDate});

  RoiData.fromJson(Map<String, dynamic> json) {
    percentChangeLast1Week = json['percent_change_last_1_week'];
    percentChangeLast1Month = json['percent_change_last_1_month'];
    percentChangeLast3Months = json['percent_change_last_3_months'];
    percentChangeLast1Year = json['percent_change_last_1_year'];
    percentChangeBtcLast1Week = json['percent_change_btc_last_1_week'];
    percentChangeBtcLast1Month = json['percent_change_btc_last_1_month'];
    percentChangeBtcLast3Months = json['percent_change_btc_last_3_months'];
    percentChangeBtcLast1Year = json['percent_change_btc_last_1_year'];
    percentChangeEthLast1Week = json['percent_change_eth_last_1_week'];
    percentChangeEthLast1Month = json['percent_change_eth_last_1_month'];
    percentChangeEthLast3Months = json['percent_change_eth_last_3_months'];
    percentChangeEthLast1Year = json['percent_change_eth_last_1_year'];
    percentChangeMonthToDate = json['percent_change_month_to_date'];
    percentChangeQuarterToDate = json['percent_change_quarter_to_date'];
    percentChangeYearToDate = json['percent_change_year_to_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percent_change_last_1_week'] = this.percentChangeLast1Week;
    data['percent_change_last_1_month'] = this.percentChangeLast1Month;
    data['percent_change_last_3_months'] = this.percentChangeLast3Months;
    data['percent_change_last_1_year'] = this.percentChangeLast1Year;
    data['percent_change_btc_last_1_week'] = this.percentChangeBtcLast1Week;
    data['percent_change_btc_last_1_month'] = this.percentChangeBtcLast1Month;
    data['percent_change_btc_last_3_months'] = this.percentChangeBtcLast3Months;
    data['percent_change_btc_last_1_year'] = this.percentChangeBtcLast1Year;
    data['percent_change_eth_last_1_week'] = this.percentChangeEthLast1Week;
    data['percent_change_eth_last_1_month'] = this.percentChangeEthLast1Month;
    data['percent_change_eth_last_3_months'] = this.percentChangeEthLast3Months;
    data['percent_change_eth_last_1_year'] = this.percentChangeEthLast1Year;
    data['percent_change_month_to_date'] = this.percentChangeMonthToDate;
    data['percent_change_quarter_to_date'] = this.percentChangeQuarterToDate;
    data['percent_change_year_to_date'] = this.percentChangeYearToDate;
    return data;
  }
}

class RoiByYear {
  double d2020UsdPercent;
  double d2019UsdPercent;
  double d2018UsdPercent;
  double d2017UsdPercent;
  double d2016UsdPercent;
  double d2015UsdPercent;
  double d2014UsdPercent;
  double d2013UsdPercent;
  double d2012UsdPercent;
  double d2011UsdPercent;

  RoiByYear(
      {this.d2020UsdPercent,
      this.d2019UsdPercent,
      this.d2018UsdPercent,
      this.d2017UsdPercent,
      this.d2016UsdPercent,
      this.d2015UsdPercent,
      this.d2014UsdPercent,
      this.d2013UsdPercent,
      this.d2012UsdPercent,
      this.d2011UsdPercent});

  RoiByYear.fromJson(Map<String, dynamic> json) {
    d2020UsdPercent = json['2020_usd_percent'];
    d2019UsdPercent = json['2019_usd_percent'];
    d2018UsdPercent = json['2018_usd_percent'];
    d2017UsdPercent = json['2017_usd_percent'];
    d2016UsdPercent = json['2016_usd_percent'];
    d2015UsdPercent = json['2015_usd_percent'];
    d2014UsdPercent = json['2014_usd_percent'];
    d2013UsdPercent = json['2013_usd_percent'];
    d2012UsdPercent = json['2012_usd_percent'];
    d2011UsdPercent = json['2011_usd_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2020_usd_percent'] = this.d2020UsdPercent;
    data['2019_usd_percent'] = this.d2019UsdPercent;
    data['2018_usd_percent'] = this.d2018UsdPercent;
    data['2017_usd_percent'] = this.d2017UsdPercent;
    data['2016_usd_percent'] = this.d2016UsdPercent;
    data['2015_usd_percent'] = this.d2015UsdPercent;
    data['2014_usd_percent'] = this.d2014UsdPercent;
    data['2013_usd_percent'] = this.d2013UsdPercent;
    data['2012_usd_percent'] = this.d2012UsdPercent;
    data['2011_usd_percent'] = this.d2011UsdPercent;
    return data;
  }
}

class RiskMetrics {
  SharpeRatios sharpeRatios;
  VolatilityStats volatilityStats;

  RiskMetrics({this.sharpeRatios, this.volatilityStats});

  RiskMetrics.fromJson(Map<String, dynamic> json) {
    sharpeRatios = json['sharpe_ratios'] != null
        ? new SharpeRatios.fromJson(json['sharpe_ratios'])
        : null;
    volatilityStats = json['volatility_stats'] != null
        ? new VolatilityStats.fromJson(json['volatility_stats'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sharpeRatios != null) {
      data['sharpe_ratios'] = this.sharpeRatios.toJson();
    }
    if (this.volatilityStats != null) {
      data['volatility_stats'] = this.volatilityStats.toJson();
    }
    return data;
  }
}

class SharpeRatios {
  double last30Days;
  double last90Days;
  double last1Year;
  double last3Years;

  SharpeRatios(
      {this.last30Days, this.last90Days, this.last1Year, this.last3Years});

  SharpeRatios.fromJson(Map<String, dynamic> json) {
    last30Days = json['last_30_days'];
    last90Days = json['last_90_days'];
    last1Year = json['last_1_year'];
    last3Years = json['last_3_years'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_30_days'] = this.last30Days;
    data['last_90_days'] = this.last90Days;
    data['last_1_year'] = this.last1Year;
    data['last_3_years'] = this.last3Years;
    return data;
  }
}

class VolatilityStats {
  double volatilityLast30Days;
  double volatilityLast90Days;
  double volatilityLast1Year;
  double volatilityLast3Years;

  VolatilityStats(
      {this.volatilityLast30Days,
      this.volatilityLast90Days,
      this.volatilityLast1Year,
      this.volatilityLast3Years});

  VolatilityStats.fromJson(Map<String, dynamic> json) {
    volatilityLast30Days = json['volatility_last_30_days'];
    volatilityLast90Days = json['volatility_last_90_days'];
    volatilityLast1Year = json['volatility_last_1_year'];
    volatilityLast3Years = json['volatility_last_3_years'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volatility_last_30_days'] = this.volatilityLast30Days;
    data['volatility_last_90_days'] = this.volatilityLast90Days;
    data['volatility_last_1_year'] = this.volatilityLast1Year;
    data['volatility_last_3_years'] = this.volatilityLast3Years;
    return data;
  }
}

class MiscData {
  Null privateMarketPriceUsd;
  double vladimirClubCost;
  double btcCurrentNormalizedSupplyPriceUsd;
  double btcY2050NormalizedSupplyPriceUsd;
  String assetCreatedAt;
  int assetAgeDays;
  List<String> categories;
  List<String> sectors;
  List<String> tags;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['private_market_price_usd'] = this.privateMarketPriceUsd;
    data['vladimir_club_cost'] = this.vladimirClubCost;
    data['btc_current_normalized_supply_price_usd'] =
        this.btcCurrentNormalizedSupplyPriceUsd;
    data['btc_y2050_normalized_supply_price_usd'] =
        this.btcY2050NormalizedSupplyPriceUsd;
    data['asset_created_at'] = this.assetCreatedAt;
    data['asset_age_days'] = this.assetAgeDays;
    data['categories'] = this.categories;
    data['sectors'] = this.sectors;
    data['tags'] = this.tags;
    return data;
  }
}

class BorrowRates {
  double coinlist;

  BorrowRates({this.coinlist});

  BorrowRates.fromJson(Map<String, dynamic> json) {
    coinlist = json['coinlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinlist'] = this.coinlist;
    return data;
  }
}

class LoanData {
  Null originatedLast24HoursUsd;
  Null outstandingDebtUsd;
  Null repaidLast24HoursUsd;
  Null collateralizedLast24HoursUsd;
  Null collateralLiquidatedLast24HoursUsd;

  LoanData(
      {this.originatedLast24HoursUsd,
      this.outstandingDebtUsd,
      this.repaidLast24HoursUsd,
      this.collateralizedLast24HoursUsd,
      this.collateralLiquidatedLast24HoursUsd});

  LoanData.fromJson(Map<String, dynamic> json) {
    originatedLast24HoursUsd = json['originated_last_24_hours_usd'];
    outstandingDebtUsd = json['outstanding_debt_usd'];
    repaidLast24HoursUsd = json['repaid_last_24_hours_usd'];
    collateralizedLast24HoursUsd = json['collateralized_last_24_hours_usd'];
    collateralLiquidatedLast24HoursUsd =
        json['collateral_liquidated_last_24_hours_usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['originated_last_24_hours_usd'] = this.originatedLast24HoursUsd;
    data['outstanding_debt_usd'] = this.outstandingDebtUsd;
    data['repaid_last_24_hours_usd'] = this.repaidLast24HoursUsd;
    data['collateralized_last_24_hours_usd'] =
        this.collateralizedLast24HoursUsd;
    data['collateral_liquidated_last_24_hours_usd'] =
        this.collateralLiquidatedLast24HoursUsd;
    return data;
  }
}

class Reddit {
  int activeUserCount;
  int subscribers;

  Reddit({this.activeUserCount, this.subscribers});

  Reddit.fromJson(Map<String, dynamic> json) {
    activeUserCount = json['active_user_count'];
    subscribers = json['subscribers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_user_count'] = this.activeUserCount;
    data['subscribers'] = this.subscribers;
    return data;
  }
}

class OnChainData {
  int txnCountLast24Hours;
  int transferCountLast24Hours;
  double txnVolumeLast24HoursUsd;
  int activeAddresses;
  double totalFeesLast24HoursUsd;
  double totalFeesLast24Hours;
  double averageFeeUsd;
  double medianFeeUsd;
  double averageTransferValueUsd;
  double medianTransferValueUsd;
  double adjustedNvt;
  double issuanceLast24HoursUsd;
  double issuanceRate;
  double hashRate;
  int blockCount;
  int blockSizeBytesTotal;
  double blockSizeBytesAverage;

  OnChainData(
      {this.txnCountLast24Hours,
      this.transferCountLast24Hours,
      this.txnVolumeLast24HoursUsd,
      this.activeAddresses,
      this.totalFeesLast24HoursUsd,
      this.totalFeesLast24Hours,
      this.averageFeeUsd,
      this.medianFeeUsd,
      this.averageTransferValueUsd,
      this.medianTransferValueUsd,
      this.adjustedNvt,
      this.issuanceLast24HoursUsd,
      this.issuanceRate,
      this.hashRate,
      this.blockCount,
      this.blockSizeBytesTotal,
      this.blockSizeBytesAverage});

  OnChainData.fromJson(Map<String, dynamic> json) {
    txnCountLast24Hours = json['txn_count_last_24_hours'];
    transferCountLast24Hours = json['transfer_count_last_24_hours'];
    txnVolumeLast24HoursUsd = json['txn_volume_last_24_hours_usd'];
    activeAddresses = json['active_addresses'];
    totalFeesLast24HoursUsd = json['total_fees_last_24_hours_usd'];
    totalFeesLast24Hours = json['total_fees_last_24_hours'];
    averageFeeUsd = json['average_fee_usd'];
    medianFeeUsd = json['median_fee_usd'];
    averageTransferValueUsd = json['average_transfer_value_usd'];
    medianTransferValueUsd = json['median_transfer_value_usd'];
    adjustedNvt = json['adjusted_nvt'];
    issuanceLast24HoursUsd = json['issuance_last_24_hours_usd'];
    issuanceRate = json['issuance_rate'];
    hashRate = json['hash_rate'];
    blockCount = json['block_count'];
    blockSizeBytesTotal = json['block_size_bytes_total'];
    blockSizeBytesAverage = json['block_size_bytes_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txn_count_last_24_hours'] = this.txnCountLast24Hours;
    data['transfer_count_last_24_hours'] = this.transferCountLast24Hours;
    data['txn_volume_last_24_hours_usd'] = this.txnVolumeLast24HoursUsd;
    data['active_addresses'] = this.activeAddresses;
    data['total_fees_last_24_hours_usd'] = this.totalFeesLast24HoursUsd;
    data['total_fees_last_24_hours'] = this.totalFeesLast24Hours;
    data['average_fee_usd'] = this.averageFeeUsd;
    data['median_fee_usd'] = this.medianFeeUsd;
    data['average_transfer_value_usd'] = this.averageTransferValueUsd;
    data['median_transfer_value_usd'] = this.medianTransferValueUsd;
    data['adjusted_nvt'] = this.adjustedNvt;
    data['issuance_last_24_hours_usd'] = this.issuanceLast24HoursUsd;
    data['issuance_rate'] = this.issuanceRate;
    data['hash_rate'] = this.hashRate;
    data['block_count'] = this.blockCount;
    data['block_size_bytes_total'] = this.blockSizeBytesTotal;
    data['block_size_bytes_average'] = this.blockSizeBytesAverage;
    return data;
  }
}

class ExchangeFlows {
  double supplyExchangeUsd;
  double flowInExchangeNativeUnitsInclusive;
  double flowInExchangeUsdInclusive;
  double flowInExchangeNativeUnits;
  double flowInExchangeUsd;
  double flowOutExchangeNativeUnitsInclusive;
  double flowOutExchangeUsdInclusive;
  double flowOutExchangeNativeUnits;
  double flowOutExchangeUsd;

  ExchangeFlows(
      {this.supplyExchangeUsd,
      this.flowInExchangeNativeUnitsInclusive,
      this.flowInExchangeUsdInclusive,
      this.flowInExchangeNativeUnits,
      this.flowInExchangeUsd,
      this.flowOutExchangeNativeUnitsInclusive,
      this.flowOutExchangeUsdInclusive,
      this.flowOutExchangeNativeUnits,
      this.flowOutExchangeUsd});

  ExchangeFlows.fromJson(Map<String, dynamic> json) {
    supplyExchangeUsd = json['supply_exchange_usd'];
    flowInExchangeNativeUnitsInclusive =
        json['flow_in_exchange_native_units_inclusive'];
    flowInExchangeUsdInclusive = json['flow_in_exchange_usd_inclusive'];
    flowInExchangeNativeUnits = json['flow_in_exchange_native_units'];
    flowInExchangeUsd = json['flow_in_exchange_usd'];
    flowOutExchangeNativeUnitsInclusive =
        json['flow_out_exchange_native_units_inclusive'];
    flowOutExchangeUsdInclusive = json['flow_out_exchange_usd_inclusive'];
    flowOutExchangeNativeUnits = json['flow_out_exchange_native_units'];
    flowOutExchangeUsd = json['flow_out_exchange_usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supply_exchange_usd'] = this.supplyExchangeUsd;
    data['flow_in_exchange_native_units_inclusive'] =
        this.flowInExchangeNativeUnitsInclusive;
    data['flow_in_exchange_usd_inclusive'] = this.flowInExchangeUsdInclusive;
    data['flow_in_exchange_native_units'] = this.flowInExchangeNativeUnits;
    data['flow_in_exchange_usd'] = this.flowInExchangeUsd;
    data['flow_out_exchange_native_units_inclusive'] =
        this.flowOutExchangeNativeUnitsInclusive;
    data['flow_out_exchange_usd_inclusive'] = this.flowOutExchangeUsdInclusive;
    data['flow_out_exchange_native_units'] = this.flowOutExchangeNativeUnits;
    data['flow_out_exchange_usd'] = this.flowOutExchangeUsd;
    return data;
  }
}
