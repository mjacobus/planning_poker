module Web::Controllers::Sandbox
  class Index
    include Web::Action

    expose :controller_variable

    def call(params)
      @controller_variable = 'i am a controller variable'
    end
  end
end
