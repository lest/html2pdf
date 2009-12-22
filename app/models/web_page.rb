class WebPage < ActiveRecord::Base
  has_attached_file :pdf_document

  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))

  def after_create
    self.send_later :generate_pdf
  end

  def generate_pdf
    filename = "/tmp/#{APP_CONFIG[:domain]}.#{self.id}.pdf"
    system(APP_CONFIG[:wkhtmltopdf_binary_path], self.url, filename, '-q')

    File.open(filename) { |f| self.pdf_document = f; self.save }
    File.unlink(filename)
  end
end
