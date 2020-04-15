module BadgesHelper
  def badge_rules
    BadgeService::RULES.map { |c| [t("badge.rules.#{c}"), c] }
  end
end
