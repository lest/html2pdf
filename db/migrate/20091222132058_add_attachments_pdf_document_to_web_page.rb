class AddAttachmentsPdfDocumentToWebPage < ActiveRecord::Migration
  def self.up
    add_column :web_pages, :pdf_document_file_name, :string
    add_column :web_pages, :pdf_document_content_type, :string
    add_column :web_pages, :pdf_document_file_size, :integer
    add_column :web_pages, :pdf_document_updated_at, :datetime
  end

  def self.down
    remove_column :web_pages, :pdf_document_file_name
    remove_column :web_pages, :pdf_document_content_type
    remove_column :web_pages, :pdf_document_file_size
    remove_column :web_pages, :pdf_document_updated_at
  end
end
