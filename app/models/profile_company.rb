class ProfileCompany < Profile

  def human_name_type
    "Firma"
  end

  def name
    company_name
  end
end
