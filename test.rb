# require 'selenium-webdriver'
# require 'capybara/dsl'
# # include Capybara::DSL
#
# # Configure Capybara to use Selenium with Chrome
# Capybara.default_driver = :selenium_chrome
#
# # Start a new session
# session = Capybara::Session.new(:selenium)
#
# begin
#   # Step 1: Navigate to the initial page
#   session.visit('http://collaborative.ase.ro/Pasul1.0.aspx')
#   puts "Navigated to Pasul1.0."
#
#   # Step 2: Check the second radio button (RadioButton2)
#   radio_button2 = session.find('#RadioButton2')
#   radio_button2.click
#   puts "Selected RadioButton2."
#   sleep 2
#
#   # Wait for the next page to load and click the next button
#   next_button = session.find('#Button1')
#   next_button.click
#   puts "Navigated to Pasul 1.2."
#   sleep 2
#
#   # Step 3: Visit the second page
#   session.visit('http://collaborative.ase.ro/Pasul1.2.aspx')
#
#   # Check checkboxes
#   session.check('CheckBoxList1$0') # Example of selecting a checkbox
#   session.check('CheckBoxList1$5') # Example of selecting a checkbox
#   session.check('CheckBoxList1$9') # Example of selecting a checkbox
#
#   # Select multiple items from the ListBox
#   session.find('select#ListBox1').find('option[value="1.1. Aparate frigorifice de mari dimensiuni"]').select_option
#   session.find('select#ListBox1').find('option[value="1.3. Aparate frigorifice / Congelatoare"]').select_option
#   session.find('select#ListBox1').find('option[value="1.10. Plite electrice"]').select_option
#
#   # Submit the form
#   session.click_button('Button1') # Or use another method if needed
#   sleep 2
#
#   # Add your web scraper logic here if necessary, e.g.:
#   # scraper = WebScraper.new
#   # scraper.perform
#
#   puts "Form submitted successfully."
#
# rescue StandardError => e
#   puts "An error occurred: #{e.message}"
# ensure
#   # Close the browser session
#   session.driver.quit
# end
require 'selenium-webdriver'
require 'capybara/dsl'
# include Capybara::DSL

Capybara.default_driver = :selenium_chrome

session = Capybara::Session.new(:selenium)

begin
  session.visit('http://collaborative.ase.ro/Pasul1.0.aspx')
  sleep 2
  radio_button2 = session.find('#RadioButton2')
  radio_button2.click
  next_button = session.find('#Button1')
  sleep 2
  next_button.click
  sleep 2
  session.check('CheckBoxList1$0')
  session.check('CheckBoxList1$5')
  session.check('CheckBoxList1$9')
  sleep 2
  session.find('select#ListBox1').find('option[value="1.1. Aparate frigorifice de mari dimensiuni"]').select_option
  session.find('select#ListBox1').find('option[value="1.3. Aparate frigorifice / Congelatoare"]').select_option
  session.find('select#ListBox1').find('option[value="1.10. Plite electrice"]').select_option
  sleep 2
  session.click_button('Button1')
  sleep 2
  session.check('CheckBoxList1$1')
  sleep 2
  session.find('select#ListBox1').find('option[value="2.2. Volumul (cantitatea) de DEEE tratate"]').select_option
  session.find('select#ListBox1').find('option[value="2.7. Consumul de energie pe unitatea de DEEE reciclat"]').select_option
  session.click_button('Button1')
  sleep 2
  session.fill_in('TextBox00', with: '1')
  session.fill_in('TextBox01', with: '2')
  session.fill_in('TextBox10', with: '3')
  session.fill_in('TextBox11', with: '4')
  session.fill_in('TextBox20', with: '5')
  session.fill_in('TextBox21', with: '6')
  sleep 2
  session.click_button('Button1')
  sleep 2
  session.click_button('Button1')
  session.fill_in('ctl21', with: '9')
  sleep 2
  submit_button = session.find("input[name='ctl25']")
  submit_button.click
  sleep 2
  session.click_button('Button1')
  sleep 2
  session.click_button('Button1')
  sleep 2

rescue StandardError => e
  puts "An error occurred: #{e.message}"
ensure
  # Close the browser session
  session.driver.quit
end
