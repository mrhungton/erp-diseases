Erp::Diseases::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
		namespace :backend, module: "backend", path: "backend/diseases" do
      resources :diseases do
        collection do
          post 'list'
          post 'dataselect'
          delete 'delete_all'
          put 'publish_all'
          put 'unpublish_all'
          put 'publish'
          put 'unpublish'
          put 'move_up'
          put 'move_down'
        end
      end
      resources :categories do
        collection do
          post 'list'
          post 'dataselect'
          delete 'delete_all'
          put 'publish_all'
          put 'unpublish_all'
          put 'publish'
          put 'unpublish'
          put 'move_up'
          put 'move_down'
        end
      end
      resources :diseases_products do
				collection do
          get 'diseases_product_line_form'
				end
			end
    end
  end
end