
ruby config.rb

for i in `ls all*`
do
  erb file=$i workflows.yaml > ../workflows/$i
done
