module ArticlesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_articles_path
    elsif action_name == 'edit'
      article_path
    end
  end

  def render_with_hashtags(hashtag)
    hashtag.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/article/hashtag/#{word.delete("#")}"}.html_safe
  end
end
