module HomeHelper
  def end_date(loan)
    (loan.created_at + loan.term_in_months.months).strftime('%e %b %Y')
  end

  def status_label(loan)
    "<div class='label label-#{type(loan)}'>#{status(loan)}</div>".html_safe
  end

  private

  def type(loan)
    return 'default' if loan.expired?
    return 'success' if loan.funded?
    'warning'
  end

  def status(loan)
    return 'Expired' if loan.expired?
    return 'Funded' if loan.funded?
    'Pending'
  end

end