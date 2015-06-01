# set global log fn. We can't just set window.log = console.log because we'll get
# 'illegal invocation' errors, since console.log expects 'this' to be console.
window.log = -> console.log ...&

<- $
$.ajax \/api do
  success: ->
    log ...
    $ \#output .pivotUI it.transactions, it.options <<< do
      onRefresh: -> log it
  error: ->
    log ...
