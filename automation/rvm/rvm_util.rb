def gemset_name(gemset)
  gemset = gemset.gsub(/[\/\-\s]/,'_')
  gemset = gemset.gsub(/_{2,}/,'_')
  gemset = gemset.slice(1, gemset.length)
  gemset.downcase
end
