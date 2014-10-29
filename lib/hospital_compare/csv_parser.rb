require 'csv'

class HospitalCompare::CsvParser

  include Enumerable

  FILE_HEADERS = [
    'Provider ID','Hospital Name','Address',
    'City','State','ZIP Code','County Name',
    'Phone Number','Hospital Type',
    'Hospital Ownership','Emergency Services',
    'Location'
  ]

  def initialize file_path
    @data = CSV.open(file_path, headers: true)
    validate_data
  end

  def each
    @data.each do |row|
      yield HospitalCompare::Hospital.new row
    end
  end

  private

  def validate_data
    @data.first

    unless @data.headers == FILE_HEADERS
      raise 'Improper file format'
    end

    @data.rewind
  end
end
