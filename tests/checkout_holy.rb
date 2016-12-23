base_url = ENV["URL"]

# Visit the featured "Holy" sock from the front page
visit("http://#{base_url}/")
click_link "Holy"

# Assume that we don't have any socks yet
assert! page.has_content?("0 items in cart")

# Now add it to the cart
click_link "Add to cart"
assert! page.has_content?("1 item(s) in cart")
click_link("1 item(s) in cart")

# Start checkout
click_link("1 item(s) in cart")

assert! page.has_content?("My orders")
assert! page.has_content?("Your orders in one place.")
