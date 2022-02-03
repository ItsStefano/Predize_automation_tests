require "allure-rspec"
require "capybara"
require "capybara/rspec"
require "selenium-webdriver"
require "timestamp"

require_relative "helpers"

#Declarando classe do componente Toastlist
require_relative "support/view/components/component.rb"

#Declarando pages do Predize
require_relative "support/view/pages/predize/answer_page"
require_relative "support/view/pages/predize/home_page"
require_relative "support/view/pages/predize/loginPredize_page"
require_relative "support/view/pages/predize/preOrder_page"


AllureRspec.configure do |config|
  config.results_directory = "report/allure-results"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
  config.logger = Logger.new($stdout, Logger::DEBUG)
  config.environment = "staging"

  # these are used for creating links to bugs or test cases where {} is replaced with keys of relevant items
  config.link_tms_pattern = "http://www.jira.com/browse/{}"
  config.link_issue_pattern = "http://www.jira.com/browse/{}"
  
  # additional metadata
  # environment.properties
  config.environment_properties = {
    custom_attribute: "foo"
  }
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  #config.include AllureRspec::Adaptor # => adiciona o adaptador do report
  config.include Capybara::DSL # => adiciona os recursos do capybara

  config.after(:each) do |e|
    # screenshot temporário com parse para o tipo file do ruby
    temp_screenshot = File.join(Dir.pwd, "report/screenshots/temp_screenshot_#{Time.timestamp}.png")

    # incova o método do capybara que tira screenshot e converte a saída para o tipo file
    final_screenshot = File.new(page.save_screenshot(temp_screenshot))

     # anexa a evidência no Report do Allure (1 para cada cenário)
     Allure.add_attachment(
      name: final_screenshot,
      source: File.open(final_screenshot),
      type: Allure::ContentType::PNG,
       test_case: true
    )

  end
end

#Criando uma constante com o ambiente a ser executado, conforme o default do cucumber.yml
$CONFIG = YAML.load(File.read(Dir.pwd + "/spec/support/config/hmg.yml"), symbolize_names: true)

BROWSER = "chrome"
case BROWSER
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "firefox_headless"
  @driver = :selenium_headless
when "chrome_headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << "--headless"
      opts.args << "--disable-gpu"
      opts.args << "--no-sandbox"
      opts.args << "--desable-dev-shm-usage"
      opts.args << "--disable-site-isolation-trials"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  end

  @driver = :selenium_chrome_headless
else
  raise "Variável de @drive está vazia, não é possível abrir navegador."
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.default_max_wait_time = 10
end
