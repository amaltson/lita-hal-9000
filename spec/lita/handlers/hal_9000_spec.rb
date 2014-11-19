require "spec_helper"

describe Lita::Handlers::Hal9000, lita_handler: true do
  it { is_expected.to route_event(:unhandled_message) }

  it 'does HAL message if unknown command' do
    send_command('unknown-command')
    expect(replies.last).to eq(
      "I'm sorry, I can't do that @Test User http://bit.ly/11wwIP2")
  end

  it 'does HAL message using mention name' do
    john = Lita::User.create(123, name: 'John Smith', mention_name: 'john')
    send_command('unknown-command', as: john)
    expect(replies.last).to eq(
      "I'm sorry, I can't do that @john http://bit.ly/11wwIP2")
  end

end
