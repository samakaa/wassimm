$(document).ready(function() {

      var show_error, stripeResponseHandler, submitHandler;

      submitHandler = function (event) {

      var $form = $(event.target);

      $form.find("input[type=submit]").prop("disabled", true);





if(Stripe){

       Stripe.card.createToken($form, stripeResponseHandler);

 } else {

        $('#stripe').show();

        $('#stripe').text("Erreur, rafraichissez votre page.");

 }

 return false;

 };


$(".cc_form").on('submit', submitHandler);

      stripeResponseHandler = function (status, response) {

      var token, $form;

       $form = $('.cc_form');

       if (response.error && response.error.type == 'card_error' ) {

              $('#stripe').show();

              if (response.error.type == 'card_error' ){

              $('#stripe').text("Numéro de carte credit invalide.");

              }

              $form.find("input[type=submit]").prop("disabled", false);

       } else {

              $('#stripe').hide();

              token = response.id;

              $form.append($("<input type=\"hidden\" name=\"payment[token]\" />").val(token));

              $("[data-stripe=number]").remove();

              $("[data-stripe=cvc]").remove();

              $("[data-stripe=exp-year]").remove();

              $("[data-stripe=exp-month]").remove();

              $("[data-stripe=label]").remove();

              $form.get(0).submit();

 }

 return false;

 };

 });
