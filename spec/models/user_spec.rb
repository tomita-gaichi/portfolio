require 'rails_helper'

RSpec.describe 'User', type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'attribute: name' do
    context 'nameが存在している場合は、有効であること' do
      it 'is valid' do
        user.name = 'Suzuki Masaru'
        expect(user).to be_valid
      end
    end

    context 'nameが存在しない場合は、無効であること' do
      it 'is invalid' do
        user.name = ' '
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")

        user.name = ''
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")

        user.name = nil
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")
      end
    end

    context 'nameが20文字以下の場合は、有効であること' do
      it 'is valid' do
        user.name = 'a' * 20
        expect(user).to be_valid
      end
    end

    context 'nameが20文字を超える場合は、無効であること' do
      it 'is invalid' do
        user.name = 'a' * 21
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end
    end
  end

  describe 'attribute: email' do
    context 'emailが存在している場合は、有効であること' do
      it 'is invalid' do
        user.email = 'meiyuu@example.com'
        expect(user).to be_valid
      end
    end

    context 'emailが空白の場合は、無効であること' do
      it 'is invalid' do
        user.email = ' '
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")

        user.email = ''
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")

        user.email = nil
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
      end
    end

    context 'emailの形式が正しくない場合は、無効であること' do
      it 'is invalid' do
        # emailの@以降に .（ドット）が 1つも含まれていない
        user.email = 'user@example,com'
        expect(user).to be_invalid

        # emailに@が含まれていない
        user.email = 'user_at_foo.org'
        expect(user).to be_invalid

        # emailの最後が .（ドット）である
        user.email = 'user.name@example.'
        expect(user).to be_invalid

        # emailの@に続く文字列に記号「_」が含まれている
        user.email = 'foo@bar_baz.com'
        expect(user).to be_invalid

        # emailの@に続く文字列に記号「+」が含まれている
        user.email = 'foo@bar+baz.com'
        expect(user).to be_invalid
      end
    end

    context '同一のemailが既に登録されている場合は、無効であること' do
      it 'is invalid' do
        FactoryBot.create(:user, email: 'meiyuu@example.com')
        user.email = 'meiyuu@example.com'
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("はすでに存在します")
      end
    end

    context 'emailの大文字と小文字を区別せず、一意ではない場合は、無効であること' do
      it 'is invalid' do
        FactoryBot.create(:user, email: 'meiyuu@example.com')
        user.email = 'MEIYUU@EXAMPLE.COM'
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("はすでに存在します")
      end
    end

    # emailが小文字で保存されていること
    it 'is saved in lowercase' do
      user.email = 'MEIYUU@EXAMPLE.COM'
      user.save!
      expect(user.reload.email).to eq 'meiyuu@example.com'
    end
  end

  describe 'attribute: passsword' do
    context 'passwordが存在している場合は、有効であること' do
      it 'is invalid' do
        user.password = '2626allG'
        expect(user).to be_valid
      end
    end

    context 'passwordが空白の場合は、無効であること' do
      it 'is invalid' do
        user.password = ' '
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("を入力してください")
      end
    end

    context 'passwordが空の場合は、無効であること' do
      it 'is invalid' do
        user.password = ''
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("を入力してください")
      end
    end

    context 'passwordが存在していない場合は、無効であること' do
      it 'is invalid' do
        user.password = nil
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("を入力してください")
      end
    end

    context 'passwordの形式が正しくない場合は、無効であること' do
      it 'is invalid' do
        # passwordが５文字以下
        user.password = 'A1aaa'
        expect(user).to be_invalid

        # passwordが13文字以上
        user.password = 'A1aaaaaaaaaaa'
        expect(user).to be_invalid

        # passwordに英大文字が含まれていない
        user.password = '1aaaaa'
        expect(user).to be_invalid

        # passwordに数字が含まれていない
        user.password = 'Aaaaaa'
        expect(user).to be_invalid

        # passwordに小文字が含まれていない
        user.password = '1AAAAA'
        expect(user).to be_invalid
      end
    end
  end

  describe 'attribute: passsword_confirmation' do
    context 'passwordとpasssword_confirmationが一致しない場合は、無効であること' do
      it "is invalid" do
        user.password_confirmation = '2625allG'
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end
end
