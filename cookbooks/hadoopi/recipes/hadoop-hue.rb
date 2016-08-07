user "hue"

remote_file "/opt/hue-3.10.0.armf.tar.gz" do
    source "http://192.168.0.9:8000/hue-3.10.0.armf.tar.gz"
    action :create_if_missing
end

execute "unpack hue" do
        command "tar -zxvf /opt/hue-3.10.0.armf.tar.gz -C /opt/"
        user "root"
end

execute "Chown hue" do
        command "chown hue.hue -R /opt/hue"
        user "root"
end

template "/opt/hue/desktop/conf/hue.ini" do
        source "hue.ini.erb"
        mode 0644
        user 'hue'
        group 'hue'
end
