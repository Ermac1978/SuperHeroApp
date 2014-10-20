json.array!(@super_heros) do |super_hero|
  json.extract! super_hero, :id, :hero_name, :secret_identity, :powers, :team
  json.url super_hero_url(super_hero, format: :json)
end
