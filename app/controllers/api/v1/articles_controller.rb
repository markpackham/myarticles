module Api
    # has to be a captial V for v1 since it demands a constant
    module V1
      class ArticlesController < ApplicationController
        # http://localhost:3000/api/v1/articles
        def index
            articles = Article.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Loaded articles', data:articles},status: :ok
          end

          # http://localhost:3000/api/v1/articles/1
          def show
            article = Article.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded article', data:article},status: :ok
          end

        end
    end
end