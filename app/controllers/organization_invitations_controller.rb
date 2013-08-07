class OrganizationInvitationsController < ApplicationController
  before_filter :require_admin!
  layout "organization"
  
  def new
    @organization_invitation = OrganizationInvitation.new
  end

  def create
    @organization = current_organization
    if @organization.available_invitation_count > 0
      @organization_invitation = OrganizationInvitation.new(invitee_email: params[:organization_invitation][:invitee_email], invitee_name: params[:organization_invitation][:invitee_name], organization: @organization, inviter: current_user, membership_role: params[:organization_invitation][:membership_role])
      @organization_invitation.inviter = current_user
      if @organization_invitation.save
        redirect_to root_url, notice: "#{@organization_invitation.invitee_email} was invited to #{@organization.name}!"
      else
        flash[:error] = "Whoops! Looks like we're missing some information"
        redirect_to new_organization_invitation_url
      end
    else
      redirect_to root_url, notice: "Oh no! You appear to be out of invitations. Contact us if this seems wrong"
    end
  end
 

end
