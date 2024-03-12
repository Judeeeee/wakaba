# frozen_string_literal: true

RSpec.describe Wakaba do
  it 'Expect a NameError message' do
    error = NameError.new(NameError, 'argument')
    expect(error.message).to include('argumentってタイポしてにゃい？')
  end

  it 'Expect a NoMethodError message' do
    error = NoMethodError.new(NoMethodError, 'argument')
    expect(error.message).to include('argumentという名前のメソッドは存在するかにゃ？')
  end

  it 'Expect a TypeError message' do
    error = TypeError.new
    expect(error.message).to include('期待しにゃい型がメソッドの引数に渡されているﾆｬｰ')
  end

  it 'Expect a ArgumentError message' do
    error = ArgumentError.new
    expect(error.message).to include('引数の数が違うﾆｬﾝ？')
  end

  it 'Expect a ZeroDivisionError message' do
    error = ZeroDivisionError.new
    expect(error.message).to include('0で除算するとこのエラーが発生するニャン')
  end
end
