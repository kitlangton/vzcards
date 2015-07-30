class SiliconWorker
  include Sidekiq::Worker
    def perform(card_id)
      card = Card.find(card_id)
      silicon = SiliconMan.new
      card.instance_id = silicon.create_instance(template_id: card.template.ids_id,input: card.variables)
      card.image_from_url(silicon.pdf_url)
      card.save
    end
end
