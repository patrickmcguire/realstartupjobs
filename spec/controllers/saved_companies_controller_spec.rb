require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SavedCompaniesController do

  # This should return the minimal set of attributes required to create a valid
  # SavedCompany. As you add validations to SavedCompany, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SavedCompaniesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all saved_companies as @saved_companies" do
      saved_company = SavedCompany.create! valid_attributes
      get :index, {}, valid_session
      assigns(:saved_companies).should eq([saved_company])
    end
  end

  describe "GET show" do
    it "assigns the requested saved_company as @saved_company" do
      saved_company = SavedCompany.create! valid_attributes
      get :show, {:id => saved_company.to_param}, valid_session
      assigns(:saved_company).should eq(saved_company)
    end
  end

  describe "GET new" do
    it "assigns a new saved_company as @saved_company" do
      get :new, {}, valid_session
      assigns(:saved_company).should be_a_new(SavedCompany)
    end
  end

  describe "GET edit" do
    it "assigns the requested saved_company as @saved_company" do
      saved_company = SavedCompany.create! valid_attributes
      get :edit, {:id => saved_company.to_param}, valid_session
      assigns(:saved_company).should eq(saved_company)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SavedCompany" do
        expect {
          post :create, {:saved_company => valid_attributes}, valid_session
        }.to change(SavedCompany, :count).by(1)
      end

      it "assigns a newly created saved_company as @saved_company" do
        post :create, {:saved_company => valid_attributes}, valid_session
        assigns(:saved_company).should be_a(SavedCompany)
        assigns(:saved_company).should be_persisted
      end

      it "redirects to the created saved_company" do
        post :create, {:saved_company => valid_attributes}, valid_session
        response.should redirect_to(SavedCompany.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved saved_company as @saved_company" do
        # Trigger the behavior that occurs when invalid params are submitted
        SavedCompany.any_instance.stub(:save).and_return(false)
        post :create, {:saved_company => {}}, valid_session
        assigns(:saved_company).should be_a_new(SavedCompany)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SavedCompany.any_instance.stub(:save).and_return(false)
        post :create, {:saved_company => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested saved_company" do
        saved_company = SavedCompany.create! valid_attributes
        # Assuming there are no other saved_companies in the database, this
        # specifies that the SavedCompany created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SavedCompany.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => saved_company.to_param, :saved_company => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested saved_company as @saved_company" do
        saved_company = SavedCompany.create! valid_attributes
        put :update, {:id => saved_company.to_param, :saved_company => valid_attributes}, valid_session
        assigns(:saved_company).should eq(saved_company)
      end

      it "redirects to the saved_company" do
        saved_company = SavedCompany.create! valid_attributes
        put :update, {:id => saved_company.to_param, :saved_company => valid_attributes}, valid_session
        response.should redirect_to(saved_company)
      end
    end

    describe "with invalid params" do
      it "assigns the saved_company as @saved_company" do
        saved_company = SavedCompany.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SavedCompany.any_instance.stub(:save).and_return(false)
        put :update, {:id => saved_company.to_param, :saved_company => {}}, valid_session
        assigns(:saved_company).should eq(saved_company)
      end

      it "re-renders the 'edit' template" do
        saved_company = SavedCompany.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SavedCompany.any_instance.stub(:save).and_return(false)
        put :update, {:id => saved_company.to_param, :saved_company => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested saved_company" do
      saved_company = SavedCompany.create! valid_attributes
      expect {
        delete :destroy, {:id => saved_company.to_param}, valid_session
      }.to change(SavedCompany, :count).by(-1)
    end

    it "redirects to the saved_companies list" do
      saved_company = SavedCompany.create! valid_attributes
      delete :destroy, {:id => saved_company.to_param}, valid_session
      response.should redirect_to(saved_companies_url)
    end
  end

end