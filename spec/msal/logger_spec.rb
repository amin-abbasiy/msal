# frozen_string_literal: true

require_relative '../../lib/msal/msal_logger'

RSpec.describe ::Msal::MsalLogger do
  context 'Logger level' do
    subject { described_class.new($stdout, { level: ::Logger::INFO }) }
    it 'Info' do
      allow(subject).to receive(:info)
      subject.info('message')

      expect(subject.level).to eq(1)
      expect(subject).to have_received(:info).with('message')
    end
  end

  context 'Debug level' do
    subject { described_class.new($stderr, { level: ::Logger::ERROR }) }
    it 'Debug' do
      allow(subject).to receive(:debug)
      subject.debug('message')

      expect(subject.level).to eq(3)
      expect(subject).to have_received(:debug).with('message')
    end
  end
end
