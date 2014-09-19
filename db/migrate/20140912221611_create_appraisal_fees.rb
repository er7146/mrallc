class CreateAppraisalFees < ActiveRecord::Migration
  def change
    create_table :appraisal_fees do |t|
      t.text  :description
      t.string  :fee
      t.timestamps
    end
  end
end
