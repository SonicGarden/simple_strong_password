require "simple_strong_password/version"
require "simple_strong_password/validator"

module SimpleStrongPassword
end

I18n.load_path += Dir[File.expand_path(File.join(__dir__, '../config/locales', '*.yml')).to_s]
