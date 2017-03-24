class EstimationRoundRepository < Hanami::Repository
  def last_by_story(story)
    recent_story_rounds(story).limit(1).first
  end

  def story_rounds(story)
    estimation_rounds.where(story_id: story.id).order(:created_at)
  end

  def recent_story_rounds(story)
    story_rounds(story).reverse
  end
end
