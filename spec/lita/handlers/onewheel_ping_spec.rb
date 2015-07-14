require 'spec_helper'

describe Lita::Handlers::OnewheelPing, lita_handler: true do
  it 'should pong' do
    send_message 'ping'
    expect(replies.last).to include('https*://')
  end
end
