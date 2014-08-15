class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :headquarters
      t.text :job_description
      t.text :how_to_apply
      t.string :company_name
      t.string :company_url
      t.string :email
      t.boolean :highlight
      t.boolean :paid

      t.timestamps
    end
  end
end
