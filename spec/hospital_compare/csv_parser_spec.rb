require 'spec_helper'

describe HospitalCompare::CsvParser do

  let(:parser) { HospitalCompare::CsvParser.new( 'spec/data/good_data.csv' ) }

  describe '#initialize' do
    subject { HospitalCompare::CsvParser.new file }

    context 'when a bad file is given' do
      let(:file) { 'spec/data/bad_data.csv' }
      it { expect{subject}.to raise_error 'Improper file format' }
    end

    context 'when a properly formatted file is provided' do
      let(:file) { 'spec/data/good_data.csv' }
      it { expect{subject}.to_not raise_error }
    end
  end

  describe '#each' do

    it 'iterates each row' do
      count = 0

      parser.each { |h| count += 1 }

      expect(count).to eq 2
    end

    it 'returns a hospital object for each row' do
      parser.each do |hosp|
        expect(hosp).to be_a HospitalCompare::Hospital
      end
    end
  end
end
