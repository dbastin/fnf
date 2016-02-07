module PledgeHelper
  def days_remaining(loan)
    [14 - ((Time.zone.now - loan.created_at) / 1.day).to_i, 0].max
  end
end