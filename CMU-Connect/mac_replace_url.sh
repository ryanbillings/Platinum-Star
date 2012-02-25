IP_ADDRESS=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
cd app
cd helpers
sed -i '' "s/[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}/$IP_ADDRESS/g" application_helper.rb
cd ..
cd assets
cd javascripts
sed -i '' "s/[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}/$IP_ADDRESS/g" application.js
cd ..
cd ..
cd views
cd layouts
sed -i '' "s/[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}/$IP_ADDRESS/g" application.html.erb
