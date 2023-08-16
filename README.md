# My [HTMX](https://htmx.org/) sandox

## haiku

<em>
javascript fatigue:
  <br>
longing for a hypertext
  <br>
already in hand
</em>

# Action Plan and Contents

> You need some server to handge htmx request.
> I started with basic VSCode live server, then switched to more manual Ruby Rack and then Sinatra for a bit more advanced stuff.

- [*] ROOT DIR: Try simple HTMX with basic live server from VSCode or similar(all files are located on the ROOT level)
- [*] RACK DIR: Ruby Rack app to handle basic GET, POST HTMX requests -> Refer readme there OR `cd` into it and type `make` to refer Makefile options
- [*] SINATRA DIRs: Ruby Sinatra app to have some nice UI and handle requests such as POST, DELETE, etc -> `cd` into it and type `make` to refer Makefile options
- [] RAILS DIRs: Ruby Rails app with a few skips for JS, hotwire, actioncable, etc. etc + Tailswind CSS -> `cd` into it and type `make` to refer Makefile options

# Notes

https://htmx.org/docs/#inheritance - htmx directives are inherited

## Rails 

Skipping a few packages

```sh
rails new \                                                                                                                                                                                      ─╯
  --database=postgresql \
  --css tailwind \
  --skip-javascript \
  --skip-hotwire \
  --skip-action-cable \
  --skip-action-mailer \
  --skip-action-mailbox \
  --skip-test \
  --skip-jbuilder \ 
rails-skipjs-progress-bar
```

# Resources

https://hypermedia.systems/introduction/ - HTMX book
https://medium.com/@johnpitchko/build-an-animated-progress-bar-without-javascript-using-htmx-and-rails-b9d5c1fe03e1

