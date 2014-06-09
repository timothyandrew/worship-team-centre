class RosterDrawService
  def initialize(roster)
    @roster = roster
  end

  def generate_image
    base_image = File.join(Rails.root, "app", "assets", "images", "roster-base.jpg")
    img = Magick::Image::read(base_image).first

    # FIRST HALF

    text.annotate(img, 100,30,88,260, @roster.leader(:morning))
    text.annotate(img, 100,30,285,260, @roster.keyboard(:morning))
    text.annotate(img, 100,30,472,260, @roster.powerpoint(:morning))

    text.annotate(img, 100,30,88,350, @roster.guitar(:morning))
    text.annotate(img, 100,30,280,350, @roster.bass(:morning))
    text.annotate(img, 100,30,480,350, @roster.drums(:morning))

    text.annotate(img, 100,30,105,450, @roster.singing(:morning))


    # SECOND HALF

    text.annotate(img, 100,30,88,615, @roster.leader(:evening))
    text.annotate(img, 100,30,285,615, @roster.keyboard(:evening))
    text.annotate(img, 100,30,472,615, @roster.powerpoint(:evening))

    text.annotate(img, 100,30,88,705, @roster.guitar(:evening))
    text.annotate(img, 100,30,280,705, @roster.bass(:evening))
    text.annotate(img, 100,30,480,705, @roster.drums(:evening))

    text.annotate(img, 100,30,105,805, @roster.singing(:evening))

    # HEADERS

    header.annotate(img, 100,30,78,160, "#{@roster.date} Morning")
    header.annotate(img, 100,30,78,520, "#{@roster.date} Evening")

    # TOP HEADER
    top_header.annotate(img, 100,30,35,86, "#{@roster.date.strftime("%B %Y")}")

    img
  end

  private

  def top_header
    return @top_header if @top_header
    @top_header = Magick::Draw.new
    @top_header.gravity = Magick::CenterGravity
    @top_header.pointsize = 25
    @top_header.font_weight = Magick::BoldWeight
    @top_header.font_family = "helvetica"
    @top_header.stroke = 'transparent'
    @top_header.fill = 'white'
    @top_header
  end

  def header
    return @header if @header
    @header = Magick::Draw.new
    @header.gravity = Magick::CenterGravity
    @header.pointsize = 16
    @header.font_weight = Magick::BoldWeight
    @header.font_family = "helvetica"
    @header.stroke = 'transparent'
    @header.fill = 'white'   
    @header
  end

  def text
    return @text if @text
    @text = Magick::Draw.new
    @text.gravity = Magick::CenterGravity
    @text.pointsize = 16
    @text.font_weight = Magick::BoldWeight
    @text.font_family = "helvetica"
    @text.stroke = 'transparent'
    @text.align = Magick::LeftAlign
    @text
  end
end
