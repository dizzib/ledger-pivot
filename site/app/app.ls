# set global log fn. We can't just set window.log = console.log because we'll get
# 'illegal invocation' errors, since console.log expects 'this' to be console.
window.log = -> console.log ...&

<- $
$.ajax \/api/transactions do
  success: ->
    is-init = true
    $ \#output .pivotUI it.transactions, it.options <<< do
      onRefresh: ->
        return is-init := false if is-init
        $.ajax \/api/persist do
          data : _.pick it, <[ aggregatorName cols exclusions rendererName rows vals ]>
          error: -> log ...
  error: -> log ...
