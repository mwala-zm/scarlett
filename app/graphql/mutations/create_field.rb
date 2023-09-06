module Mutations
  class CreateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true
    field :errors, [String], "List of ActiveModel errors", null: false

    argument :attributes, Types::Input::FieldInput, required: true
    argument :monitor_area, [[GraphQL::Types::String]], required: true

    def resolve(attributes:)
      attributes = attributes.to_h
      unless attributes[:monitor_area].nil?
        # Build GEOM object.
        # Check if spray area is a Polygon. Cannot be a line.
        geo_string = "MULTIPOLYGON("
        attributes[:monitor_area].each do |point|
          geo_string << ("#{point[0].sub(",", " ")}, ")
        end
        geo_string = geo_string.chop.chop! # Remove last comma.
        geo_string << ")"
        attributes[:monitor_area] = geo_string
        geom =
          RGeo::Cartesian.factory(srid: 4326).parse_wkt(attributes[:monitor_area])
        attributes[:monitor_area] = geom
      end
      attributes.to_h[:user] = User.find_by! id: context[:current_resource].id
      model = Field.new(attributes.to_h)

      if model.save
        { field: model, errors: model.errors.full_messages }
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
