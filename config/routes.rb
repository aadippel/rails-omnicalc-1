Rails.application.routes.draw do
  get("/square/new", {:controller => "calculators", :action => "enter_new_square_info"})
  get("/square/results", {:controller => "calculators", :action => "generate_square_results"})

  get("/square_root/new", {:controller => "calculators", :action => "enter_new_square_root_info"})
  get("/square_root/results", {:controller => "calculators", :action => "generate_square_root_results"})

  get("/payment/new", {:controller => "calculators", :action => "enter_new_payment_info"})
  get("/payment/results", {:controller => "calculators", :action => "generate_payment_results"})

  get("/random/new", {:controller => "calculators", :action => "enter_new_random_number_info"})
  get("/random/results", {:controller => "calculators", :action => "generate_random_number_results"})

  get("/", {:controller => "calculators", :action => "home"})
end
