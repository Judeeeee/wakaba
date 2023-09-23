# frozen_string_literal: true

RSpec.describe Wakaba do
  it 'Expect a NameError message' do
    error = NameError.new
    expect(error.output_message(error)).to include('という名前のメソッドは存在しないかも')
  end

  it 'Expect a NoMethodError message' do
    error = NoMethodError.new
    expect(error.output_message(error)).to include('がタイポかも？')
  end

  it 'Expect a TypeError message' do
    error = TypeError.new
    expect(error.output_message(error)).to include('期待していない型')
  end

  it 'Expect a ArgumentError message' do
    error = ArgumentError.new
    expect(error.output_message(error)).to include('メソッドの引数の数が違う')
  end

  it 'Expect a ZeroDivisionError message' do
    error = ZeroDivisionError.new
    expect(error.output_message(error)).to include('0で除算した場合')
  end
end
