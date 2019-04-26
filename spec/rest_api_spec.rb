require "spec_helper"

RSpec.describe Shodanz::API::REST do
  before do
    @client = Shodanz.api.rest.new
  end

  describe '.info' do
    def check
      if Async::Task.current?
        resp = @client.info.wait
      else
        resp = @client.info
      end
      expect(resp).to be_a(Hash)
    end

    context 'synchronously' do
      it 'returns info about the underlying token' do
        check
      end
    end

    context 'asynchronously' do
      it 'returns info about the underlying token' do
        Async do
          check
        end
      end
    end
  end

  describe '.host' do
    let(:ip) { "8.8.8.8" }

    def check
      if Async::Task.current?
        resp = @client.host(ip).wait
      else
        resp = @client.host(ip)
      end
      expect(resp).to be_a(Hash)
    end

    context 'synchronously' do
      it 'returns all services that have been found on the given host IP' do
        check
      end
    end

    context 'asynchronously' do
      it 'returns all services that have been found on the given host IP' do
        Async do
          check
        end
      end
    end
  end
  
  describe '.host_count' do
    let(:query) { "apache" }

    def check
      if Async::Task.current?
        resp = @client.host_count(query).wait
      else
        resp = @client.host_count(query)
      end
      expect(resp).to be_a(Hash)
    end

    context 'synchronously' do
      it 'returns the total number of results that matches a given query' do
        check
      end
    end

    context 'asynchronously' do
      it 'returns the total number of results that matches a given query' do
        Async do
          check
        end
      end
    end
  end

  describe '.host_search' do
    let(:query) { "apache" }

    def check
      if Async::Task.current?
        binding.pry
        resp = @client.host_search(query).wait
      else
        resp = @client.host_search(query)
      end
      expect(resp).to be_a(Hash)
    end

    context 'synchronously' do
      it 'returns the total number of results that matches a given query' do
        check
      end
    end

    context 'asynchronously' do
      it 'returns the total number of results that matches a given query' do
        Async do
          check
        end
      end
    end
  end

end
