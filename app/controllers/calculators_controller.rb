class CalculatorsController < ApplicationController
  def home
    render({ :template => "calculator_templates/new_square_calc" })
  end

  def enter_new_square_info
    render({ :template => "calculator_templates/new_square_calc" })
  end
  
  def generate_square_results
    @square_num = params.fetch("square_number").to_f
  
    @square_result = @square_num ** 2 
    # ** is the exponentiation operator
  
    render({ :template => "calculator_templates/square_results" })
  end
  
  def enter_new_square_root_info
    render({ :template => "calculator_templates/new_square_root_calc" })
  end
  
  def generate_square_root_results
    @square_root_num = params.fetch("users_num").to_f
  
    @square_root_result = Math.sqrt(@square_root_num)
  
    render({ :template => "calculator_templates/square_root_results" })
  end
  
  def enter_new_payment_info
    render({ :template => "calculator_templates/new_payment_calc" })
  end
  
  def generate_payment_results
    # Step 1: Fetch the APR from params and convert it to a float
    apr_str = params.fetch("APR")
    annual_rate = apr_str.to_f
  
    # Step 2: Convert the APR from a percentage to a decimal
    annual_interest_rate = annual_rate / 100
  
    # Step 3: Divide by 12 to get the monthly interest rate
    monthly_interest_rate = annual_interest_rate / 12
  
    # Step 4: Fetch the number of years, convert to an integer, and multiply by 12 for monthly periods
    years_str = params.fetch("years")
    years = years_str.to_i
    n = years * 12
  
    # Step 5: Fetch the principal amount and convert it to a float
    principal_str = params.fetch("principal")
    principal_val = principal_str.to_f
  
    # Step 6: Calculate the numerator and denominator
    numerator = monthly_interest_rate * principal_val
    denominator = 1 - ((1 + monthly_interest_rate) ** -n)
  
    # Step 7: Calculate the monthly payment by dividing the numerator by the denominator
    monthly_payment = numerator / denominator
  
    # The following instance variables are not part of the monthly payment calculation,
    # but they are used to display the inputs back to the user on the results page.
    @formatted_apr = annual_interest_rate.to_fs(:percentage, precision: 4)
    @years_num = years
    @formatted_principal = principal_val.to_fs(:currency)
  
    # Format the result as currency
    @formatted_payment = monthly_payment.to_fs(:currency)
  
    render({ :template => "calculator_templates/payment_results" })
  end
  
  def enter_new_random_number_info
    render({ :template => "calculator_templates/new_random_calc" })
  end
  
  def generate_random_number_results
    @minimum_num = params.fetch("minimum").to_f
  
    @maximum_num = params.fetch("maximum").to_f
  
    @random_result = rand(@minimum_num.to_f..@maximum_num.to_f).round(15)
  
    render({ :template => "calculator_templates/random_results" })
  end
  
end
