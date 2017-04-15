module CreaturesHelper
  def creature_card(creature)
    %Q*
    <div class="col l3 m4 s6 xs12">
      <div id="creature-#{creature.id}" class="card small">
        <div class="card-image" style="background-image: url('#{creature.image_url}')">

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
