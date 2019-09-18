# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe 'EmailValidator' do
  describe '.validate?' do
    subject { collector.valid? }
    context 'When collector has a valid email' do
      let(:collector) { build(:collector) }
      it { expect(subject).to be_truthy }
      it do
        subject
        expect(collector.errors).to be_blank
      end
    end

    context 'when collector has an invalid email' do
      let(:collector) { build(:collector_with_invalid_email) }

      it { expect(subject).to be_falsey }
      it do
        subject
        expect(collector.errors).to_not be_blank
      end
      it do
        subject
        expect(collector.errors[:email][0]).to eql('Este não é um email válido')
      end
    end
  end
end
