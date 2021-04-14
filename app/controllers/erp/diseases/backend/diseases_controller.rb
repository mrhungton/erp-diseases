module Erp
  module Diseases
    module Backend
      class DiseasesController < Erp::Backend::BackendController
        before_action :set_disease, only: [:publish, :unpublish, :show, :edit, :update, :destroy, :move_up, :move_down]
        before_action :set_diseases, only: [:delete_all, :publish_all, :unpublish_all]

        # GET /diseases
        def list
          @diseases = Disease.search(params).paginate(:page => params[:page], :per_page => 10)

          render layout: nil
        end

        # GET /diseases/1
        def show
        end

        # GET /diseases/new
        def new
          @disease = Disease.new

          if request.xhr?
            render '_form', layout: nil, locals: {disease: @disease}
          end
        end

        # GET /diseases/1/edit
        def edit
        end

        # POST /diseases
        def create
          @disease = Disease.new(disease_params)
          @disease.creator = current_user

          if @disease.save
            if request.xhr?
              render json: {
                status: 'success',
                text: @disease.id,
                value: @disease.name
              }
            else
              redirect_to erp_diseases.edit_backend_disease_path(@disease), notice: t('.success')
            end
          else
            if request.xhr?
              render '_form', layout: nil, locals: {disease: @disease}
            else
              render :new
            end
          end
        end

        # PATCH/PUT /diseases/1
        def update
          if @disease.update(disease_params)
            if request.xhr?
              render json: {
                status: 'success',
                text: @disease.id,
                value: @disease.name
              }
            else
              redirect_to erp_diseases.edit_backend_disease_path(@disease), notice: t('.success')
            end
          else
            render :edit
          end
        end

        # DELETE /diseases/1
        def destroy
          @disease.destroy

          respond_to do |format|
            format.html { redirect_to erp_diseases.backend_diseases_path, notice: t('.success') }
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        # DELETE /diseases/delete_all?ids=1,2,3
        def delete_all
          @diseases.destroy_all

          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        # publish /diseases/publish?id=1
        def publish
          @disease.publish

          respond_to do |format|
          format.json {
            render json: {
            'message': t('.success'),
            'type': 'success'
            }
          }
          end
        end

        # Unpublish /diseases/unpublish?id=1
        def unpublish
          @disease.unpublish

          respond_to do |format|
          format.json {
            render json: {
            'message': t('.success'),
            'type': 'success'
            }
          }
          end
        end

        # publish /diseases/publish_all?ids=1,2,3
        def publish_all
          @diseases.publish_all

          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        # Unpublish /diseases/unpublish_all?ids=1,2,3
        def unpublish_all
          @diseases.unpublish_all

          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        # dataselect /diseases
        def dataselect
          respond_to do |format|
            format.json {
              render json: Disease.dataselect(params[:keyword])
            }
          end
        end

        # Move up /categories/up?id=1
        def move_up
          @disease.move_up

          respond_to do |format|
          format.json {
            render json: {
            #'message': t('.success'),
            #'type': 'success'
            }
          }
          end
        end

        # Move down /categories/up?id=1
        def move_down
          @disease.move_down

          respond_to do |format|
          format.json {
            render json: {
            #'message': t('.success'),
            #'type': 'success'
            }
          }
          end
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_disease
            @disease = Disease.find(params[:id])
          end

          def set_diseases
            @diseases = Disease.where(id: params[:ids])
          end

          # Only allow a trusted parameter "white list" through.
          def disease_params
            params.fetch(:disease, {}).permit(:image, :name, :description, :definition, :reason, :symptoms, :treatment,
              :meta_keywords, :meta_description, 
              :tags, :category_id,
              :diseases_products_attributes => [ :id, :disease_id, :product_id, :_destroy ],
            )
          end
      end
    end
  end
end
