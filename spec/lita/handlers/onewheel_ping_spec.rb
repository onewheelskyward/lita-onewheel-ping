require 'spec_helper'

describe Lita::Handlers::OnewheelPing, lita_handler: true do
  it 'should pong' do
    send_message 'ping'
    expect(replies.last).to include('http')
  end

  it 'should not pong' do
    send_message 'pingalingadingdong'
    expect(replies.last).to eq(nil)
  end
end
