class ImagePicker

  def pick(path)
    sanity_check(path)
    images = get_images(path)
    return images.sample
  end

  def get_images(path)
    images = Dir.entries(path)
    images.delete_if { |x| x == '.' }
    images.delete_if { |x| x == '..' }
    raise 'directory is empty' if images.length == 0
    return images
  end

  def sanity_check(path)
    raise 'directory not found' if not File.directory?(path)
  end
end
