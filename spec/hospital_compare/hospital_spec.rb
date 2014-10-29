require 'spec_helper'

describe HospitalCompare::Hospital do

  let(:hospital_data) { CSV.open('spec/data/good_data.csv', headers:true).first }
  let(:hospital) { HospitalCompare::Hospital.new hospital_data }

  describe '#address' do
    subject { hospital.address }

    it { expect(subject).to eq '1108 ROSS CLARK CIRCLE' }
  end

  describe '#city' do
    subject { hospital.city }

    it { expect(subject).to eq 'DOTHAN' }
  end

  describe '#cms_certification_number' do
    subject { hospital.cms_certification_number }

    it { expect(subject).to eq '010001' }
  end

  describe '#county' do
    subject { hospital.county }

    it { expect(subject).to eq 'HOUSTON' }
  end

  describe '#emergency_services?' do
    subject { hospital.emergency_services? }

    context 'when the hospital offers emergency services' do
      before { hospital_data['Emergency Services'] = 'true' }
      it { expect(subject).to eq true }
    end

    context 'when the hospital offers emergency services' do
      before { hospital_data['Emergency Services'] = 'false' }
      it { expect(subject).to eq false }
    end

    context 'when the emergency services field contains an invalid value' do
      before { hospital_data['Emergency Services'] = 'Maybe' }
      it { expect{subject}.to raise_error 'Invalid emergency_services? value in source' }
    end
  end

  describe '#type' do
    subject { hospital.type }

    it { expect(subject).to eq 'Acute Care Hospitals' }
  end

  describe '#latitude' do
    subject { hospital.latitude }

    it { expect(subject).to eq 31.215379379000467 }
  end

  describe '#longitude' do
    subject { hospital.longitude }

    it { expect(subject).to eq -85.36146587999968 }
  end

  describe '#name' do
    subject { hospital.name }

    it { expect(subject).to eq 'SOUTHEAST ALABAMA MEDICAL CENTER' }
  end

  describe '#ownership' do
    subject { hospital.ownership }

    it { expect(subject).to eq 'Government - Hospital District or Authority' }
  end

  describe '#phone' do
    subject { hospital.phone }

    it { expect(subject).to eq '3347938701' }
  end

  describe '#state' do
    subject { hospital.state }

    it { expect(subject).to eq 'AL' }
  end

  describe '#zip' do
    subject { hospital.zip }

    it { expect(subject).to eq '36301' }
  end
end
