# Ruby on Rails with MySQL Restul API learned from https://www.youtube.com/watch?v=QojnRc7SS9o
# The mysql database "myarticles neededs to be created in advance"
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

          # http://localhost:3000/api/v1/articles          
        #   JSON
        #   {
        #     "title": "A Title",
        #     "body": "A Body"
        #   }
          def create
            article = Article.new(article_params)
    
            if article.save
              render json: {status: 'SUCCESS', message:'Saved article', data:article},status: :ok
            else
              render json: {status: 'ERROR', message:'Article not saved', data:article.errors},status: :unprocessable_entity
            end
          end

          # http://localhost:3000/api/v1/articles/6
          def destroy
            article = Article.find(params[:id])
            article.destroy
            render json: {status: 'SUCCESS', message:'Deleted article', data:article},status: :ok
          end
    
          # http://localhost:3000/api/v1/articles/1
          # JSON
        #   {
        #     "title": "Updated title"
        #   }
          def update
            article = Article.find(params[:id])
            if article.update_attributes(article_params)
              render json: {status: 'SUCCESS', message:'Updated article', data:article},status: :ok
            else
              render json: {status: 'ERROR', message:'Article not updated', data:article.errors},status: :unprocessable_entity
            end
          end

          private def article_params
                params.permit(:title, :body)
          end

        end
    end
end