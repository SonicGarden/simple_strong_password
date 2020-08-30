RSpec.describe ActiveModel::Validations::StrongPasswordValidator do
  let(:model_class) do
    _opts = options
    Struct.new(:password) do
      include ActiveModel::Validations
      validates :password, presence: true, strong_password: _opts

      def self.name
        'DummyModel'
      end
    end
  end
  let(:options) { true }

  let(:model) { model_class.new(password) }

  describe 'validate' do
    context 'When it contains three types of lowercase letters, uppercase letters, and numbers' do
      let(:password) { 'aaAA00' }

      it 'Pass validation' do
        expect(model.valid?).to eq true
      end
    end

    context 'When it contains three types of lowercase letters, uppercase letters, and symbols' do
      let(:password) { 'aaAA--' }

      it 'Pass validation' do
        expect(model.valid?).to eq true
      end
    end

    context 'When two types of characters' do
      let(:password) { 'aaaa--' }

      it 'insufficient_password_characters error' do
        model.valid?
        expect(model.errors).to be_of_kind(:password, :insufficient_password_characters)
      end
    end

    context 'When the required_char_category_count option is set' do
      let(:password) { 'aaaa--' }
      let(:options) do
        { required_char_category_count: 2 }
      end

      it 'Pass validation' do
        expect(model.valid?).to eq true
      end
    end
  end
end
