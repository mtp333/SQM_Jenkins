require 'selenium-webdriver'
require 'capybara/dsl'
# include Capybara::DSL

Capybara.default_driver = :selenium_chrome

session = Capybara::Session.new(:selenium)

begin
  session.visit('http://collaborative.ase.ro/Pasul1.0.aspx')
  sleep 1
  radio_button2 = session.find('#RadioButton2')
  radio_button2.click
  next_button = session.find('#Button1')
  sleep 1
  next_button.click
  sleep 1
  session.check('CheckBoxList1$0')
  session.check('CheckBoxList1$5')
  session.check('CheckBoxList1$9')
  sleep 1
  session.find('select#ListBox1').find('option[value="1.1. Aparate frigorifice de mari dimensiuni"]').select_option
  session.find('select#ListBox1').find('option[value="1.3. Aparate frigorifice / Congelatoare"]').select_option
  session.find('select#ListBox1').find('option[value="1.10. Plite electrice"]').select_option
  sleep 1
  session.click_button('Button1')
  sleep 1
  session.check('CheckBoxList1$1')
  sleep 1
  session.find('select#ListBox1').find('option[value="2.2. Volumul (cantitatea) de DEEE tratate"]').select_option
  session.find('select#ListBox1').find('option[value="2.7. Consumul de energie pe unitatea de DEEE reciclat"]').select_option
  session.click_button('Button1')
  sleep 1
  session.fill_in('TextBox00', with: '1')
  session.fill_in('TextBox01', with: '2')
  session.fill_in('TextBox10', with: '3')
  session.fill_in('TextBox11', with: '4')
  session.fill_in('TextBox20', with: '5')
  session.fill_in('TextBox21', with: '6')
  sleep 1
  session.click_button('Button1')
  sleep 1
  session.click_button('Button1')
  session.fill_in('ctl21', with: '9')
  sleep 1
  submit_button = session.find("input[name='ctl25']")
  submit_button.click
  sleep 1
  session.click_button('Button1')
  sleep 1
  session.click_button('Button1')
  sleep 1

  puts "Test completed successfully!"

rescue StandardError => e
  puts "An error occurred: #{e.message}"
ensure
  # Always close the browser session
  session.driver.quit
  puts "Browser session closed."
end