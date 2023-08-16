https://blog.stackfindover.com/tailwind-progress-bars/ - Tailwind progress bar that worked

Rails has built-in security feature that prevents HTMX /POST calls, so I had to disable verify_authenticity_token 
```ruby
# DEVELOPMENT PURPOSES ONLY
skip_before_action :verify_authenticity_token 
```
