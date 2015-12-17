
def getnum
  '20151010121110'
end


class ImageFile
  Basedir = '.'

  def initialize file, basedir = Basedir
    @file = file.tempfile
    @filename = file.original_filename
    @basedir = basedir
  end

  def name new_filename = nil
    @org_filename = @filename
    @filename = new_filename || getnum

    self
  end

  def resize
    image = Magick::Image.read(@file.path)
    image.resize 0.5
    @file = Tempfile.open "_#{@filename}";
    image.write @file

    self
  end

  def store
    `@file.path @basedir/@filename`

    self
  end
end

