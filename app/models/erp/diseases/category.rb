module Erp::Diseases
  class Category < ApplicationRecord
    include Erp::CustomOrder
		
    belongs_to :creator, class_name: "Erp::User"
    belongs_to :parent, class_name: "Erp::Diseases::Category", optional: true
    has_many :children, class_name: "Erp::Diseases::Category", foreign_key: "parent_id"
    has_many :diseases, class_name: "Erp::Diseases::Disease"
    validates :name, :presence => true
    
    # get categories active
    def self.get_active
			self.where(published: true)
		end
    
    # Filters
    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []
      
      # show published items condition - default: false
			show_published = true
			
			#filters
			if params["filters"].present?
				params["filters"].each do |ft|
					or_conds = []
					ft[1].each do |cond|
						# in case filter is show published
						if cond[1]["name"] == 'show_published'
							# show published items
							show_published = false
						else
							or_conds << "#{cond[1]["name"]} = '#{cond[1]["value"]}'"
						end
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
      
      # showing published items if show_published is not true
			query = query.where(published: true) if show_published == true

      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?
      
      # global filter
      global_filter = params[:global_filter]

      if global_filter.present?

				# filter by alias
				if global_filter[:alias].present?
					query = query.where(alias: global_filter[:alias])
				end

			end
      # end// global filter
      
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
      
      query = query.limit(20).map{|category| {value: category.id, text: (category.parent_name.empty? ? '' : "#{category.parent_name} / ") + category.name} }
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
    
    # display name
    def parent_name
			parent.present? ? parent.name : ''
		end
		
		# display name with parent
    def full_name
			names = [self.name]
			p = self.parent
			while !p.nil? do
				names << p.name
				p = p.parent
			end
			names.reverse.join(" / ")
		end
  end
end
