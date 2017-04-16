module CreaturesHelper
  def creature_card(creature)
    %Q*
    <div class="col xl3 l4 m6 s12">
      <div id="creature-#{creature.id}" class="card small creature-card">
        <div class="card-image">
        #{ image_tag creature.image_url }
        </div>
        <div class="card-content">
          Breed: #{ link_to creature.breed, creature_path(creature) }<br>
          Price: #{ creature.price }<br>
        </div>
        <div class="cart-action">
          #{ button_to "Add to Cart", cart_path(creature_id: creature.id) }
        </div>
      </div>
    </div>
    *.html_safe
  end
end
