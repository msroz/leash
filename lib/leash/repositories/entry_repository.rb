class EntryRepository < Hanami::Repository

  def order_desc_by_created_at
    entries.order { created_at.desc }
  end
end
