ActiveAdmin.register_page "Schedule" do
  menu priority: 3
  content do
    para 'hello'
    5.times do |_count|
      ul do
        li style: 'color:red' do
          _count
        end
      end
    end
  end
end