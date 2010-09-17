module Netzke
  class SomeBorderLayout < Widget::BorderLayoutPanel
    def config
      {
        :items => [
          {:title => "Who", :class_name => "Widget::GridPanel", :region => :center, :model => "User"},
          {:title => "Item Two", :class_name => "Widget::GridPanel", :region => :west, :width => 500, :split => true, :model => "Role"}
        ],
        :bbar => [:update_west_region.ext_action, :update_center_region.ext_action]
      }.deep_merge(super)
    end
    
    def actions
      {
        :update_center_region => {:text => "UpdateCenterRegion"},
        :update_west_region => {:text => "UpdateWestRegion"},
      }
    end
    
    def self.js_properties
      {
        :on_update_west_region => <<-END_OF_JAVASCRIPT.l,
          function(){
            this.getWestWidget().body.update('Updated West Region Content');
          }
        END_OF_JAVASCRIPT
        
        :on_update_center_region => <<-END_OF_JAVASCRIPT.l,
          function(){
            this.getCenterWidget().body.update('Updated Center Region Content');
          }
        END_OF_JAVASCRIPT
        
      }
    end
    
  end
end