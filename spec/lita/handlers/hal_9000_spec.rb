require "spec_helper"

describe Lita::Handlers::Hal9000, lita_handler: true do
  it { is_expected.to route_event(:unhandled_message) }

  it 'does HAL message if unknown command' do
    send_command('unknown-command')
    expect(replies.last).to eq(
      "I'm sorry, I can't do that @Test User http://bit.ly/11wwIP2")
  end
end
