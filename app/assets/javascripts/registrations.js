$('.registrations').ready(function() {
  card = new Skeuocard($("#skeuocard"));
  $.externalScript('https://js.stripe.com/v1/').done(function(script, textStatus) {
      Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
      var subscription = {
        setupForm: function() {
          return $('.card_form').submit(function() {
            $('input[type=submit]').prop('disabled', true);
            if ((document.getElementsByClassName("group4")[0].value + document.getElementsByClassName("group4")[1].value + document.getElementsByClassName("group4")[2].value + document.getElementsByClassName("group4")[3].value).length) {
              subscription.processCard();
              return false;
            } else {
              return true;
            }
          });
        },
        processCard: function() {
          var card;
          card = {
            name: document.getElementsByClassName("cc-name")[0].value,
            number: document.getElementsByClassName("group4")[0].value + document.getElementsByClassName("group4")[1].value + document.getElementsByClassName("group4")[2].value + document.getElementsByClassName("group4")[3].value,
            cvc: document.getElementsByClassName("cc-cvc")[0].value,
            expMonth: document.getElementsByClassName("cc-exp-field-m group2")[0].value,
            expYear: document.getElementsByClassName("cc-exp-field-y group2")[0].value
          };
          return Stripe.createToken(card, subscription.handleStripeResponse);
        },
        handleStripeResponse: function(status, response) {
          if (status === 200) {
            $('#user_stripe_token').val(response.id)
            $('.card_form')[0].submit()
          } else {
            $('#stripe_error').text(response.error.message).show();
            return $('input[type=submit]').prop('disabled', false);
          }
        }
      };
      return subscription.setupForm();
  });
});