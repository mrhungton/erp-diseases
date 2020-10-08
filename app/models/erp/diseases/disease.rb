module Erp::Diseases
  class Disease < ApplicationRecord
    include Erp::CustomOrder
		
    belongs_to :creator, class_name: "Erp::User"
    belongs_to :category
    mount_uploader :image, Erp::Diseases::DiseaseUploader

    # get articles active
    def self.get_active
			self.where(published: true)
		end

    # Filters
    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []

      # show published items condition - default: false
			#show_published = false

			#filters
			if params["filters"].present?
				params["filters"].each do |ft|
					or_conds = []
					ft[1].each do |cond|
						# in case filter is show published
						#if cond[1]["name"] == 'show_published'
							# show published items
							#show_published = true
						#else
							or_conds << "#{cond[1]["name"]} = '#{cond[1]["value"]}'"
						#end
					end
					and_conds << '('+or_conds.join(' OR ')+')' if !or_conds.empty?
				end
			end

      #keywords
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end

      # join with categories table for search with category
      query = query.joins(:category)
      
      # global filter
      global_filter = params[:global_filter]
      if global_filter.present?
				if global_filter[:category_id].present?
					query = query.where(category_id: global_filter[:category_id])
				end
			end

      # join with users table for search creator
      query = query.joins(:creator)

      # showing published items if show_published is not true
			#query = query.where(published: false) if show_published == false

      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?

      return query
    end

    def self.search(params)
      query = self.all
      query = self.filter(query, params)

      # order
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?

        query = query.order(order)
      end

      return query
    end

    # data for dataselect ajax
    def self.dataselect(keyword='')
      query = self.all

      if keyword.present?
        keyword = keyword.strip.downcase
        query = query.where('LOWER(name) LIKE ?', "%#{keyword}%")
      end

      query = query.limit(8).map{|article| {value: article.id, text: article.name} }
    end

    def publish
			update_columns(published: true)
		end

		def unpublish
			update_columns(published: false)
		end

    def self.publish_all
			update_all(published: true)
		end

    def self.unpublish_all
			update_all(published: false)
		end

    def category_id
      category.present? ? category.id : ''
    end

    def category_name
      category.present? ? category.name : ''
    end

    def post_by
			creator.present? ? creator.name : ''
		end
  end
end
