# Add the Holy sock to the cart
base_url = ENV["URL"]

visit("http://#{base_url}/")
click_link "Holy"

assert! page.has_content?("0 items in cart")

click_link "Add to cart"
assert! page.has_content?("1 item(s) in cart")
