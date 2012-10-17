class AddResorts < ActiveRecord::Migration
  def up
    Resort.create(
      [
        {
          name:'First hotel',
          latitude: '37.4318',
          longitude: '10.231'
        },
        {
          name:'Second hotel',
          latitude: '47.4318',
          longitude: '12.231'
        },
        {
          name:'Third hotel',
          latitude: '57.4318',
          longitude: '13.231'
        }
      ])
  end

  def down
    Resort.where(name: ["First hotel", "Second hotel", "Third hotel"]).destroy_all
  end

end
