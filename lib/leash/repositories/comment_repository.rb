class CommentRepository < Hanami::Repository

  def by_entry_id(entry_id)
    comments.where(entry_id: entry_id).order{ created_at.desc }
  end
end
