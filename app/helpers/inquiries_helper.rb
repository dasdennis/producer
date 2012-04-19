module InquiriesHelper

  def options_for_subject
    options = I18n.t("contacts.new.subjects").map do |subject, value| 
      [value, subject]
    end
    
    options.sort_by {|i| i[0]}
  end

end
