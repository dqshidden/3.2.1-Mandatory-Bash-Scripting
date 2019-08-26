read -p 'IP Adress: ' adress
touch adress.txt
echo $adress > adress.txt
adressForm=`cut --complement -d "." -f 4 adress.txt`
cat adress.txt
rm adress.txt
c=0
touch replied.txt
echo "Ip's which replied: " > replied.txt
for i in {0..255}
do
if ping -c 1 -w 1 $adressForm.$i &> /dev/null

    then
        echo "Success"
        
        echo "$adressForm.$i" >> replied.txt
    else
        echo "Fail"
    fi
done
cat replied.txt
rm replied.txt
