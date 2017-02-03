# frozen_string_literal: true
module API
  module V1
    class UsersApi < Grape::API
      helpers API::ParamsHelper

      helpers do
        params :user_params do
          requires :first_name, type: String, desc: "user first_name"
          requires :last_name, type: String, desc: "user last_name"
          requires :email, type: String, desc: "user email"
          optional :gender, type: String, desc: "user gender"
          optional :tel_num, type: String, desc: "user telephone number"
          optional :date_of_birth, type: Date, desc: "user birth year"
          optional :avatar, type: Hash do
            optional :filename, type: String
            optional :type, type: String
            optional :name, type: String
            optional :tempfile
            optional :head, type: String
          end
        end

        def user
          @user ||= User.find(params[:id])
        end

        def user_with_includes
          @user_with_includes ||= User.includes(:cars, rides_as_driver: :car).find(params[:id])
        end
      end

      resource :users do
        desc "Return list of users"
        params do
          use :pagination_params
        end
        get do
          users = User.all.order(:created_at)
          results = paginated_results(users, params[:page], params[:per])
          present results[:collection],
                  with: Entities::UsersIndex,
                  pagination: results[:meta]
        end

        desc "Create user"
        params do
          use :user_params
          requires :password, type: String, desc: "user password"
          requires :password_confirmation, type: String, desc: "user password confirmation"
        end
        post do
          data = declared(params)
          user = UserCreator.new(data).call
          if user.valid?
            present user, with: Entities::UserProfile
          else
            status 406
            user.errors.messages
          end
        end

        desc "Checks if user email is unique"
        params do
          requires :email, type: String, desc: "user email"
        end
        get :check_if_unique do
          data = declared(params)
          errors = EmailUniquenessChecker.new(data, current_user).call
          errors
        end

        params do
          requires :id, type: Integer, desc: "user id"
        end
        route_param :id do
          desc "Return user profile"
          get :profile do
            present user, with: Entities::UserProfile
          end

          desc "Return user profile with cars and rides_as_driver"
          get do
            present user_with_includes, with: Entities::UserShow
          end

          desc "Update user"
          params do
            use :user_params
          end
          put do
            authenticate!
            data = declared(params)
            user = UserUpdater.new(data, current_user).call
            if user.valid?
              present user, with: Entities::UserProfile
            else
              status 406
              user.errors.messages
            end
          end

          desc "Return user rides as driver"
          params do
            use :pagination_params
          end
          get :rides_as_driver do
            rides = user.rides_as_driver.includes(:car)
            results = paginated_results(rides, params[:page], params[:per])
            present results[:collection],
                    with: Entities::RidesAsDriver,
                    pagination: results[:meta]
          end

          desc "Return user rides as passenger"
          params do
            use :pagination_params
          end
          get :rides_as_passenger do
            authenticate!
            rides = user.ride_requests.includes(ride: [:driver, :car])
            results = paginated_results(rides, params[:page], params[:per])
            present results[:collection],
                    with: Entities::RidesAsPassenger,
                    pagination: results[:meta]
          end
        end
      end
    end
  end
end
