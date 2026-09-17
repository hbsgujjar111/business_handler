class FinancialState {
  final double walletCash;
  final double pendingToyCost;
  final double pendingReimbursements;
  final double reinvestedProfit;
  final List<String> partners;
  final bool isLoading;

  const FinancialState({
    this.walletCash = 0,
    this.pendingToyCost = 0,
    this.pendingReimbursements = 0,
    this.reinvestedProfit = 0,
    this.partners = const [],
    this.isLoading = false,
  });

  FinancialState copyWith({
    double? walletCash,
    double? pendingToyCost,
    double? pendingReimbursements,
    double? reinvestedProfit,
    List<String>? partners,
    bool? isLoading,
  }) {
    return FinancialState(
      walletCash: walletCash ?? this.walletCash,
      pendingToyCost: pendingToyCost ?? this.pendingToyCost,
      pendingReimbursements: pendingReimbursements ?? this.pendingReimbursements,
      reinvestedProfit: reinvestedProfit ?? this.reinvestedProfit,
      partners: partners ?? this.partners,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
