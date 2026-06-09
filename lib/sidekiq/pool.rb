require 'sidekiq/pool/version'

module Sidekiq
  module Pool
    module_function

    def after_fork(&block)
      after_fork_hooks << block
    end

    def after_fork_hooks
      @after_fork_hooks ||= []
    end

    def pooled?
      @pooled == true
    end

    def master_hooks
      @master_hooks ||= []
    end

    def after_master_boot(&block)
      master_hooks << block
    end

    def run_master_hooks
      master_hooks.each(&:call)
    end

  end
end
