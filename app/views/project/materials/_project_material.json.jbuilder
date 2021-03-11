json.extract! project_material, :id, :name, :cost, :total, :project_id, :created_at, :updated_at
json.url project_material_url(project_material, format: :json)
