# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  context 'when validating' do
    context 'new user' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to validate_presence_of :password }
    end

    context 'updating an user' do
      let(:user) { Fabricate(:user) }

      before { user }

      context 'and changing his password' do
        let(:password) { 'Trolololololololo' }

        it 'should be encrypted' do
          user.password = password
          user.save!

          expect(user.password).to_not eq(password)
        end
      end
    end
  end
end
