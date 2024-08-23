require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

   context "新規登録できるとき" do
    it "全項目が存在し、メールは一意、＠あり、パスワード６文字以上、英数混合、一致、名前は全角、名前よみがなはカナその他項目も正しい" do
      expect(@user).to be_valid
    end  
   end

   context "新規登録できないとき" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    it "emailが既に登録されている場合登録できない" do
      user = User.create(nickname: 'testsan', email: 'b@sample.com', password: 'aaaaa1', password_confirmation: 'aaaaa1',
      family_name_kanji: '青木', first_name_kanji: 'てすと', family_name_kana: 'アオキ', first_name_kana: 'テスト', birthday:'1993-09-28')
      user = User.new(nickname: 'testsan', email: 'b@sample.com', password: 'aaaaa1', password_confirmation: 'aaaaa1',
      family_name_kanji: '青木', first_name_kanji: 'てすと', family_name_kana: 'アオキ', first_name_kana: 'テスト', birthday:'1993-09-28')
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@がないと登録できない" do
      @user.email = 'testsample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
       @user.password = ''
       @user.password_confirmation = 'hogehoge1'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = '1234a'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが数字だけだと登録できない" do
      @user.password = '1234567'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが英字だけだと登録できない" do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
      it "passwordが全角入りだと登録できない" do
        @user.password = 'abcdあい'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordがpassword_confirmationと一致しない場合登録できない" do
      @user.password = 'abcde1'
      @user.password_confirmation = 'efghi2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名前（全角）は姓が空だと登録できない" do
      @user.family_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank", "Family name kanji is invalid")
    end
    it "名前（全角）は名が空だと登録できない" do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji is invalid")
    end
    it "名前（全角）は姓が全角漢字、かな、カナ以外では登録できない" do
      @user.family_name_kanji = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji is invalid")
    end
    it "名前（全角）は名が全角漢字、かな、カナ以外では登録できない" do
      @user.first_name_kanji = 'ﾊﾅｺ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it "名前（カナ）は姓が空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "名前（カナ）は名が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名前（カナ）は姓が全角カナ以外では登録できない" do
      @user.family_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "名前（カナ）は名が全角カナ以外では登録できない" do
      @user.first_name_kana = 'HANAKO'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
    end
   end
  end
end
