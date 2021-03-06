class ChargesController < ApplicationController

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 1000,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."

    current_user.update_attributes(role: "premium")
    redirect_to wikis_path # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",  # Was 'current_user.name'
      amount: Amount.default
    }
  end

  def destroy
    # @wikis.each do |wiki|
    #   if wiki.private && current_user.id == wiki.user_id
    #     wiki.private = false
    #   end
    # end
    current_user.wikis do |wiki|
       wiki.update_attributes(private: false)
    #   wiki.private = false
       wiki.save
    end


    current_user.standard!
    redirect_to wikis_path
  end

end
