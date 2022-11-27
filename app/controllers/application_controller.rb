class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    Bakery.all.to_json

  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)

  end

  get '/baked_goods/by_price'do
    baked_goods = BakedGood.all.sort_by { |good| good.price}
    baked_goods.reverse.to_json

end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.sort_by { |good| good.price}
    baked_goods.reverse.first.to_json
  end

end
