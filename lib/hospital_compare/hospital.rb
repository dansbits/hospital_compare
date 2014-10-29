class HospitalCompare::Hospital

  def initialize csv_row
    @data = csv_row
  end

  def address
    @data['Address']
  end

  def city
    @data['City']
  end

  def county
    @data['County Name']
  end

  def cms_certification_number
    @data['Provider ID']
  end

  def emergency_services?
    case @data['Emergency Services']
    when 'true'
      true
    when 'false'
      false
    else
      raise 'Invalid emergency_services? value in source'
    end
  end

  def name
    @data['Hospital Name']
  end

  def ownership
    @data['Hospital Ownership']
  end

  def phone
    @data['Phone Number']
  end

  def state
    @data['State']
  end

  def type
    @data['Hospital Type']
  end

  def zip
    @data['ZIP Code']
  end

  def latitude
    lat_long_string.match(/\(.*,/).to_s.tr('(,','').to_f
  end

  def longitude
    lat_long_string.match(/,.*\)/).to_s.tr('(,', '').to_f
  end

  private

  def lat_long_string
    @data['Location'].match(/\(.*\)/).to_s
  end
end
